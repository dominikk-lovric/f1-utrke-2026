const COLS = [
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
const form = document.getElementById("filter");
const q = document.getElementById("q");
const field = document.getElementById("field");

function params() {
    return new URLSearchParams({
        search: q.value.trim(),
        field: field.value,
    });
}

async function load() {
    const p = params();
    document.getElementById("dl-csv").href = "/api/races?" + p + "&format=csv";
    document.getElementById("dl-json").href =
        "/api/races?" + p + "&format=json";

    const res = await fetch("/api/races?" + p);
    const rows = await res.json();

    const thead = document.querySelector("thead");
    const tbody = document.querySelector("tbody");
    thead.innerHTML = "";
    tbody.innerHTML = "";

    const hr = thead.insertRow();
    COLS.forEach((c) => {
        const th = document.createElement("th");
        th.textContent = c;
        hr.appendChild(th);
    });

    rows.forEach((r) => {
        const tr = tbody.insertRow();
        COLS.forEach((c) => {
            tr.insertCell().textContent = r[c];
        });
    });
}

form.addEventListener("submit", (e) => {
    e.preventDefault();
    load();
});
load();
