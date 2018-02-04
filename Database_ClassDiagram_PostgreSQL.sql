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
-- Name: postgres; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: BorsaDiStudio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "BorsaDiStudio" (
    id integer NOT NULL
);


--
-- Name: Membro; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Membro" (
    nome character(30) NOT NULL,
    cognome character(30) NOT NULL
);


--
-- Name: MembroNonStrutturato; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "MembroNonStrutturato" (
    matricola integer NOT NULL,
    "contoCorrente" integer NOT NULL,
    "tutorCode" integer NOT NULL
)
INHERITS ("Membro");


--
-- Name: Borsista; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Borsista" (
)
INHERITS ("MembroNonStrutturato");


--
-- Name: Corso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Corso" (
    id integer NOT NULL,
    docente integer NOT NULL
);


--
-- Name: Dipartimento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Dipartimento" (
);


--
-- Name: Direttore; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Direttore" (
    id integer NOT NULL
);


--
-- Name: MembroStrutturato; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "MembroStrutturato" (
    id integer NOT NULL
)
INHERITS ("Membro");


--
-- Name: Docente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Docente" (
    nome character(30),
    cognome character(30),
    "docenteId" integer NOT NULL
)
INHERITS ("MembroStrutturato");


--
-- Name: Dottorando; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Dottorando" (
)
INHERITS ("MembroNonStrutturato");


--
-- Name: Fondo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Fondo" (
    id integer NOT NULL,
    responsabile integer NOT NULL
);


--
-- Name: LuogoMissione; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "LuogoMissione" (
    citta character(200),
    regione character(200) NOT NULL,
    stato character(200),
    id integer NOT NULL
);


--
-- Name: Pagamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Pagamento" (
    data date NOT NULL,
    valore integer NOT NULL,
    causale character(200) NOT NULL,
    id integer NOT NULL
);


--
-- Name: PagamentoBorsa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "PagamentoBorsa" (
    borsa integer NOT NULL
)
INHERITS ("Pagamento");


--
-- Name: PagamentoProgetto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "PagamentoProgetto" (
    progetto integer
)
INHERITS ("Pagamento");


--
-- Name: ProfessoreOrdinario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ProfessoreOrdinario" (
);


--
-- Name: ProgettoDiRicerca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ProgettoDiRicerca" (
    "dataInizio" date NOT NULL,
    "dataFine" date NOT NULL,
    "capitaleIniziale" integer NOT NULL,
    "enteFinanziatore" character(1) NOT NULL,
    fondo integer NOT NULL,
    "capitaleAttuale" integer NOT NULL,
    id integer NOT NULL
);


--
-- Name: ProgettoDiAteneo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ProgettoDiAteneo" (
)
INHERITS ("ProgettoDiRicerca");


--
-- Name: ProgettoEuropeo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ProgettoEuropeo" (
)
INHERITS ("ProgettoDiRicerca");


--
-- Name: ProgettoRegionale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ProgettoRegionale" (
)
INHERITS ("ProgettoDiRicerca");


--
-- Name: Responsabile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Responsabile" (
    nome "char" NOT NULL,
    cognome "char" NOT NULL,
    id integer NOT NULL
);


--
-- Name: RichiestaMissione; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "RichiestaMissione" (
    luogo integer NOT NULL,
    "dataPartenza" date NOT NULL,
    "dataRitorno" date,
    costo integer,
    "motivoRifiuto" bit varying,
    tutor integer,
    fondo integer,
    direttore integer,
    liquidata boolean DEFAULT false
);


--
-- Name: TeamAssociation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "TeamAssociation" (
    membro integer NOT NULL,
    team integer NOT NULL
);


--
-- Name: TeamProgetto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "TeamProgetto" (
    id integer NOT NULL,
    nome "char" NOT NULL,
    progetto integer
);


--
-- Name: TecnicoAmministrativo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "TecnicoAmministrativo" (
)
INHERITS ("MembroStrutturato");


--
-- Name: BorsaDiStudio BorsaDiStudio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "BorsaDiStudio"
    ADD CONSTRAINT "BorsaDiStudio_pkey" PRIMARY KEY (id);


--
-- Name: Corso Corso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Corso"
    ADD CONSTRAINT "Corso_pkey" PRIMARY KEY (id);


--
-- Name: Direttore Direttore_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Direttore"
    ADD CONSTRAINT "Direttore_id_unique" UNIQUE (id);


--
-- Name: Direttore Direttore_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Direttore"
    ADD CONSTRAINT "Direttore_pkey" PRIMARY KEY (id);


--
-- Name: Docente Docente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Docente"
    ADD CONSTRAINT "Docente_pkey" PRIMARY KEY ("docenteId");


--
-- Name: Pagamento Pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Pagamento"
    ADD CONSTRAINT "Pagamento_pkey" PRIMARY KEY (id);


--
-- Name: ProgettoDiRicerca ProgettoDiRicerca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProgettoDiRicerca"
    ADD CONSTRAINT "ProgettoDiRicerca_pkey" PRIMARY KEY (id);


--
-- Name: Responsabile Responsabile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Responsabile"
    ADD CONSTRAINT "Responsabile_pkey" PRIMARY KEY (id);


--
-- Name: TeamAssociation TeamAssociation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "TeamAssociation"
    ADD CONSTRAINT "TeamAssociation_pkey" PRIMARY KEY (membro, team);


--
-- Name: TeamProgetto TeamProgetto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "TeamProgetto"
    ADD CONSTRAINT "TeamProgetto_pkey" PRIMARY KEY (id);


--
-- Name: LuogoMissione luogo_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "LuogoMissione"
    ADD CONSTRAINT luogo_pk PRIMARY KEY (id);


--
-- Name: LuogoMissione luogo_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "LuogoMissione"
    ADD CONSTRAINT luogo_unique UNIQUE (id);


--
-- Name: Fondo pk_fondoId; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Fondo"
    ADD CONSTRAINT "pk_fondoId" PRIMARY KEY (id);


--
-- Name: MembroNonStrutturato pk_nonstrutturato; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MembroNonStrutturato"
    ADD CONSTRAINT pk_nonstrutturato PRIMARY KEY (matricola);


--
-- Name: MembroStrutturato unique_code; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MembroStrutturato"
    ADD CONSTRAINT unique_code UNIQUE (id);


--
-- Name: Fondo unique_fondoId; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Fondo"
    ADD CONSTRAINT "unique_fondoId" UNIQUE (id);


--
-- Name: fki_fk_luogo; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_fk_luogo ON "RichiestaMissione" USING btree (luogo);


--
-- Name: fki_tutorCode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fki_tutorCode" ON "MembroNonStrutturato" USING btree ("tutorCode");


--
-- Name: unique_matricola; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX unique_matricola ON "MembroNonStrutturato" USING btree (matricola);


--
-- Name: Corso Corso_fk_docente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Corso"
    ADD CONSTRAINT "Corso_fk_docente" FOREIGN KEY (docente) REFERENCES "Docente"("docenteId");


--
-- Name: Fondo Fondo_fk_responsabile; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Fondo"
    ADD CONSTRAINT "Fondo_fk_responsabile" FOREIGN KEY (responsabile) REFERENCES "Responsabile"(id);


--
-- Name: PagamentoBorsa PagamentoBorsa_fk_borsa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PagamentoBorsa"
    ADD CONSTRAINT "PagamentoBorsa_fk_borsa" FOREIGN KEY (borsa) REFERENCES "BorsaDiStudio"(id);


--
-- Name: PagamentoProgetto PagamentoProgetto_fk_progetto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PagamentoProgetto"
    ADD CONSTRAINT "PagamentoProgetto_fk_progetto" FOREIGN KEY (progetto) REFERENCES "ProgettoDiRicerca"(id);


--
-- Name: ProgettoDiRicerca ProgettoDiRicerca_fk_fondo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProgettoDiRicerca"
    ADD CONSTRAINT "ProgettoDiRicerca_fk_fondo" FOREIGN KEY (fondo) REFERENCES "Fondo"(id);


--
-- Name: RichiestaMissione RichiestaMissione_fk_fondo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "RichiestaMissione"
    ADD CONSTRAINT "RichiestaMissione_fk_fondo" FOREIGN KEY (fondo) REFERENCES "Fondo"(id);


--
-- Name: RichiestaMissione RichiestaMissione_fk_luogo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "RichiestaMissione"
    ADD CONSTRAINT "RichiestaMissione_fk_luogo" FOREIGN KEY (luogo) REFERENCES "LuogoMissione"(id);


--
-- Name: RichiestaMissione RichiestaMissione_fk_tutor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "RichiestaMissione"
    ADD CONSTRAINT "RichiestaMissione_fk_tutor" FOREIGN KEY (tutor) REFERENCES "MembroStrutturato"(id);


--
-- Name: TeamAssociation TeamAssociation_fk_membro; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "TeamAssociation"
    ADD CONSTRAINT "TeamAssociation_fk_membro" FOREIGN KEY (membro) REFERENCES "MembroNonStrutturato"(matricola);


--
-- Name: TeamAssociation TeamAssociation_fk_team; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "TeamAssociation"
    ADD CONSTRAINT "TeamAssociation_fk_team" FOREIGN KEY (team) REFERENCES "TeamProgetto"(id);


--
-- Name: TeamProgetto TeamProgetto_fk_progetto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "TeamProgetto"
    ADD CONSTRAINT "TeamProgetto_fk_progetto" FOREIGN KEY (progetto) REFERENCES "ProgettoDiRicerca"(id);


--
-- Name: MembroNonStrutturato fk_tutorCode; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MembroNonStrutturato"
    ADD CONSTRAINT "fk_tutorCode" FOREIGN KEY ("tutorCode") REFERENCES "MembroStrutturato"(id);


--
-- PostgreSQL database dump complete
--

