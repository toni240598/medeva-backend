--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: enum_employees_gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_employees_gender AS ENUM (
    'male',
    'female',
    'other'
);


ALTER TYPE public.enum_employees_gender OWNER TO postgres;

--
-- Name: enum_employees_maritalStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_employees_maritalStatus" AS ENUM (
    'single',
    'married',
    'divorced',
    'widowed'
);


ALTER TYPE public."enum_employees_maritalStatus" OWNER TO postgres;

--
-- Name: enum_employees_maritialStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_employees_maritialStatus" AS ENUM (
    'single',
    'married',
    'divorced'
);


ALTER TYPE public."enum_employees_maritialStatus" OWNER TO postgres;

--
-- Name: enum_employees_martialStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_employees_martialStatus" AS ENUM (
    'single',
    'married',
    'divorced'
);


ALTER TYPE public."enum_employees_martialStatus" OWNER TO postgres;

--
-- Name: enum_employees_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_employees_status AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.enum_employees_status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "provinceId" integer NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.districts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "cityId" integer NOT NULL
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.districts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.districts_id_seq OWNER TO postgres;

--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;


--
-- Name: doctor_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor_codes (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.doctor_codes OWNER TO postgres;

--
-- Name: doctor_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctor_codes_id_seq OWNER TO postgres;

--
-- Name: doctor_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_codes_id_seq OWNED BY public.doctor_codes.id;


--
-- Name: employee_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_roles (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "employeeId" integer NOT NULL,
    "roleId" integer NOT NULL
);


ALTER TABLE public.employee_roles OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    "fullName" character varying(255) NOT NULL,
    "identityNumber" character varying(255) NOT NULL,
    gender public.enum_employees_gender NOT NULL,
    "birthPlace" character varying(255),
    "birthDate" date,
    "phoneNumber" character varying(255),
    "provinceId" integer,
    "cityId" integer,
    "districtId" integer,
    "villageId" integer,
    "addressDetail" text,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "contractStartDate" date,
    "contractEndDate" date,
    "doctorCodeId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "photoUrl" character varying(255),
    status public.enum_employees_status DEFAULT 'active'::public.enum_employees_status,
    "jobTitleId" integer,
    "customJobTitle" character varying(255),
    "martialStatus" public."enum_employees_martialStatus"
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: job_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_titles (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.job_titles OWNER TO postgres;

--
-- Name: job_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_titles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_titles_id_seq OWNER TO postgres;

--
-- Name: job_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_titles_id_seq OWNED BY public.job_titles.id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.provinces_id_seq OWNER TO postgres;

--
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: villages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villages (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "districtId" integer NOT NULL
);


ALTER TABLE public.villages OWNER TO postgres;

--
-- Name: villages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.villages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.villages_id_seq OWNER TO postgres;

--
-- Name: villages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.villages_id_seq OWNED BY public.villages.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);


--
-- Name: doctor_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes ALTER COLUMN id SET DEFAULT nextval('public.doctor_codes_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: job_titles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles ALTER COLUMN id SET DEFAULT nextval('public.job_titles_id_seq'::regclass);


--
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: villages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villages ALTER COLUMN id SET DEFAULT nextval('public.villages_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, "provinceId") FROM stdin;
1	Kota Malang	1
\.


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.districts (id, name, "cityId") FROM stdin;
1	Klojen	1
2	Lowokwaru	1
\.


--
-- Data for Name: doctor_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor_codes (id, code, description) FROM stdin;
1	DOK001	Dokter Spesialis Anak
2	DOK002	Dokter Umum
3	DOK003	Dokter Gigi
\.


--
-- Data for Name: employee_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_roles ("createdAt", "updatedAt", "employeeId", "roleId") FROM stdin;
2025-05-27 05:16:25.753+07	2025-05-27 05:16:25.753+07	8	1
2025-05-27 05:16:25.753+07	2025-05-27 05:16:25.753+07	8	2
2025-05-27 09:26:54.753+07	2025-05-27 09:26:54.753+07	9	1
2025-05-27 09:26:54.753+07	2025-05-27 09:26:54.753+07	9	2
2025-05-27 09:26:54.753+07	2025-05-27 09:26:54.753+07	9	3
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, "fullName", "identityNumber", gender, "birthPlace", "birthDate", "phoneNumber", "provinceId", "cityId", "districtId", "villageId", "addressDetail", username, email, password, "contractStartDate", "contractEndDate", "doctorCodeId", "createdAt", "updatedAt", "photoUrl", status, "jobTitleId", "customJobTitle", "martialStatus") FROM stdin;
8	Budi Santoso	1234567890	male	Malang	1998-05-24	081234567890	1	1	1	1	Jl. Mawar No. 12 RT 03 RW 02	budisantoso	budi@example.com	$2b$10$GXywHIqZL.LKrgosQaYTT.pgUIvsiJgmR4jC5TedKO9NJtDjH/kRS	2023-05-01	2025-04-30	1	2025-05-27 05:16:24.865+07	2025-05-27 05:16:24.865+07	/api/files/1748297784619.jpg	active	1	\N	\N
9	muhammad wahyu fatoni	445645645645645465	male	Malang	2025-05-22	081510927781	1	1	1	1	Jl ahmad yani Rt 37 Rw 09	admin	admin@gmail.com	$2b$10$nGCA/C1i.RCwQyqxfm7mx.HInPo/Kp6sXZZlETqh05kEhoWPfXslS	2025-05-08	2025-05-10	1	2025-05-27 09:26:54.412+07	2025-05-27 09:26:54.412+07	/api/files/1748312814388.jpg	active	4	\N	single
\.


--
-- Data for Name: job_titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_titles (id, name) FROM stdin;
1	Perawat
2	Bidan
3	Dokter
4	Lainnya
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (id, name) FROM stdin;
1	Jawa Timur
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	Manager
2	Admin
3	Resepsionis
4	Manajemen
5	Finance
6	Kasir
7	Purchasing
\.


--
-- Data for Name: villages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villages (id, name, "districtId") FROM stdin;
1	Bareng	1
2	Kasin	1
3	Jatimulyo	2
4	Dinoyo	2
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, true);


--
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.districts_id_seq', 2, true);


--
-- Name: doctor_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_codes_id_seq', 3, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 9, true);


--
-- Name: job_titles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_titles_id_seq', 4, true);


--
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 1, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 7, true);


--
-- Name: villages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.villages_id_seq', 4, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: doctor_codes doctor_codes_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key1 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key10 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key100 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key101 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key102 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key103 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key104 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key11 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key12 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key13 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key14 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key15 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key16 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key17 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key18 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key19 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key2 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key20 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key21 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key22 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key23 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key24 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key25 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key26 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key27 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key28 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key29 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key3 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key30 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key31 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key32 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key33 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key34 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key35 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key36 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key37 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key38 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key39 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key4 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key40 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key41 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key42 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key43 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key44 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key45 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key46 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key47 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key48 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key49 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key5 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key50 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key51 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key52 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key53 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key54 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key55 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key56 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key57 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key58 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key59 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key6 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key60 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key61 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key62 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key63 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key64 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key65 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key66 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key67 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key68 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key69 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key7 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key70 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key71 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key72 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key73 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key74 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key75 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key76 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key77 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key78 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key79 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key8 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key80 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key81 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key82 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key83 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key84 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key85 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key86 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key87 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key88 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key89 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key9 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key90 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key91 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key92 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key93 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key94 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key95 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key96 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key97 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key98 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_code_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_code_key99 UNIQUE (code);


--
-- Name: doctor_codes doctor_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor_codes
    ADD CONSTRAINT doctor_codes_pkey PRIMARY KEY (id);


--
-- Name: employee_roles employee_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_roles
    ADD CONSTRAINT employee_roles_pkey PRIMARY KEY ("employeeId", "roleId");


--
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- Name: employees employees_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key1 UNIQUE (email);


--
-- Name: employees employees_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key10 UNIQUE (email);


--
-- Name: employees employees_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key11 UNIQUE (email);


--
-- Name: employees employees_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key12 UNIQUE (email);


--
-- Name: employees employees_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key13 UNIQUE (email);


--
-- Name: employees employees_email_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key14 UNIQUE (email);


--
-- Name: employees employees_email_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key15 UNIQUE (email);


--
-- Name: employees employees_email_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key16 UNIQUE (email);


--
-- Name: employees employees_email_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key17 UNIQUE (email);


--
-- Name: employees employees_email_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key18 UNIQUE (email);


--
-- Name: employees employees_email_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key19 UNIQUE (email);


--
-- Name: employees employees_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key2 UNIQUE (email);


--
-- Name: employees employees_email_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key20 UNIQUE (email);


--
-- Name: employees employees_email_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key21 UNIQUE (email);


--
-- Name: employees employees_email_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key22 UNIQUE (email);


--
-- Name: employees employees_email_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key23 UNIQUE (email);


--
-- Name: employees employees_email_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key24 UNIQUE (email);


--
-- Name: employees employees_email_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key25 UNIQUE (email);


--
-- Name: employees employees_email_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key26 UNIQUE (email);


--
-- Name: employees employees_email_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key27 UNIQUE (email);


--
-- Name: employees employees_email_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key28 UNIQUE (email);


--
-- Name: employees employees_email_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key29 UNIQUE (email);


--
-- Name: employees employees_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key3 UNIQUE (email);


--
-- Name: employees employees_email_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key30 UNIQUE (email);


--
-- Name: employees employees_email_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key31 UNIQUE (email);


--
-- Name: employees employees_email_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key32 UNIQUE (email);


--
-- Name: employees employees_email_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key33 UNIQUE (email);


--
-- Name: employees employees_email_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key34 UNIQUE (email);


--
-- Name: employees employees_email_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key35 UNIQUE (email);


--
-- Name: employees employees_email_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key36 UNIQUE (email);


--
-- Name: employees employees_email_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key37 UNIQUE (email);


--
-- Name: employees employees_email_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key38 UNIQUE (email);


--
-- Name: employees employees_email_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key39 UNIQUE (email);


--
-- Name: employees employees_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key4 UNIQUE (email);


--
-- Name: employees employees_email_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key40 UNIQUE (email);


--
-- Name: employees employees_email_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key41 UNIQUE (email);


--
-- Name: employees employees_email_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key42 UNIQUE (email);


--
-- Name: employees employees_email_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key43 UNIQUE (email);


--
-- Name: employees employees_email_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key44 UNIQUE (email);


--
-- Name: employees employees_email_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key45 UNIQUE (email);


--
-- Name: employees employees_email_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key46 UNIQUE (email);


--
-- Name: employees employees_email_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key47 UNIQUE (email);


--
-- Name: employees employees_email_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key48 UNIQUE (email);


--
-- Name: employees employees_email_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key49 UNIQUE (email);


--
-- Name: employees employees_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key5 UNIQUE (email);


--
-- Name: employees employees_email_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key50 UNIQUE (email);


--
-- Name: employees employees_email_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key51 UNIQUE (email);


--
-- Name: employees employees_email_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key52 UNIQUE (email);


--
-- Name: employees employees_email_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key53 UNIQUE (email);


--
-- Name: employees employees_email_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key54 UNIQUE (email);


--
-- Name: employees employees_email_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key55 UNIQUE (email);


--
-- Name: employees employees_email_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key56 UNIQUE (email);


--
-- Name: employees employees_email_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key57 UNIQUE (email);


--
-- Name: employees employees_email_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key58 UNIQUE (email);


--
-- Name: employees employees_email_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key59 UNIQUE (email);


--
-- Name: employees employees_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key6 UNIQUE (email);


--
-- Name: employees employees_email_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key60 UNIQUE (email);


--
-- Name: employees employees_email_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key61 UNIQUE (email);


--
-- Name: employees employees_email_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key62 UNIQUE (email);


--
-- Name: employees employees_email_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key63 UNIQUE (email);


--
-- Name: employees employees_email_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key64 UNIQUE (email);


--
-- Name: employees employees_email_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key65 UNIQUE (email);


--
-- Name: employees employees_email_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key66 UNIQUE (email);


--
-- Name: employees employees_email_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key67 UNIQUE (email);


--
-- Name: employees employees_email_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key68 UNIQUE (email);


--
-- Name: employees employees_email_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key69 UNIQUE (email);


--
-- Name: employees employees_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key7 UNIQUE (email);


--
-- Name: employees employees_email_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key70 UNIQUE (email);


--
-- Name: employees employees_email_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key71 UNIQUE (email);


--
-- Name: employees employees_email_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key72 UNIQUE (email);


--
-- Name: employees employees_email_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key73 UNIQUE (email);


--
-- Name: employees employees_email_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key74 UNIQUE (email);


--
-- Name: employees employees_email_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key75 UNIQUE (email);


--
-- Name: employees employees_email_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key76 UNIQUE (email);


--
-- Name: employees employees_email_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key77 UNIQUE (email);


--
-- Name: employees employees_email_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key78 UNIQUE (email);


--
-- Name: employees employees_email_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key79 UNIQUE (email);


--
-- Name: employees employees_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key8 UNIQUE (email);


--
-- Name: employees employees_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key9 UNIQUE (email);


--
-- Name: employees employees_identityNumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key1" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key10" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key11" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key12" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key13" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key14" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key15" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key16" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key17" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key18" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key19" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key2" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key20" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key21" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key22" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key23" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key24" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key25" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key26" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key27" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key28" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key29" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key3" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key30" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key31" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key32" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key33" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key34" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key35" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key36" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key37" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key38" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key39" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key4" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key40" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key41" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key42" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key43" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key44" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key45" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key46" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key47" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key48" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key49" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key5" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key50" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key51" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key52" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key53" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key54" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key55" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key56" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key57" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key58" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key59" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key6" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key60" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key61" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key62" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key63" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key64" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key65" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key66" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key67" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key68" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key69" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key7" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key70" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key71" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key72" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key73" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key74" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key75" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key76" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key77" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key78" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key79" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key8" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key80" UNIQUE ("identityNumber");


--
-- Name: employees employees_identityNumber_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_identityNumber_key9" UNIQUE ("identityNumber");


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: employees employees_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key UNIQUE (username);


--
-- Name: employees employees_username_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key1 UNIQUE (username);


--
-- Name: employees employees_username_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key10 UNIQUE (username);


--
-- Name: employees employees_username_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key11 UNIQUE (username);


--
-- Name: employees employees_username_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key12 UNIQUE (username);


--
-- Name: employees employees_username_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key13 UNIQUE (username);


--
-- Name: employees employees_username_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key14 UNIQUE (username);


--
-- Name: employees employees_username_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key15 UNIQUE (username);


--
-- Name: employees employees_username_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key16 UNIQUE (username);


--
-- Name: employees employees_username_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key17 UNIQUE (username);


--
-- Name: employees employees_username_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key18 UNIQUE (username);


--
-- Name: employees employees_username_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key19 UNIQUE (username);


--
-- Name: employees employees_username_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key2 UNIQUE (username);


--
-- Name: employees employees_username_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key20 UNIQUE (username);


--
-- Name: employees employees_username_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key21 UNIQUE (username);


--
-- Name: employees employees_username_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key22 UNIQUE (username);


--
-- Name: employees employees_username_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key23 UNIQUE (username);


--
-- Name: employees employees_username_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key24 UNIQUE (username);


--
-- Name: employees employees_username_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key25 UNIQUE (username);


--
-- Name: employees employees_username_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key26 UNIQUE (username);


--
-- Name: employees employees_username_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key27 UNIQUE (username);


--
-- Name: employees employees_username_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key28 UNIQUE (username);


--
-- Name: employees employees_username_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key29 UNIQUE (username);


--
-- Name: employees employees_username_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key3 UNIQUE (username);


--
-- Name: employees employees_username_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key30 UNIQUE (username);


--
-- Name: employees employees_username_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key31 UNIQUE (username);


--
-- Name: employees employees_username_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key32 UNIQUE (username);


--
-- Name: employees employees_username_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key33 UNIQUE (username);


--
-- Name: employees employees_username_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key34 UNIQUE (username);


--
-- Name: employees employees_username_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key35 UNIQUE (username);


--
-- Name: employees employees_username_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key36 UNIQUE (username);


--
-- Name: employees employees_username_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key37 UNIQUE (username);


--
-- Name: employees employees_username_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key38 UNIQUE (username);


--
-- Name: employees employees_username_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key39 UNIQUE (username);


--
-- Name: employees employees_username_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key4 UNIQUE (username);


--
-- Name: employees employees_username_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key40 UNIQUE (username);


--
-- Name: employees employees_username_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key41 UNIQUE (username);


--
-- Name: employees employees_username_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key42 UNIQUE (username);


--
-- Name: employees employees_username_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key43 UNIQUE (username);


--
-- Name: employees employees_username_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key44 UNIQUE (username);


--
-- Name: employees employees_username_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key45 UNIQUE (username);


--
-- Name: employees employees_username_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key46 UNIQUE (username);


--
-- Name: employees employees_username_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key47 UNIQUE (username);


--
-- Name: employees employees_username_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key48 UNIQUE (username);


--
-- Name: employees employees_username_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key49 UNIQUE (username);


--
-- Name: employees employees_username_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key5 UNIQUE (username);


--
-- Name: employees employees_username_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key50 UNIQUE (username);


--
-- Name: employees employees_username_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key51 UNIQUE (username);


--
-- Name: employees employees_username_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key52 UNIQUE (username);


--
-- Name: employees employees_username_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key53 UNIQUE (username);


--
-- Name: employees employees_username_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key54 UNIQUE (username);


--
-- Name: employees employees_username_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key55 UNIQUE (username);


--
-- Name: employees employees_username_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key56 UNIQUE (username);


--
-- Name: employees employees_username_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key57 UNIQUE (username);


--
-- Name: employees employees_username_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key58 UNIQUE (username);


--
-- Name: employees employees_username_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key59 UNIQUE (username);


--
-- Name: employees employees_username_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key6 UNIQUE (username);


--
-- Name: employees employees_username_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key60 UNIQUE (username);


--
-- Name: employees employees_username_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key61 UNIQUE (username);


--
-- Name: employees employees_username_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key62 UNIQUE (username);


--
-- Name: employees employees_username_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key63 UNIQUE (username);


--
-- Name: employees employees_username_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key64 UNIQUE (username);


--
-- Name: employees employees_username_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key65 UNIQUE (username);


--
-- Name: employees employees_username_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key66 UNIQUE (username);


--
-- Name: employees employees_username_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key67 UNIQUE (username);


--
-- Name: employees employees_username_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key68 UNIQUE (username);


--
-- Name: employees employees_username_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key69 UNIQUE (username);


--
-- Name: employees employees_username_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key7 UNIQUE (username);


--
-- Name: employees employees_username_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key70 UNIQUE (username);


--
-- Name: employees employees_username_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key71 UNIQUE (username);


--
-- Name: employees employees_username_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key72 UNIQUE (username);


--
-- Name: employees employees_username_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key73 UNIQUE (username);


--
-- Name: employees employees_username_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key74 UNIQUE (username);


--
-- Name: employees employees_username_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key75 UNIQUE (username);


--
-- Name: employees employees_username_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key76 UNIQUE (username);


--
-- Name: employees employees_username_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key77 UNIQUE (username);


--
-- Name: employees employees_username_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key78 UNIQUE (username);


--
-- Name: employees employees_username_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key79 UNIQUE (username);


--
-- Name: employees employees_username_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key8 UNIQUE (username);


--
-- Name: employees employees_username_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_username_key9 UNIQUE (username);


--
-- Name: job_titles job_titles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key UNIQUE (name);


--
-- Name: job_titles job_titles_name_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key1 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key10 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key100 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key101 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key102 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key11 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key12 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key13 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key14 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key15 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key16 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key17 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key18 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key19 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key2 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key20 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key21 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key22 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key23 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key24 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key25 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key26 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key27 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key28 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key29 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key3 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key30 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key31 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key32 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key33 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key34 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key35 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key36 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key37 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key38 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key39 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key4 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key40 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key41 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key42 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key43 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key44 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key45 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key46 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key47 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key48 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key49 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key5 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key50 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key51 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key52 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key53 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key54 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key55 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key56 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key57 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key58 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key59 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key6 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key60 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key61 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key62 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key63 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key64 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key65 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key66 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key67 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key68 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key69 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key7 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key70 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key71 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key72 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key73 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key74 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key75 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key76 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key77 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key78 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key79 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key8 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key80 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key81 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key82 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key83 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key84 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key85 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key86 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key87 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key88 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key89 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key9 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key90 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key91 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key92 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key93 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key94 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key95 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key96 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key97 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key98 UNIQUE (name);


--
-- Name: job_titles job_titles_name_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_name_key99 UNIQUE (name);


--
-- Name: job_titles job_titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_pkey PRIMARY KEY (id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_name_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key1 UNIQUE (name);


--
-- Name: roles roles_name_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key10 UNIQUE (name);


--
-- Name: roles roles_name_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key100 UNIQUE (name);


--
-- Name: roles roles_name_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key101 UNIQUE (name);


--
-- Name: roles roles_name_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key102 UNIQUE (name);


--
-- Name: roles roles_name_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key11 UNIQUE (name);


--
-- Name: roles roles_name_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key12 UNIQUE (name);


--
-- Name: roles roles_name_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key13 UNIQUE (name);


--
-- Name: roles roles_name_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key14 UNIQUE (name);


--
-- Name: roles roles_name_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key15 UNIQUE (name);


--
-- Name: roles roles_name_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key16 UNIQUE (name);


--
-- Name: roles roles_name_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key17 UNIQUE (name);


--
-- Name: roles roles_name_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key18 UNIQUE (name);


--
-- Name: roles roles_name_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key19 UNIQUE (name);


--
-- Name: roles roles_name_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key2 UNIQUE (name);


--
-- Name: roles roles_name_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key20 UNIQUE (name);


--
-- Name: roles roles_name_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key21 UNIQUE (name);


--
-- Name: roles roles_name_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key22 UNIQUE (name);


--
-- Name: roles roles_name_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key23 UNIQUE (name);


--
-- Name: roles roles_name_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key24 UNIQUE (name);


--
-- Name: roles roles_name_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key25 UNIQUE (name);


--
-- Name: roles roles_name_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key26 UNIQUE (name);


--
-- Name: roles roles_name_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key27 UNIQUE (name);


--
-- Name: roles roles_name_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key28 UNIQUE (name);


--
-- Name: roles roles_name_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key29 UNIQUE (name);


--
-- Name: roles roles_name_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key3 UNIQUE (name);


--
-- Name: roles roles_name_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key30 UNIQUE (name);


--
-- Name: roles roles_name_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key31 UNIQUE (name);


--
-- Name: roles roles_name_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key32 UNIQUE (name);


--
-- Name: roles roles_name_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key33 UNIQUE (name);


--
-- Name: roles roles_name_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key34 UNIQUE (name);


--
-- Name: roles roles_name_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key35 UNIQUE (name);


--
-- Name: roles roles_name_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key36 UNIQUE (name);


--
-- Name: roles roles_name_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key37 UNIQUE (name);


--
-- Name: roles roles_name_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key38 UNIQUE (name);


--
-- Name: roles roles_name_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key39 UNIQUE (name);


--
-- Name: roles roles_name_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key4 UNIQUE (name);


--
-- Name: roles roles_name_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key40 UNIQUE (name);


--
-- Name: roles roles_name_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key41 UNIQUE (name);


--
-- Name: roles roles_name_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key42 UNIQUE (name);


--
-- Name: roles roles_name_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key43 UNIQUE (name);


--
-- Name: roles roles_name_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key44 UNIQUE (name);


--
-- Name: roles roles_name_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key45 UNIQUE (name);


--
-- Name: roles roles_name_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key46 UNIQUE (name);


--
-- Name: roles roles_name_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key47 UNIQUE (name);


--
-- Name: roles roles_name_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key48 UNIQUE (name);


--
-- Name: roles roles_name_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key49 UNIQUE (name);


--
-- Name: roles roles_name_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key5 UNIQUE (name);


--
-- Name: roles roles_name_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key50 UNIQUE (name);


--
-- Name: roles roles_name_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key51 UNIQUE (name);


--
-- Name: roles roles_name_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key52 UNIQUE (name);


--
-- Name: roles roles_name_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key53 UNIQUE (name);


--
-- Name: roles roles_name_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key54 UNIQUE (name);


--
-- Name: roles roles_name_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key55 UNIQUE (name);


--
-- Name: roles roles_name_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key56 UNIQUE (name);


--
-- Name: roles roles_name_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key57 UNIQUE (name);


--
-- Name: roles roles_name_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key58 UNIQUE (name);


--
-- Name: roles roles_name_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key59 UNIQUE (name);


--
-- Name: roles roles_name_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key6 UNIQUE (name);


--
-- Name: roles roles_name_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key60 UNIQUE (name);


--
-- Name: roles roles_name_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key61 UNIQUE (name);


--
-- Name: roles roles_name_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key62 UNIQUE (name);


--
-- Name: roles roles_name_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key63 UNIQUE (name);


--
-- Name: roles roles_name_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key64 UNIQUE (name);


--
-- Name: roles roles_name_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key65 UNIQUE (name);


--
-- Name: roles roles_name_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key66 UNIQUE (name);


--
-- Name: roles roles_name_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key67 UNIQUE (name);


--
-- Name: roles roles_name_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key68 UNIQUE (name);


--
-- Name: roles roles_name_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key69 UNIQUE (name);


--
-- Name: roles roles_name_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key7 UNIQUE (name);


--
-- Name: roles roles_name_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key70 UNIQUE (name);


--
-- Name: roles roles_name_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key71 UNIQUE (name);


--
-- Name: roles roles_name_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key72 UNIQUE (name);


--
-- Name: roles roles_name_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key73 UNIQUE (name);


--
-- Name: roles roles_name_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key74 UNIQUE (name);


--
-- Name: roles roles_name_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key75 UNIQUE (name);


--
-- Name: roles roles_name_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key76 UNIQUE (name);


--
-- Name: roles roles_name_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key77 UNIQUE (name);


--
-- Name: roles roles_name_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key78 UNIQUE (name);


--
-- Name: roles roles_name_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key79 UNIQUE (name);


--
-- Name: roles roles_name_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key8 UNIQUE (name);


--
-- Name: roles roles_name_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key80 UNIQUE (name);


--
-- Name: roles roles_name_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key81 UNIQUE (name);


--
-- Name: roles roles_name_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key82 UNIQUE (name);


--
-- Name: roles roles_name_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key83 UNIQUE (name);


--
-- Name: roles roles_name_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key84 UNIQUE (name);


--
-- Name: roles roles_name_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key85 UNIQUE (name);


--
-- Name: roles roles_name_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key86 UNIQUE (name);


--
-- Name: roles roles_name_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key87 UNIQUE (name);


--
-- Name: roles roles_name_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key88 UNIQUE (name);


--
-- Name: roles roles_name_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key89 UNIQUE (name);


--
-- Name: roles roles_name_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key9 UNIQUE (name);


--
-- Name: roles roles_name_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key90 UNIQUE (name);


--
-- Name: roles roles_name_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key91 UNIQUE (name);


--
-- Name: roles roles_name_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key92 UNIQUE (name);


--
-- Name: roles roles_name_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key93 UNIQUE (name);


--
-- Name: roles roles_name_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key94 UNIQUE (name);


--
-- Name: roles roles_name_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key95 UNIQUE (name);


--
-- Name: roles roles_name_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key96 UNIQUE (name);


--
-- Name: roles roles_name_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key97 UNIQUE (name);


--
-- Name: roles roles_name_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key98 UNIQUE (name);


--
-- Name: roles roles_name_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key99 UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: villages villages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villages
    ADD CONSTRAINT villages_pkey PRIMARY KEY (id);


--
-- Name: cities cities_provinceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT "cities_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES public.provinces(id) ON UPDATE CASCADE;


--
-- Name: districts districts_cityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT "districts_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employee_roles employee_roles_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_roles
    ADD CONSTRAINT "employee_roles_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public.employees(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employee_roles employee_roles_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_roles
    ADD CONSTRAINT "employee_roles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employees employees_cityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employees_districtId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_districtId_fkey" FOREIGN KEY ("districtId") REFERENCES public.districts(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employees_doctorCodeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_doctorCodeId_fkey" FOREIGN KEY ("doctorCodeId") REFERENCES public.doctor_codes(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employees_jobTitleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_jobTitleId_fkey" FOREIGN KEY ("jobTitleId") REFERENCES public.job_titles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employees_provinceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES public.provinces(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employees_villageId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "employees_villageId_fkey" FOREIGN KEY ("villageId") REFERENCES public.villages(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: villages villages_districtId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villages
    ADD CONSTRAINT "villages_districtId_fkey" FOREIGN KEY ("districtId") REFERENCES public.districts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

