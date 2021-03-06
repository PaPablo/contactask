--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-10-06 22:56:48 ART

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 25988)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 25991)
-- Name: contacto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contacto (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    apellido character varying(150) NOT NULL,
    domicilio character varying(120)
);


ALTER TABLE contacto OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 25994)
-- Name: contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacto_id_seq OWNER TO postgres;

--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 183
-- Name: contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contacto_id_seq OWNED BY contacto.id;


--
-- TOC entry 184 (class 1259 OID 25996)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(50) DEFAULT ''::character varying NOT NULL,
    label character varying(255) DEFAULT ''::character varying
);


ALTER TABLE roles OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 26001)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 185
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 186 (class 1259 OID 26003)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(50) DEFAULT ''::character varying NOT NULL,
    password character varying(255) DEFAULT ''::character varying NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    first_name character varying(50) DEFAULT ''::character varying NOT NULL,
    last_name character varying(50) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 26011)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 187
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 188 (class 1259 OID 26013)
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE users_roles OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 26016)
-- Name: users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_roles_id_seq OWNER TO postgres;

--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 189
-- Name: users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_roles_id_seq OWNED BY users_roles.id;


--
-- TOC entry 2041 (class 2604 OID 26018)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto ALTER COLUMN id SET DEFAULT nextval('contacto_id_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 26019)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2050 (class 2604 OID 26020)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2051 (class 2604 OID 26021)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_roles ALTER COLUMN id SET DEFAULT nextval('users_roles_id_seq'::regclass);


--
-- TOC entry 2182 (class 0 OID 25988)
-- Dependencies: 181
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alembic_version (version_num) FROM stdin;
\.


--
-- TOC entry 2183 (class 0 OID 25991)
-- Dependencies: 182
-- Data for Name: contacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacto (id, nombre, apellido, domicilio) FROM stdin;
1	Brennan	Kline	Ap #165-9429 Nulla Ave
2	Christine	Sargent	P.O. Box 836, 3316 Senectus Rd.
3	Fletcher	Wallace	Ap #186-5805 Neque Ave
4	Sawyer	Baxter	8484 Nulla. Ave
5	Buffy	Wells	270-9194 Scelerisque Avenue
6	Summer	Pratt	686-4604 Ut, Ave
7	Kyle	Guy	Ap #424-207 Consectetuer Street
8	Nayda	Arnold	P.O. Box 263, 3158 Iaculis St.
9	Sopoline	Nunez	P.O. Box 936, 5687 Et, Av.
10	Timon	Travis	Ap #846-5526 Sed Ave
11	Tallulah	Horn	333-4305 Diam Av.
12	Thomas	Richmond	Ap #147-9447 Tellus St.
13	Hiroko	Blevins	493-8333 Integer St.
14	Gil	Richmond	Ap #555-2034 Est Ave
15	Hakeem	Hull	P.O. Box 125, 3994 Morbi Av.
16	Christian	Ingram	669-8408 Donec Av.
17	Ria	Schneider	P.O. Box 801, 6020 Quis, Rd.
18	Prescott	Clark	P.O. Box 549, 2889 Lorem Ave
19	Ryder	Knight	P.O. Box 848, 8249 Eleifend Rd.
20	Honorato	Green	7838 Egestas. Street
21	Tiger	Dunlap	Ap #931-7663 Dis Street
22	Alice	Fitzgerald	596-4247 Sem St.
23	Alexis	Callahan	255 Orci. Rd.
24	Driscoll	Barker	P.O. Box 910, 6863 Mi Road
25	Gillian	Kinney	P.O. Box 143, 9191 Convallis, Ave
26	Barrett	Dixon	Ap #672-156 Ornare, Av.
27	Felicia	Merritt	9038 Massa St.
28	Cara	Gonzalez	P.O. Box 785, 2444 Magnis St.
29	Wallace	Gallagher	P.O. Box 889, 2886 Amet, Rd.
30	TaShya	Mclaughlin	1034 Adipiscing St.
31	Kelsie	Snyder	P.O. Box 909, 7685 Ornare, Road
32	Dustin	Walton	8403 Cras Av.
33	Ainsley	Stone	949-5025 Eget, Rd.
34	Tad	Browning	Ap #579-3189 Adipiscing. Street
35	Denton	Salinas	P.O. Box 435, 5244 In St.
36	Carissa	Baird	810-687 Ullamcorper. Avenue
37	Fitzgerald	Church	P.O. Box 203, 776 Quam Avenue
38	Maryam	Armstrong	P.O. Box 681, 6054 Nulla St.
39	Amelia	Parks	8430 Lacinia Ave
40	Timothy	Atkins	5436 Consectetuer Av.
41	Madison	Townsend	6930 Ac Avenue
42	Hasad	Molina	818-5605 Diam. St.
43	Finn	Wiggins	Ap #500-9731 Vitae Avenue
44	Vernon	Henderson	Ap #464-4228 In St.
45	Meredith	Delacruz	9337 Et Avenue
46	Desirae	Fleming	7004 Consequat, St.
47	Rylee	Washington	5499 Vulputate St.
48	George	James	797-2269 Nullam St.
49	Cathleen	Dorsey	Ap #752-531 Porttitor Road
50	Norman	Barnett	458-5996 Placerat, St.
51	Brynne	Anderson	P.O. Box 140, 7861 Vivamus Avenue
52	Nero	Burt	1420 Eget Rd.
53	Ashton	Alford	914 Arcu Rd.
54	Octavia	Hopkins	P.O. Box 763, 6604 Libero Rd.
55	Juliet	Kline	P.O. Box 361, 1860 Dis Ave
56	Avye	Sosa	257-2809 Commodo Street
57	Malcolm	Barrera	P.O. Box 546, 5036 Dictum Rd.
58	Kylynn	Ayala	360-6128 Cras St.
59	Claudia	Peters	Ap #602-9482 Mollis Rd.
60	Akeem	Watts	6254 Nunc St.
61	Talon	Riley	815-1535 Nec, Rd.
62	Oliver	Holloway	Ap #877-2851 Facilisis Rd.
63	September	Norton	2634 Non Rd.
64	Kiayada	Gallagher	Ap #191-8173 Curabitur St.
65	Caesar	Lynn	330-2953 Donec Rd.
66	Dana	Lynch	2180 Quisque Street
67	Geraldine	Burks	P.O. Box 200, 3542 Rhoncus Street
68	Allegra	Mccarty	Ap #654-4078 Accumsan St.
69	Hilel	Stevens	619 Est Ave
70	Quail	Middleton	Ap #892-684 Quisque Rd.
71	Hilary	Warren	Ap #447-3218 Suscipit, Road
72	Hadassah	Chang	5005 Nostra, St.
73	Harding	Mclaughlin	Ap #709-6645 Nascetur Avenue
74	Megan	Wolf	Ap #637-410 Aliquet Avenue
75	Quynn	Rowe	Ap #195-3126 Magna St.
76	Sybill	Cunningham	Ap #153-765 Tincidunt, Ave
77	Tarik	Stout	P.O. Box 469, 4204 Et St.
78	Sade	Massey	2465 Orci. St.
79	Ciara	Silva	576-7153 Ornare, Avenue
80	Kameko	Hudson	7356 Eget St.
81	Ivy	Guy	2191 Enim. Av.
82	Chaney	Boyle	Ap #983-475 Eros Rd.
83	Destiny	Morrison	947-1574 Lorem, Rd.
84	Byron	Langley	5377 Lobortis. Ave
85	Constance	Russo	1647 Ante Av.
86	Travis	Reyes	8230 Donec Avenue
87	Victoria	Giles	179-8077 Turpis Ave
88	Suki	Chan	Ap #176-298 Nec St.
89	Kitra	Rivera	909-9252 Porta Av.
90	Donovan	Kirk	930 Arcu. Street
91	Marsden	Gonzales	P.O. Box 261, 599 Malesuada Street
92	Yetta	Maddox	P.O. Box 587, 3506 Turpis Avenue
93	Jesse	Weiss	695-5001 Sed Rd.
94	Dylan	Morton	615-1985 Dolor. Rd.
95	Jesse	Cannon	P.O. Box 873, 6741 Commodo Street
96	Alyssa	Rodgers	Ap #219-4627 Enim St.
97	Jermaine	Wolf	P.O. Box 311, 8353 Posuere Rd.
98	Gannon	Bender	614-4984 Nunc Road
99	Noelani	Roberson	Ap #630-2004 Magna. Street
100	Alexandra	Miranda	687-257 Sit Rd.
\.


--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 183
-- Name: contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contacto_id_seq', 1, false);


--
-- TOC entry 2185 (class 0 OID 25996)
-- Dependencies: 184
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, label) FROM stdin;
1	admin	Admin
\.


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 185
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 1, true);


--
-- TOC entry 2187 (class 0 OID 26003)
-- Dependencies: 186
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, username, password, is_active, first_name, last_name) FROM stdin;
1	admin	$2b$12$p7cmmCClKLLP9SWuvB/cZOfPbWNEdIWgicHuPOAXMFb3Rm7/JFPGC	t	Admin	Example
2	user	$2b$12$gnF6zGGEFQbeWN40x/tjHOaGRmkYVtGrDAM7Qaq98miEtGg8GO89u	t	User	Example
3	luciano	$2b$12$qtyiPchphJELRZNJeaPRr.alIEOdhO3K3YVrLek73s2taIif3oX36	t	Luciano	Serruya Aloisi
\.


--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 187
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- TOC entry 2189 (class 0 OID 26013)
-- Dependencies: 188
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_roles (id, user_id, role_id) FROM stdin;
1	1	1
\.


--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 189
-- Name: users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_roles_id_seq', 1, true);


--
-- TOC entry 2053 (class 2606 OID 26023)
-- Name: alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 2055 (class 2606 OID 26025)
-- Name: contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id);


--
-- TOC entry 2057 (class 2606 OID 26027)
-- Name: roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 2059 (class 2606 OID 26029)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 26031)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 26033)
-- Name: users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 26035)
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 2066 (class 2606 OID 26036)
-- Name: users_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE;


--
-- TOC entry 2067 (class 2606 OID 26041)
-- Name: users_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-10-06 22:56:48 ART

--
-- PostgreSQL database dump complete
--

