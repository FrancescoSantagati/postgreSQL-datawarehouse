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
    giorno integer NOT NULL,
    mese integer NOT NULL,
    anno integer NOT NULL
);


--
-- Name: LuogoDT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "LuogoDT" (
    "luogoId" integer NOT NULL,
    citta "char" NOT NULL,
    regione "char" NOT NULL,
    stato "char" NOT NULL
);


--
-- Name: MembroDT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "MembroDT" (
    "membroId" integer NOT NULL,
    "tipoMembro" "char" NOT NULL,
    tutor "char" NOT NULL,
    dipartimento "char" NOT NULL,
    ateneo "char" NOT NULL
);


--
-- Name: MembroTeamBT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "MembroTeamBT" (
    "teamId" integer NOT NULL,
    "membroId" integer NOT NULL,
    weight double precision NOT NULL
);


--
-- Name: MissioneFT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "MissioneFT" (
    "teamId" integer NOT NULL,
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
    "tipoProgetto" "char" NOT NULL
);


--
-- Name: TeamDT; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "TeamDT" (
    "teamId" integer NOT NULL
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
-- Name: MembroTeamBT MembroTeamBT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MembroTeamBT"
    ADD CONSTRAINT "MembroTeamBT_pkey" PRIMARY KEY ("teamId", "membroId");


--
-- Name: MissioneFT MissioneFT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MissioneFT"
    ADD CONSTRAINT "MissioneFT_pkey" PRIMARY KEY ("teamId", "progettoId", "luogoId", "dataInizioId", "dataFineId");


--
-- Name: ProgettoDT ProgettoDT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProgettoDT"
    ADD CONSTRAINT "ProgettoDT_pkey" PRIMARY KEY ("progettoId");


--
-- Name: TeamDT TeamDT_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "TeamDT"
    ADD CONSTRAINT "TeamDT_pkey" PRIMARY KEY ("teamId");


--
-- Name: MembroTeamBT MembroTeam_fk_membroId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MembroTeamBT"
    ADD CONSTRAINT "MembroTeam_fk_membroId" FOREIGN KEY ("membroId") REFERENCES "MembroDT"("membroId");


--
-- Name: MembroTeamBT MembroTeam_fk_teamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MembroTeamBT"
    ADD CONSTRAINT "MembroTeam_fk_teamId" FOREIGN KEY ("teamId") REFERENCES "TeamDT"("teamId");


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
-- Name: MissioneFT MissioneFT_fk_progettoId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MissioneFT"
    ADD CONSTRAINT "MissioneFT_fk_progettoId" FOREIGN KEY ("progettoId") REFERENCES "ProgettoDT"("progettoId");


--
-- Name: MissioneFT MissioneFT_fk_teamId; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MissioneFT"
    ADD CONSTRAINT "MissioneFT_fk_teamId" FOREIGN KEY ("teamId") REFERENCES "TeamDT"("teamId");


--
-- PostgreSQL database dump complete
--

