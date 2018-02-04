--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: DataDT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "DataDT" (
    "dataId" integer NOT NULL,
    giorno character varying,
    mese character varying,
    anno character varying
);


--
-- Name: LuogoDT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "LuogoDT" (
    "luogoId" integer NOT NULL,
    citta character varying NOT NULL,
    regione character varying NOT NULL,
    stato character varying NOT NULL
);


--
-- Name: MembroDT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "MembroDT" (
    "membroId" integer NOT NULL,
    "tipoMembro" character varying,
    dipartimento character varying,
    ateneo character varying
);


--
-- Name: MissioneFT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "MissioneFT" (
    "membroId" integer NOT NULL,
    "progettoId" integer NOT NULL,
    "luogoId" integer NOT NULL,
    "dataInizioId" integer NOT NULL,
    "dataFineId" integer NOT NULL,
    costo integer NOT NULL
);


--
-- Name: ProgettoDT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ProgettoDT" (
    "progettoId" integer NOT NULL,
    "tipoProgetto" character varying NOT NULL,
    nome character varying(30)
);


--
-- Name: DataDT DataDT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "DataDT"
    ADD CONSTRAINT "DataDT_pkey" PRIMARY KEY ("dataId");


--
-- Name: LuogoDT LuogoDT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "LuogoDT"
    ADD CONSTRAINT "LuogoDT_pkey" PRIMARY KEY ("luogoId");


--
-- Name: MembroDT MembroDT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MembroDT"
    ADD CONSTRAINT "MembroDT_pkey" PRIMARY KEY ("membroId");


--
-- Name: MissioneFT MissioneFT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MissioneFT"
    ADD CONSTRAINT "MissioneFT_pkey" PRIMARY KEY ("membroId", "progettoId", "luogoId", "dataInizioId", "dataFineId");


--
-- Name: ProgettoDT ProgettoDT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProgettoDT"
    ADD CONSTRAINT "ProgettoDT_pkey" PRIMARY KEY ("progettoId");


--
-- Name: MissioneFT MissioneFT_fk_dataFineId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MissioneFT"
    ADD CONSTRAINT "MissioneFT_fk_dataFineId" FOREIGN KEY ("dataFineId") REFERENCES "DataDT"("dataId");


--
-- Name: MissioneFT MissioneFT_fk_dataInizioId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MissioneFT"
    ADD CONSTRAINT "MissioneFT_fk_dataInizioId" FOREIGN KEY ("dataInizioId") REFERENCES "DataDT"("dataId");


--
-- Name: MissioneFT MissioneFT_fk_luogoId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MissioneFT"
    ADD CONSTRAINT "MissioneFT_fk_luogoId" FOREIGN KEY ("luogoId") REFERENCES "LuogoDT"("luogoId");


--
-- Name: MissioneFT MissioneFT_fk_membroId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MissioneFT"
    ADD CONSTRAINT "MissioneFT_fk_membroId" FOREIGN KEY ("membroId") REFERENCES "MembroDT"("membroId");


--
-- Name: MissioneFT MissioneFT_fk_progettoId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MissioneFT"
    ADD CONSTRAINT "MissioneFT_fk_progettoId" FOREIGN KEY ("progettoId") REFERENCES "ProgettoDT"("progettoId");


--
-- PostgreSQL database dump complete
--

