--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE salon;
--
-- Name: salon; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE salon WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE salon OWNER TO freecodecamp;

\connect salon

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    customer_id integer,
    service_id integer,
    "time" character varying
);


ALTER TABLE public.appointments OWNER TO freecodecamp;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_appointment_id_seq OWNER TO freecodecamp;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying,
    phone character varying
);


ALTER TABLE public.customers OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.services OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_service_id_seq OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.customers VALUES (2, '555-5555', '1');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.services VALUES (1, 'cut');
INSERT INTO public.services VALUES (2, 'color');
INSERT INTO public.services VALUES (3, 'styling');
INSERT INTO public.services VALUES (4, 'cut');
INSERT INTO public.services VALUES (5, 'color');
INSERT INTO public.services VALUES (6, 'styling');
INSERT INTO public.services VALUES (7, 'cut');
INSERT INTO public.services VALUES (8, 'color');
INSERT INTO public.services VALUES (9, 'styling');
INSERT INTO public.services VALUES (10, 'cut');
INSERT INTO public.services VALUES (11, 'color');
INSERT INTO public.services VALUES (12, 'styling');
INSERT INTO public.services VALUES (13, 'cut');
INSERT INTO public.services VALUES (14, 'color');
INSERT INTO public.services VALUES (15, 'styling');
INSERT INTO public.services VALUES (16, 'cut');
INSERT INTO public.services VALUES (17, 'color');
INSERT INTO public.services VALUES (18, 'styling');
INSERT INTO public.services VALUES (19, 'cut');
INSERT INTO public.services VALUES (20, 'color');
INSERT INTO public.services VALUES (21, 'styling');
INSERT INTO public.services VALUES (22, 'cut');
INSERT INTO public.services VALUES (23, 'color');
INSERT INTO public.services VALUES (24, 'styling');
INSERT INTO public.services VALUES (25, 'cut');
INSERT INTO public.services VALUES (26, 'color');
INSERT INTO public.services VALUES (27, 'styling');
INSERT INTO public.services VALUES (28, 'cut');
INSERT INTO public.services VALUES (29, 'color');
INSERT INTO public.services VALUES (30, 'styling');
INSERT INTO public.services VALUES (31, 'cut');
INSERT INTO public.services VALUES (32, 'color');
INSERT INTO public.services VALUES (33, 'styling');
INSERT INTO public.services VALUES (34, 'cut');
INSERT INTO public.services VALUES (35, 'color');
INSERT INTO public.services VALUES (36, 'styling');
INSERT INTO public.services VALUES (37, 'cut');
INSERT INTO public.services VALUES (38, 'color');
INSERT INTO public.services VALUES (39, 'styling');
INSERT INTO public.services VALUES (40, 'cut');
INSERT INTO public.services VALUES (41, 'color');
INSERT INTO public.services VALUES (42, 'styling');
INSERT INTO public.services VALUES (43, 'cut');
INSERT INTO public.services VALUES (44, 'color');
INSERT INTO public.services VALUES (45, 'styling');
INSERT INTO public.services VALUES (46, 'cut');
INSERT INTO public.services VALUES (47, 'color');
INSERT INTO public.services VALUES (48, 'styling');
INSERT INTO public.services VALUES (49, 'cut');
INSERT INTO public.services VALUES (50, 'color');
INSERT INTO public.services VALUES (51, 'styling');
INSERT INTO public.services VALUES (52, 'cut');
INSERT INTO public.services VALUES (53, 'color');
INSERT INTO public.services VALUES (54, 'styling');
INSERT INTO public.services VALUES (55, 'cut');
INSERT INTO public.services VALUES (56, 'color');
INSERT INTO public.services VALUES (57, 'styling');
INSERT INTO public.services VALUES (58, 'cut');
INSERT INTO public.services VALUES (59, 'color');
INSERT INTO public.services VALUES (60, 'styling');
INSERT INTO public.services VALUES (61, 'cut');
INSERT INTO public.services VALUES (62, 'color');
INSERT INTO public.services VALUES (63, 'styling');
INSERT INTO public.services VALUES (64, 'cut');
INSERT INTO public.services VALUES (65, 'color');
INSERT INTO public.services VALUES (66, 'styling');
INSERT INTO public.services VALUES (67, 'cut');
INSERT INTO public.services VALUES (68, 'color');
INSERT INTO public.services VALUES (69, 'styling');
INSERT INTO public.services VALUES (70, 'cut');
INSERT INTO public.services VALUES (71, 'color');
INSERT INTO public.services VALUES (72, 'styling');
INSERT INTO public.services VALUES (73, 'cut');
INSERT INTO public.services VALUES (74, 'color');
INSERT INTO public.services VALUES (75, 'styling');


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 10, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 22, true);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.services_service_id_seq', 75, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: appointments appointments_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: appointments appointments_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- PostgreSQL database dump complete
--

