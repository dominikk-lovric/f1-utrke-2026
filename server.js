const express = require("express");
const { Pool, types } = require("pg");

types.setTypeParser(1082, (v) => v);

const pool = new Pool({
    host: process.env.DB_HOST || "localhost",
    port: Number(process.env.DB_PORT) || 5432,
    user: process.env.DB_USER || "lab_reader",
    database: process.env.DB_NAME || "f1_open_data",
});

const app = express();
app.use(express.static("public"));
app.use("/data", express.static("data"));
app.use(express.static("public"));
app.use("/scripts", express.static("scripts"));

const COLUMNS = [
    "season",
    "round",
    "race",
    "race_date",
    "laps",
    "circuit",
    "country",
    "length_km",
    "p1_driver",
    "p1_team",
    "p2_driver",
    "p2_team",
    "p3_driver",
    "p3_team",
];

const BASE_QUERY = `
  SELECT r.race_id, r.season, r.round, r.name AS race, r.race_date, r.laps,
         c.name AS circuit, c.country, c.length_km,
         MAX(CASE WHEN res.position = 1 THEN d.name || ' ' || d.surname END) AS p1_driver,
         MAX(CASE WHEN res.position = 1 THEN k.name END) AS p1_team,
         MAX(CASE WHEN res.position = 2 THEN d.name || ' ' || d.surname END) AS p2_driver,
         MAX(CASE WHEN res.position = 2 THEN k.name END) AS p2_team,
         MAX(CASE WHEN res.position = 3 THEN d.name || ' ' || d.surname END) AS p3_driver,
         MAX(CASE WHEN res.position = 3 THEN k.name END) AS p3_team
  FROM races r
  JOIN circuits c ON c.circuit_id = r.circuit_id
  LEFT JOIN results res ON res.race_id = r.race_id
  LEFT JOIN drivers d ON d.driver_id = res.driver_id
  LEFT JOIN constructors k ON k.constructor_id = res.constructor_id
  GROUP BY r.race_id, c.circuit_id
`;

async function queryRaces(search, field) {
    const params = [];
    let where = "";
    if (search) {
        params.push(`%${search}%`);
        const cols = COLUMNS.includes(field) ? [field] : COLUMNS;
        where =
            "WHERE " + cols.map((c) => `t.${c}::text ILIKE $1`).join(" OR ");
    }
    const sql = `SELECT * FROM (${BASE_QUERY}) t ${where} ORDER BY t.season, t.round`;
    const { rows } = await pool.query(sql, params);
    return rows;
}

function toCsv(rows) {
    const cols = ["race_id", ...COLUMNS];
    const esc = (v) => {
        const s = v == null ? "" : String(v);
        return /[",\n]/.test(s) ? `"${s.replace(/"/g, '""')}"` : s;
    };
    return [
        cols.join(","),
        ...rows.map((r) => cols.map((c) => esc(r[c])).join(",")),
    ].join("\n");
}

app.get("/api/races", async (req, res) => {
    try {
        const rows = await queryRaces(
            (req.query.search || "").trim(),
            req.query.field,
        );
        if (req.query.format === "csv") {
            return res
                .attachment("f1_races_filtered.csv")
                .type("text/csv")
                .send(toCsv(rows));
        }
        if (req.query.format === "json") {
            return res
                .attachment("f1_races_filtered.json")
                .type("application/json")
                .send(JSON.stringify(rows, null, 2));
        }
        res.json(rows);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: "Database error" });
    }
});

app.listen(3000, () => console.log("http://localhost:3000"));
