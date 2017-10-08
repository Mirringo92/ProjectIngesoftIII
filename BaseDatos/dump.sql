--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.5.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tbl_detalle_prestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbl_detalle_prestamo (
    id_detalle bigint NOT NULL,
    id_prestamo integer,
    id_libro integer,
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE tbl_detalle_prestamo OWNER TO postgres;

--
-- Name: tbl_detalle_prestamo_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_detalle_prestamo_id_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_detalle_prestamo_id_detalle_seq OWNER TO postgres;

--
-- Name: tbl_detalle_prestamo_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_detalle_prestamo_id_detalle_seq OWNED BY tbl_detalle_prestamo.id_detalle;


--
-- Name: tbl_libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbl_libros (
    id_libro bigint NOT NULL,
    nombre_libro character varying NOT NULL,
    descripcion_libro character varying NOT NULL,
    autor character varying
);


ALTER TABLE tbl_libros OWNER TO postgres;

--
-- Name: tbl_libros_id_libro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_libros_id_libro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_libros_id_libro_seq OWNER TO postgres;

--
-- Name: tbl_libros_id_libro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_libros_id_libro_seq OWNED BY tbl_libros.id_libro;


--
-- Name: tbl_prestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbl_prestamo (
    id_prestamo bigint NOT NULL,
    fecha date NOT NULL,
    fecha_fin date,
    vencido boolean DEFAULT false NOT NULL,
    usuario character varying NOT NULL
);


ALTER TABLE tbl_prestamo OWNER TO postgres;

--
-- Name: tbl_prestamo_id_prestamo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_prestamo_id_prestamo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_prestamo_id_prestamo_seq OWNER TO postgres;

--
-- Name: tbl_prestamo_id_prestamo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_prestamo_id_prestamo_seq OWNED BY tbl_prestamo.id_prestamo;


--
-- Name: tbl_sanciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbl_sanciones (
    id_sancion bigint NOT NULL,
    id_detalle integer,
    activo boolean DEFAULT false NOT NULL
);


ALTER TABLE tbl_sanciones OWNER TO postgres;

--
-- Name: tbl_sanciones_id_sancion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_sanciones_id_sancion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_sanciones_id_sancion_seq OWNER TO postgres;

--
-- Name: tbl_sanciones_id_sancion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbl_sanciones_id_sancion_seq OWNED BY tbl_sanciones.id_sancion;


--
-- Name: id_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_detalle_prestamo ALTER COLUMN id_detalle SET DEFAULT nextval('tbl_detalle_prestamo_id_detalle_seq'::regclass);


--
-- Name: id_libro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_libros ALTER COLUMN id_libro SET DEFAULT nextval('tbl_libros_id_libro_seq'::regclass);


--
-- Name: id_prestamo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_prestamo ALTER COLUMN id_prestamo SET DEFAULT nextval('tbl_prestamo_id_prestamo_seq'::regclass);


--
-- Name: id_sancion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_sanciones ALTER COLUMN id_sancion SET DEFAULT nextval('tbl_sanciones_id_sancion_seq'::regclass);


--
-- Data for Name: tbl_detalle_prestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tbl_detalle_prestamo (id_detalle, id_prestamo, id_libro, activo) FROM stdin;
\.


--
-- Name: tbl_detalle_prestamo_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_detalle_prestamo_id_detalle_seq', 1, false);


--
-- Data for Name: tbl_libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tbl_libros (id_libro, nombre_libro, descripcion_libro, autor) FROM stdin;
\.


--
-- Name: tbl_libros_id_libro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_libros_id_libro_seq', 1, false);


--
-- Data for Name: tbl_prestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tbl_prestamo (id_prestamo, fecha, fecha_fin, vencido, usuario) FROM stdin;
\.


--
-- Name: tbl_prestamo_id_prestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_prestamo_id_prestamo_seq', 1, false);


--
-- Data for Name: tbl_sanciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tbl_sanciones (id_sancion, id_detalle, activo) FROM stdin;
\.


--
-- Name: tbl_sanciones_id_sancion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_sanciones_id_sancion_seq', 1, false);


--
-- Name: pk_id_detalle; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_detalle_prestamo
    ADD CONSTRAINT pk_id_detalle PRIMARY KEY (id_detalle);


--
-- Name: pk_id_libro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_libros
    ADD CONSTRAINT pk_id_libro PRIMARY KEY (id_libro);


--
-- Name: pk_id_prestamo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_prestamo
    ADD CONSTRAINT pk_id_prestamo PRIMARY KEY (id_prestamo);


--
-- Name: pk_sancion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_sanciones
    ADD CONSTRAINT pk_sancion PRIMARY KEY (id_sancion);


--
-- Name: fk_detalle_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_sanciones
    ADD CONSTRAINT fk_detalle_prestamo FOREIGN KEY (id_detalle) REFERENCES tbl_detalle_prestamo(id_detalle);


--
-- Name: fk_id_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_detalle_prestamo
    ADD CONSTRAINT fk_id_prestamo FOREIGN KEY (id_prestamo) REFERENCES tbl_prestamo(id_prestamo);


--
-- Name: fk_idlibro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_detalle_prestamo
    ADD CONSTRAINT fk_idlibro FOREIGN KEY (id_libro) REFERENCES tbl_libros(id_libro);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

