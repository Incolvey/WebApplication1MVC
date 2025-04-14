--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    "Группа_код" integer NOT NULL,
    "Номер_группы" character varying(15) NOT NULL,
    "Институт_код" integer NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
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
-- Name: groups_Группа_код_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."groups_Группа_код_seq" OWNED BY public.groups."Группа_код";


--
-- Name: institutes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutes (
    "Институт_код" integer NOT NULL,
    "Наименование_института" character varying(100) NOT NULL,
    "ФИО_декана" character varying(100) NOT NULL,
    "Звание_декана" character varying(100) NOT NULL
);


ALTER TABLE public.institutes OWNER TO postgres;

--
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
-- Name: institutes_Институт_код_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."institutes_Институт_код_seq" OWNED BY public.institutes."Институт_код";


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    "Студент_код" integer NOT NULL,
    "ФИО_студента" character varying(100) NOT NULL,
    "Год_поступления" date NOT NULL,
    "День_рождения" date NOT NULL,
    "Группа_код" integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
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
-- Name: students_Студент_код_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."students_Студент_код_seq" OWNED BY public.students."Студент_код";


--
-- Name: groups Группа_код; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN "Группа_код" SET DEFAULT nextval('public."groups_Группа_код_seq"'::regclass);


--
-- Name: institutes Институт_код; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutes ALTER COLUMN "Институт_код" SET DEFAULT nextval('public."institutes_Институт_код_seq"'::regclass);


--
-- Name: students Студент_код; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN "Студент_код" SET DEFAULT nextval('public."students_Студент_код_seq"'::regclass);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups ("Группа_код", "Номер_группы", "Институт_код") FROM stdin;
1	1396423	1
2	9684324	1
3	6305155	2
4	8510246	2
5	1631607	3
6	5012468	3
\.


--
-- Data for Name: institutes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institutes ("Институт_код", "Наименование_института", "ФИО_декана", "Звание_декана") FROM stdin;
1	Институт передовых информационных технологий	Привалов Александр Николаевич	д.т.н., профессор
2	Факультет естественных наук	Шахкельдян Ирина Владимировна	д.х.н., профессор
3	Факультет иностранных языков	Разоренов Дмитрий Александрович	к.ф.н., доцент
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students ("Студент_код", "ФИО_студента", "Год_поступления", "День_рождения", "Группа_код") FROM stdin;
1	Гремячев Евгений Петрович	2019-09-02	2001-10-10	1
2	Ситилов Александр Александрович	2018-09-10	2000-01-30	1
3	Кутузова Наталья Степановна	2019-10-12	2001-07-07	2
4	Смирова Анастасия Алексеевна	2020-08-19	2002-09-11	2
5	Вячин Степан Борисович	2020-08-20	2002-11-29	3
6	Лыкина Елена Александровна	2019-10-10	2001-05-06	3
\.


--
-- Name: groups_Группа_код_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."groups_Группа_код_seq"', 6, true);


--
-- Name: institutes_Институт_код_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."institutes_Институт_код_seq"', 3, true);


--
-- Name: students_Студент_код_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."students_Студент_код_seq"', 6, true);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY ("Группа_код");


--
-- Name: institutes institutes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutes
    ADD CONSTRAINT institutes_pkey PRIMARY KEY ("Институт_код");


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY ("Студент_код");


--
-- Name: groups groups_Институт_код_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT "groups_Институт_код_fkey" FOREIGN KEY ("Институт_код") REFERENCES public.institutes("Институт_код");


--
-- Name: students students_Группа_код_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT "students_Группа_код_fkey" FOREIGN KEY ("Группа_код") REFERENCES public.groups("Группа_код");


--
-- PostgreSQL database dump complete
--

