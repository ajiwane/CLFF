--
-- PostgreSQL database dump
--

-- Started on 2007-11-30 06:41:51

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1309 (class 1259 OID 17553)
-- Dependencies: 1641 1642 1643 5
-- Name: userteam; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE userteam (
    team_name character varying(30) NOT NULL,
    score integer DEFAULT 0,
    value double precision DEFAULT 0,
    score_today integer DEFAULT 0
);


ALTER TABLE public.userteam OWNER TO postgres;

--
-- TOC entry 1645 (class 2606 OID 17595)
-- Dependencies: 1309 1309
-- Name: userteam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY userteam
    ADD CONSTRAINT userteam_pkey PRIMARY KEY (team_name);


--
-- TOC entry 1646 (class 2620 OID 17600)
-- Dependencies: 1309 20
-- Name: new_team; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER new_team
    AFTER INSERT ON userteam
    FOR EACH ROW
    EXECUTE PROCEDURE insert_team();


--
-- TOC entry 1647 (class 2620 OID 17602)
-- Dependencies: 27 1309
-- Name: score_change; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER score_change
    AFTER UPDATE ON userteam
    FOR EACH ROW
    EXECUTE PROCEDURE score_change_fn();


-- Completed on 2007-11-30 06:41:51

--
-- PostgreSQL database dump complete
--

