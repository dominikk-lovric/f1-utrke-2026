--
-- PostgreSQL database dump
--

\restrict idZ3OorSMMHcqOVLe74QSHC0lTtIeS1NZvKPpY0Vfmu1CPO44FlvzlCNW5XIjwb

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: circuits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.circuits (
    circuit_id integer NOT NULL,
    name character varying(100) NOT NULL,
    country character varying(60) NOT NULL,
    locality character varying(100),
    length_km numeric(5,3)
);


ALTER TABLE public.circuits OWNER TO postgres;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.circuits_circuit_id_seq OWNER TO postgres;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits.circuit_id;


--
-- Name: constructors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constructors (
    constructor_id integer NOT NULL,
    name character varying(80) NOT NULL,
    nationality character varying(60)
);


ALTER TABLE public.constructors OWNER TO postgres;

--
-- Name: constructors_constructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.constructors_constructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.constructors_constructor_id_seq OWNER TO postgres;

--
-- Name: constructors_constructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.constructors_constructor_id_seq OWNED BY public.constructors.constructor_id;


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    driver_id integer NOT NULL,
    name character varying(60) NOT NULL,
    surname character varying(60) NOT NULL,
    code character(3),
    number smallint,
    dob date,
    nationality character varying(60)
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- Name: drivers_driver_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drivers_driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drivers_driver_id_seq OWNER TO postgres;

--
-- Name: drivers_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drivers_driver_id_seq OWNED BY public.drivers.driver_id;


--
-- Name: races; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.races (
    race_id integer NOT NULL,
    season smallint NOT NULL,
    round smallint NOT NULL,
    name character varying(100) NOT NULL,
    race_date date NOT NULL,
    laps smallint,
    circuit_id integer NOT NULL
);


ALTER TABLE public.races OWNER TO postgres;

--
-- Name: races_race_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.races_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.races_race_id_seq OWNER TO postgres;

--
-- Name: races_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.races_race_id_seq OWNED BY public.races.race_id;


--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results (
    result_id integer NOT NULL,
    race_id integer NOT NULL,
    driver_id integer NOT NULL,
    constructor_id integer NOT NULL,
    "position" smallint,
    points smallint,
    status character varying(40)
);


ALTER TABLE public.results OWNER TO postgres;

--
-- Name: results_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.results_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.results_result_id_seq OWNER TO postgres;

--
-- Name: results_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.results_result_id_seq OWNED BY public.results.result_id;


--
-- Name: circuits circuit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.circuits ALTER COLUMN circuit_id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: constructors constructor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constructors ALTER COLUMN constructor_id SET DEFAULT nextval('public.constructors_constructor_id_seq'::regclass);


--
-- Name: drivers driver_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers ALTER COLUMN driver_id SET DEFAULT nextval('public.drivers_driver_id_seq'::regclass);


--
-- Name: races race_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races ALTER COLUMN race_id SET DEFAULT nextval('public.races_race_id_seq'::regclass);


--
-- Name: results result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results ALTER COLUMN result_id SET DEFAULT nextval('public.results_result_id_seq'::regclass);


--
-- Data for Name: circuits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.circuits (circuit_id, name, country, locality, length_km) FROM stdin;
1	Albert Park Circuit	Australia	Melbourne	5.278
2	Shanghai International Circuit	China	Shangai	5.451
3	Suzuka International Racing Course	Japan	Suzuka	5.807
4	Miami International Autodrome	USA	Miami	5.412
5	Circuit Gilles Villeneuve	Canada	Montreal	4.361
6	Circuit de Monaco	Monaco	Monte Carlo	3.337
7	Circuit de Barcelona-Catalunya	Spain	Barcelona	4.657
8	Red Bull Ring	Austria	Spielberg	4.318
9	Silverstone Circuit	United Kingdom	Silverstone	5.891
10	Circuit de Spa-Francorchamps	Belgium	Stavelot	7.004
11	Hungaroring	Hungary	Mogyorod	4.381
12	Circuit Zandvoort	Netherlands	Zandvoort	4.259
13	Autodromo Nazionale di Monza	Italy	Monza	5.793
14	Madring	Spain	Barajas	5.414
16	Bahrain International Circuit	Bahrain	Sakhir	5.412
17	Marina Bay Street Circuit	Singapore	Marina Bay	4.940
18	Circuit of the Americas	USA	Austin	5.513
19	Autódromo Hermanos Rodríguez	Mexico	Mexico City	4.304
20	Autodromo José Carlos Pace	Brazil	Sao Paulo	4.309
21	Las Vegas Strip Circuit	USA	Paradise	6.201
22	Lusail International Circuit	Qatar	Lusail	5.419
23	Yas Marina Circuit	UAE	Abu Dhabi	5.281
15	Baku City Circuit	Azerbaijan	Baku	6.003
\.


--
-- Data for Name: constructors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constructors (constructor_id, name, nationality) FROM stdin;
1	Alpine	French
2	Aston Martin	British
3	Audi	German
4	Cadillac	American
5	Ferrari	Italian
6	Haas	American
7	McLaren	British
8	Mercedes	German
9	Racing Bulls	Italian
10	Red Bull Racing	Austrian
11	Williams	British
\.


--
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drivers (driver_id, name, surname, code, number, dob, nationality) FROM stdin;
2	Kimi	Antonelli	ANT	12	2006-08-25	Italian
3	Charles	Leclerc	LEC	16	1997-10-16	Monegasque
4	Lewis	Hamilton	HAM	44	1985-01-07	British
5	Max	Verstappen	VER	3	1997-09-30	Dutch
6	Isack	Hadjar	HAD	6	2004-09-28	French
7	Lando	Norris	NOR	1	1999-11-13	British
8	Oscar	Piastri	PIA	81	2001-04-06	Australian
9	Liam	Lawson	LAW	30	2002-02-11	New Zelander
10	Arvid	Lindblad	LIN	44	2007-08-08	British
11	Pierre	Gasly	GAS	10	1996-02-07	French
12	Franco	Colapinto	COL	43	2003-05-27	Argentinian
13	Esteban	Ocon	OCO	31	1996-08-17	French
14	Oliver	Bearman	BEA	87	2005-05-08	British
15	Nico	Hulkenberg	HUL	27	1987-08-19	German
16	Gabriel	Bortoleto	BOR	5	2005-10-14	Brazilian
17	Carlos	Sainz	SAI	55	1994-09-01	Spanish
18	Alexander	Albon	ALB	23	1996-03-23	Thai
19	Fernando	Alonso	ALO	14	1981-07-29	Spanish
20	Lance	Stroll	STR	18	1998-10-29	Canadian
21	Sergio	Perez	PER	11	1990-01-26	Mexican
22	Valtteri	Bottas	BOT	77	1989-08-28	Finnish
1	George	Russell	RUS	63	1998-02-15	British
\.


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.races (race_id, season, round, name, race_date, laps, circuit_id) FROM stdin;
1	2026	1	Australian Grand Prix	2026-03-08	58	1
2	2026	2	Chinese Grand Prix	2026-03-15	56	2
3	2026	3	Japanese Grand Prix	2026-03-29	53	3
4	2026	4	Miami Grand Prix	2026-05-03	57	4
5	2026	5	Canadian Grand Prix	2026-05-24	70	5
6	2026	6	Monaco Grand Prix	2026-06-07	78	6
7	2026	7	Barcelona Grand Prix	2026-06-14	66	7
8	2026	8	Austrian Grand Prix	2026-06-28	71	8
9	2026	9	British Grand Prix	2026-07-05	52	9
10	2026	10	Belgian Grand Prix	2026-07-19	44	10
11	2026	11	Hungarian Grand Prix	2026-07-26	70	11
12	2026	12	Dutch Grand Prix	2026-08-23	72	12
13	2026	13	Italian Grand Prix	2026-09-06	53	13
14	2026	14	Spanish Grand Prix	2026-09-13	57	14
15	2026	16	Bahrain Grand Prix	2026-10-04	56	16
16	2026	17	Singapore Grand Prix	2026-10-11	62	17
17	2026	18	United States Grand Prix	2026-10-19	56	18
18	2026	19	Mexican Grand Prix	2026-10-26	71	19
19	2026	20	Brazilian Grand Prix	2026-11-09	71	20
20	2026	21	Las Vegas Grand Prix	2026-11-23	50	21
21	2026	22	Qatar Grand Prix	2026-11-30	57	22
22	2026	23	Abu Dhabi Grand Prix	2026-12-07	58	23
23	2026	15	Azerbaijan Grand Prix	2026-09-26	51	15
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.results (result_id, race_id, driver_id, constructor_id, "position", points, status) FROM stdin;
1	17	2	8	1	25	Finished
2	16	2	8	3	15	Finished
3	15	2	8	2	18	Finished
4	14	2	8	1	25	Finished
5	13	2	8	1	25	Finished
6	12	2	8	2	18	Finished
7	11	2	8	3	15	Finished
8	10	2	8	1	25	Finished
9	8	2	8	3	15	Finished
10	6	2	8	1	25	Finished
11	5	2	8	1	25	Finished
12	4	2	8	1	25	Finished
13	3	2	8	1	25	Finished
14	2	2	8	1	25	Finished
15	1	2	8	2	18	Finished
16	17	3	5	2	18	Finished
17	16	3	5	2	18	Finished
18	10	3	5	2	18	Finished
19	9	3	5	1	25	Finished
20	3	3	5	3	15	Finished
21	1	3	5	3	15	Finished
22	15	4	5	3	15	Finished
23	9	4	5	3	15	Finished
24	7	4	5	1	25	Finished
25	6	4	5	2	18	Finished
26	5	4	5	2	18	Finished
27	2	4	5	3	15	Finished
28	17	5	10	3	15	Finished
29	16	5	10	1	25	Finished
30	15	5	10	1	25	Finished
31	23	5	10	2	18	Finished
32	14	5	10	2	18	Finished
33	13	5	10	3	15	Finished
34	11	5	10	2	18	Finished
35	10	5	10	3	15	Finished
36	8	5	10	2	18	Finished
37	5	5	10	3	15	Finished
38	23	6	10	3	15	Finished
39	6	6	10	3	15	Finished
40	14	7	7	3	15	Finished
41	12	7	7	1	25	Finished
42	11	7	7	1	25	Finished
43	7	7	7	3	15	Finished
44	4	7	7	2	18	Finished
45	4	8	7	3	15	Finished
46	3	8	7	2	18	Finished
47	23	1	8	1	25	Finished
48	13	1	8	2	18	Finished
49	12	1	8	3	15	Finished
50	9	1	8	2	18	Finished
51	8	1	8	1	25	Finished
52	7	1	8	2	18	Finished
53	2	1	8	2	18	Finished
54	1	1	8	1	25	Finished
\.


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 23, true);


--
-- Name: constructors_constructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.constructors_constructor_id_seq', 11, true);


--
-- Name: drivers_driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drivers_driver_id_seq', 22, true);


--
-- Name: races_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.races_race_id_seq', 23, true);


--
-- Name: results_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.results_result_id_seq', 54, true);


--
-- Name: circuits circuits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT circuits_pkey PRIMARY KEY (circuit_id);


--
-- Name: constructors constructors_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constructors
    ADD CONSTRAINT constructors_name_key UNIQUE (name);


--
-- Name: constructors constructors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constructors
    ADD CONSTRAINT constructors_pkey PRIMARY KEY (constructor_id);


--
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (driver_id);


--
-- Name: races races_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (race_id);


--
-- Name: races races_season_round_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_season_round_key UNIQUE (season, round);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (result_id);


--
-- Name: results results_race_id_driver_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_race_id_driver_id_key UNIQUE (race_id, driver_id);


--
-- Name: races races_circuit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_circuit_id_fkey FOREIGN KEY (circuit_id) REFERENCES public.circuits(circuit_id);


--
-- Name: results results_constructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_constructor_id_fkey FOREIGN KEY (constructor_id) REFERENCES public.constructors(constructor_id);


--
-- Name: results results_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.drivers(driver_id);


--
-- Name: results results_race_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_race_id_fkey FOREIGN KEY (race_id) REFERENCES public.races(race_id);


--
-- PostgreSQL database dump complete
--

\unrestrict idZ3OorSMMHcqOVLe74QSHC0lTtIeS1NZvKPpY0Vfmu1CPO44FlvzlCNW5XIjwb

