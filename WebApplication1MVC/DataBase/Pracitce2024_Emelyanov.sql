--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-15 17:08:26

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16915)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    "Group_id" integer NOT NULL,
    "Group_number" character varying(15) NOT NULL,
    "Institute_id" integer NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16914)
-- Name: groups_Группа_код_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."groups_Группа_код_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."groups_Группа_код_seq" OWNER TO postgres;

--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_Группа_код_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."groups_Группа_код_seq" OWNED BY public.groups."Group_id";


--
-- TOC entry 218 (class 1259 OID 16908)
-- Name: institutes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutes (
    "Institute_id" integer NOT NULL,
    "Institute_name" character varying(100) NOT NULL,
    "Decan_name" character varying(100) NOT NULL,
    "Decan_title" character varying(100) NOT NULL
);


ALTER TABLE public.institutes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16907)
-- Name: institutes_Институт_код_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."institutes_Институт_код_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."institutes_Институт_код_seq" OWNER TO postgres;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 217
-- Name: institutes_Институт_код_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."institutes_Институт_код_seq" OWNED BY public.institutes."Institute_id";


--
-- TOC entry 222 (class 1259 OID 16927)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    "Student_id" integer NOT NULL,
    "Student_name" character varying(100) NOT NULL,
    "Admission_date" date NOT NULL,
    "Birthday" date NOT NULL,
    "Group_id" integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16926)
-- Name: students_Студент_код_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."students_Студент_код_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."students_Студент_код_seq" OWNER TO postgres;

--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_Студент_код_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."students_Студент_код_seq" OWNED BY public.students."Student_id";


--
-- TOC entry 4706 (class 2604 OID 16918)
-- Name: groups Group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN "Group_id" SET DEFAULT nextval('public."groups_Группа_код_seq"'::regclass);


--
-- TOC entry 4705 (class 2604 OID 16911)
-- Name: institutes Institute_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutes ALTER COLUMN "Institute_id" SET DEFAULT nextval('public."institutes_Институт_код_seq"'::regclass);


--
-- TOC entry 4707 (class 2604 OID 16930)
-- Name: students Student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN "Student_id" SET DEFAULT nextval('public."students_Студент_код_seq"'::regclass);


--
-- TOC entry 4864 (class 0 OID 16915)
-- Dependencies: 220
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups ("Group_id", "Group_number", "Institute_id") FROM stdin;
1	1396423	1
2	9684324	1
3	6305155	2
4	8510246	2
5	1631607	3
6	5012468	3
\.


--
-- TOC entry 4862 (class 0 OID 16908)
-- Dependencies: 218
-- Data for Name: institutes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institutes ("Institute_id", "Institute_name", "Decan_name", "Decan_title") FROM stdin;
1	Институт передовых информационных технологий	Привалов Александр Николаевич	д.т.н., профессор
2	Факультет естественных наук	Шахкельдян Ирина Владимировна	д.х.н., профессор
3	Факультет иностранных языков	Разоренов Дмитрий Александрович	к.ф.н., доцент
\.


--
-- TOC entry 4866 (class 0 OID 16927)
-- Dependencies: 222
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students ("Student_id", "Student_name", "Admission_date", "Birthday", "Group_id") FROM stdin;
1	Гремячев Евгений Петрович	2019-09-02	2001-10-10	1
2	Ситилов Александр Александрович	2018-09-10	2000-01-30	1
3	Кутузова Наталья Степановна	2019-10-12	2001-07-07	2
4	Смирова Анастасия Алексеевна	2020-08-19	2002-09-11	2
5	Вячин Степан Борисович	2020-08-20	2002-11-29	3
6	Лыкина Елена Александровна	2019-10-10	2001-05-06	3
\.


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 219
-- Name: groups_Группа_код_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."groups_Группа_код_seq"', 6, true);


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 217
-- Name: institutes_Институт_код_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."institutes_Институт_код_seq"', 3, true);


--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_Студент_код_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."students_Студент_код_seq"', 6, true);


--
-- TOC entry 4711 (class 2606 OID 16920)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY ("Group_id");


--
-- TOC entry 4709 (class 2606 OID 16913)
-- Name: institutes institutes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutes
    ADD CONSTRAINT institutes_pkey PRIMARY KEY ("Institute_id");


--
-- TOC entry 4713 (class 2606 OID 16932)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY ("Student_id");


--
-- TOC entry 4714 (class 2606 OID 16921)
-- Name: groups groups_Институт_код_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT "groups_Институт_код_fkey" FOREIGN KEY ("Institute_id") REFERENCES public.institutes("Institute_id");


--
-- TOC entry 4715 (class 2606 OID 16933)
-- Name: students students_Группа_код_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT "students_Группа_код_fkey" FOREIGN KEY ("Group_id") REFERENCES public.groups("Group_id");


-- Completed on 2025-04-15 17:08:26

--
-- PostgreSQL database dump complete
--

