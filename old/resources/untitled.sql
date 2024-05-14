--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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

--
-- Name: courtlistener; Type: DATABASE; Schema: -; Owner: django
--

CREATE DATABASE courtlistener WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
ALTER DATABASE courtlistener OWNER TO django;

\connect courtlistener

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

----------------------------------------------------------------
--
-- DONE BELOW
--
----------------------------------------------------------------

--
-- Name: audio_audio; Type: TABLE; Schema: public; Owner: django 
--
CREATE TABLE public.audio_audio (
    id integer NOT NULL,
    source character varying(10) NOT NULL,
    case_name_short text NOT NULL,
    case_name text NOT NULL,
    case_name_full text NOT NULL,
    judges text,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    sha1 character varying(40) NOT NULL,
    download_url character varying(500),
    local_path_mp3 character varying(100) NOT NULL,
    local_path_original_file character varying(100) NOT NULL,
    duration smallint,
    processing_complete boolean NOT NULL,
    date_blocked date,
    blocked boolean NOT NULL,
    docket_id integer,
    stt_google_response text NOT NULL,
    stt_status smallint NOT NULL,
    filepath_ia character varying(1000) NOT NULL,
    ia_upload_failure_count smallint
);
ALTER TABLE public.audio_audio OWNER TO django;

--
-- Name: audio_audio_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.audio_audio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.audio_audio_id_seq OWNER TO django;

--
-- Name: audio_audio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--
ALTER SEQUENCE public.audio_audio_id_seq OWNED BY public.audio_audio.id;

--
-- Name: audio_audio_panel; Type: TABLE; Schema: public; Owner: django
--
CREATE TABLE public.audio_audio_panel (
    id integer NOT NULL,
    audio_id integer NOT NULL,
    person_id integer NOT NULL
);
ALTER TABLE public.audio_audio_panel OWNER TO django;

--
-- Name: audio_audio_panel_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--
CREATE SEQUENCE public.audio_audio_panel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.audio_audio_panel_id_seq OWNER TO django;

--
-- Name: audio_audio_panel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--
ALTER SEQUENCE public.audio_audio_panel_id_seq OWNED BY public.audio_audio_panel.id;


--
-- Name: audio_audioevent; Type: TABLE; Schema: public; Owner: django
--
CREATE TABLE public.audio_audioevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    source character varying(10) NOT NULL,
    case_name_short text NOT NULL,
    case_name text NOT NULL,
    case_name_full text NOT NULL,
    judges text,
    sha1 character varying(40) NOT NULL,
    download_url character varying(500),
    local_path_mp3 character varying(100) NOT NULL,
    local_path_original_file character varying(100) NOT NULL,
    filepath_ia character varying(1000) NOT NULL,
    ia_upload_failure_count smallint,
    duration smallint,
    processing_complete boolean NOT NULL,
    date_blocked date,
    blocked boolean NOT NULL,
    stt_status smallint NOT NULL,
    stt_google_response text NOT NULL,
    docket_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.audio_audioevent OWNER TO django;

--
-- Name: audio_audioevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.audio_audioevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audio_audioevent_pgh_id_seq OWNER TO django;

--
-- Name: audio_audioevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.audio_audioevent_pgh_id_seq OWNED BY public.audio_audioevent.pgh_id;


--
-- Name: audio_audiopanelevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.audio_audiopanelevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    audio_id integer NOT NULL,
    person_id integer NOT NULL,
    pgh_context_id uuid
);


ALTER TABLE public.audio_audiopanelevent OWNER TO django;

--
-- Name: audio_audiopanelevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.audio_audiopanelevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audio_audiopanelevent_pgh_id_seq OWNER TO django;

--
-- Name: audio_audiopanelevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.audio_audiopanelevent_pgh_id_seq OWNED BY public.audio_audiopanelevent.pgh_id;


--
-- Name: people_db_abarating; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_abarating (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    rating character varying(5) NOT NULL,
    person_id integer,
    year_rated smallint,
    CONSTRAINT people_db_abarating_year_rated_check CHECK ((year_rated >= 0))
);


ALTER TABLE public.people_db_abarating OWNER TO django;


--
-- Name: people_db_abarating_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_abarating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_abarating_id_seq OWNER TO django;

--
-- Name: people_db_abarating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_abarating_id_seq OWNED BY public.people_db_abarating.id;


--
-- Name: people_db_abaratingevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_abaratingevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    year_rated smallint,
    rating character varying(5) NOT NULL,
    person_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL,
    CONSTRAINT people_db_abaratingevent_year_rated_check CHECK ((year_rated >= 0))
);


ALTER TABLE public.people_db_abaratingevent OWNER TO django;

--
-- Name: people_db_abaratingevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_abaratingevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_abaratingevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_abaratingevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_abaratingevent_pgh_id_seq OWNED BY public.people_db_abaratingevent.pgh_id;


--
-- Name: people_db_attorney; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_attorney (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name text NOT NULL,
    contact_raw text NOT NULL,
    phone character varying(20) NOT NULL,
    fax character varying(20) NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE public.people_db_attorney OWNER TO django;

--
-- Name: people_db_attorney_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_attorney_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_attorney_id_seq OWNER TO django;

--
-- Name: people_db_attorney_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_attorney_id_seq OWNED BY public.people_db_attorney.id;


--
-- Name: people_db_attorneyorganization; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_attorneyorganization (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    lookup_key text NOT NULL,
    name text NOT NULL,
    address1 text NOT NULL,
    address2 text NOT NULL,
    city text NOT NULL,
    state character varying(2) NOT NULL,
    zip_code character varying(10) NOT NULL
);


ALTER TABLE public.people_db_attorneyorganization OWNER TO django;

--
-- Name: people_db_attorneyorganization_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_attorneyorganization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_attorneyorganization_id_seq OWNER TO django;

--
-- Name: people_db_attorneyorganization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_attorneyorganization_id_seq OWNED BY public.people_db_attorneyorganization.id;


--
-- Name: people_db_attorneyorganizationassociation; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_attorneyorganizationassociation (
    id integer NOT NULL,
    attorney_id integer NOT NULL,
    attorney_organization_id integer NOT NULL,
    docket_id integer NOT NULL
);


ALTER TABLE public.people_db_attorneyorganizationassociation OWNER TO django;

--
-- Name: people_db_attorneyorganizationassociation_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_attorneyorganizationassociation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_attorneyorganizationassociation_id_seq OWNER TO django;

--
-- Name: people_db_attorneyorganizationassociation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_attorneyorganizationassociation_id_seq OWNED BY public.people_db_attorneyorganizationassociation.id;


--
-- Name: people_db_criminalcomplaint; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_criminalcomplaint (
    id integer NOT NULL,
    name text NOT NULL,
    disposition text NOT NULL,
    party_type_id integer NOT NULL
);


ALTER TABLE public.people_db_criminalcomplaint OWNER TO django;

--
-- Name: people_db_criminalcomplaint_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_criminalcomplaint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_criminalcomplaint_id_seq OWNER TO django;

--
-- Name: people_db_criminalcomplaint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_criminalcomplaint_id_seq OWNED BY public.people_db_criminalcomplaint.id;


--
-- Name: people_db_criminalcount; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_criminalcount (
    id integer NOT NULL,
    name text NOT NULL,
    disposition text NOT NULL,
    status smallint NOT NULL,
    party_type_id integer NOT NULL
);


ALTER TABLE public.people_db_criminalcount OWNER TO django;

--
-- Name: people_db_criminalcount_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_criminalcount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_criminalcount_id_seq OWNER TO django;

--
-- Name: people_db_criminalcount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_criminalcount_id_seq OWNED BY public.people_db_criminalcount.id;


--
-- Name: people_db_education; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_education (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    degree_detail character varying(100) NOT NULL,
    degree_year smallint,
    person_id integer,
    school_id integer NOT NULL,
    degree_level character varying(4) NOT NULL,
    CONSTRAINT people_db_education_degree_year_check CHECK ((degree_year >= 0))
);


ALTER TABLE public.people_db_education OWNER TO django;

--
-- Name: people_db_education_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_education_id_seq OWNER TO django;

--
-- Name: people_db_education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_education_id_seq OWNED BY public.people_db_education.id;


--
-- Name: people_db_educationevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_educationevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    degree_level character varying(4) NOT NULL,
    degree_detail character varying(100) NOT NULL,
    degree_year smallint,
    person_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL,
    school_id integer NOT NULL,
    CONSTRAINT people_db_educationevent_degree_year_check CHECK ((degree_year >= 0))
);


ALTER TABLE public.people_db_educationevent OWNER TO django;

--
-- Name: people_db_educationevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_educationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_educationevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_educationevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_educationevent_pgh_id_seq OWNED BY public.people_db_educationevent.pgh_id;


--
-- Name: people_db_party; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_party (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name text NOT NULL,
    extra_info text NOT NULL
);


ALTER TABLE public.people_db_party OWNER TO django;

--
-- Name: people_db_party_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_party_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_party_id_seq OWNER TO django;

--
-- Name: people_db_party_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_party_id_seq OWNED BY public.people_db_party.id;


--
-- Name: people_db_partytype; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_partytype (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    docket_id integer NOT NULL,
    party_id integer NOT NULL,
    date_terminated date,
    extra_info text NOT NULL,
    highest_offense_level_opening text NOT NULL,
    highest_offense_level_terminated text NOT NULL
);


ALTER TABLE public.people_db_partytype OWNER TO django;

--
-- Name: people_db_partytype_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_partytype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_partytype_id_seq OWNER TO django;

--
-- Name: people_db_partytype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_partytype_id_seq OWNED BY public.people_db_partytype.id;


--
-- Name: people_db_person; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_person (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    fjc_id integer,
    slug character varying(158) NOT NULL,
    name_first character varying(50) NOT NULL,
    name_middle character varying(50) NOT NULL,
    name_last character varying(50) NOT NULL,
    name_suffix character varying(5) NOT NULL,
    date_dob date,
    date_granularity_dob character varying(15) NOT NULL,
    date_dod date,
    date_granularity_dod character varying(15) NOT NULL,
    dob_city character varying(50) NOT NULL,
    dob_state character varying(2) NOT NULL,
    dod_city character varying(50) NOT NULL,
    dod_state character varying(2) NOT NULL,
    gender character varying(2) NOT NULL,
    is_alias_of_id integer,
    religion character varying(30) NOT NULL,
    has_photo boolean NOT NULL,
    ftm_total_received double precision,
    ftm_eid character varying(30),
    date_completed timestamp with time zone,
    dob_country character varying(50) NOT NULL,
    dod_country character varying(50) NOT NULL
);


ALTER TABLE public.people_db_person OWNER TO django;

--
-- Name: people_db_person_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_person_id_seq OWNER TO django;

--
-- Name: people_db_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_person_id_seq OWNED BY public.people_db_person.id;


--
-- Name: people_db_person_race; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_person_race (
    id integer NOT NULL,
    person_id integer NOT NULL,
    race_id integer NOT NULL
);


ALTER TABLE public.people_db_person_race OWNER TO django;

--
-- Name: people_db_person_race_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_person_race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_person_race_id_seq OWNER TO django;

--
-- Name: people_db_person_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_person_race_id_seq OWNED BY public.people_db_person_race.id;


--
-- Name: people_db_personevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_personevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_completed timestamp with time zone,
    fjc_id integer,
    slug character varying(158) NOT NULL,
    name_first character varying(50) NOT NULL,
    name_middle character varying(50) NOT NULL,
    name_last character varying(50) NOT NULL,
    name_suffix character varying(5) NOT NULL,
    date_dob date,
    date_granularity_dob character varying(15) NOT NULL,
    date_dod date,
    date_granularity_dod character varying(15) NOT NULL,
    dob_city character varying(50) NOT NULL,
    dob_state character varying(2) NOT NULL,
    dob_country character varying(50) NOT NULL,
    dod_city character varying(50) NOT NULL,
    dod_state character varying(2) NOT NULL,
    dod_country character varying(50) NOT NULL,
    gender character varying(2) NOT NULL,
    religion character varying(30) NOT NULL,
    ftm_total_received double precision,
    ftm_eid character varying(30),
    has_photo boolean NOT NULL,
    is_alias_of_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.people_db_personevent OWNER TO django;

--
-- Name: people_db_personevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_personevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_personevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_personevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_personevent_pgh_id_seq OWNED BY public.people_db_personevent.pgh_id;


--
-- Name: people_db_personraceevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_personraceevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    person_id integer NOT NULL,
    pgh_context_id uuid,
    race_id integer NOT NULL
);


ALTER TABLE public.people_db_personraceevent OWNER TO django;

--
-- Name: people_db_personraceevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_personraceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_personraceevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_personraceevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_personraceevent_pgh_id_seq OWNED BY public.people_db_personraceevent.pgh_id;


--
-- Name: people_db_politicalaffiliation; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_politicalaffiliation (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    political_party character varying(5) NOT NULL,
    source character varying(5) NOT NULL,
    date_start date,
    date_granularity_start character varying(15) NOT NULL,
    date_end date,
    date_granularity_end character varying(15) NOT NULL,
    person_id integer
);


ALTER TABLE public.people_db_politicalaffiliation OWNER TO django;

--
-- Name: people_db_politicalaffiliation_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_politicalaffiliation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_politicalaffiliation_id_seq OWNER TO django;

--
-- Name: people_db_politicalaffiliation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_politicalaffiliation_id_seq OWNED BY public.people_db_politicalaffiliation.id;


--
-- Name: people_db_politicalaffiliationevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_politicalaffiliationevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    political_party character varying(5) NOT NULL,
    source character varying(5) NOT NULL,
    date_start date,
    date_granularity_start character varying(15) NOT NULL,
    date_end date,
    date_granularity_end character varying(15) NOT NULL,
    person_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.people_db_politicalaffiliationevent OWNER TO django;

--
-- Name: people_db_politicalaffiliationevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_politicalaffiliationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_politicalaffiliationevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_politicalaffiliationevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_politicalaffiliationevent_pgh_id_seq OWNED BY public.people_db_politicalaffiliationevent.pgh_id;


--
-- Name: people_db_position; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_position (
    id integer NOT NULL,
    position_type character varying(20),
    job_title character varying(100) NOT NULL,
    organization_name character varying(120),
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_nominated date,
    date_elected date,
    date_recess_appointment date,
    date_referred_to_judicial_committee date,
    date_judicial_committee_action date,
    date_hearing date,
    date_confirmation date,
    date_start date,
    date_granularity_start character varying(15) NOT NULL,
    date_retirement date,
    date_termination date,
    date_granularity_termination character varying(15) NOT NULL,
    judicial_committee_action character varying(20) NOT NULL,
    nomination_process character varying(20) NOT NULL,
    voice_vote boolean,
    votes_yes integer,
    votes_no integer,
    how_selected character varying(20) NOT NULL,
    termination_reason character varying(25) NOT NULL,
    court_id character varying(15),
    person_id integer,
    school_id integer,
    appointer_id integer,
    predecessor_id integer,
    supervisor_id integer,
    vote_type character varying(2) NOT NULL,
    votes_no_percent double precision,
    votes_yes_percent double precision,
    location_city character varying(50) NOT NULL,
    location_state character varying(2) NOT NULL,
    has_inferred_values boolean NOT NULL,
    sector smallint,
    CONSTRAINT people_db_position_votes_no_check CHECK ((votes_no >= 0)),
    CONSTRAINT people_db_position_votes_yes_check CHECK ((votes_yes >= 0))
);


ALTER TABLE public.people_db_position OWNER TO django;

--
-- Name: people_db_position_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_position_id_seq OWNER TO django;

--
-- Name: people_db_position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_position_id_seq OWNED BY public.people_db_position.id;


--
-- Name: people_db_positionevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_positionevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    position_type character varying(20),
    job_title character varying(100) NOT NULL,
    sector smallint,
    organization_name character varying(120),
    location_city character varying(50) NOT NULL,
    location_state character varying(2) NOT NULL,
    date_nominated date,
    date_elected date,
    date_recess_appointment date,
    date_referred_to_judicial_committee date,
    date_judicial_committee_action date,
    judicial_committee_action character varying(20) NOT NULL,
    date_hearing date,
    date_confirmation date,
    date_start date,
    date_granularity_start character varying(15) NOT NULL,
    date_termination date,
    termination_reason character varying(25) NOT NULL,
    date_granularity_termination character varying(15) NOT NULL,
    date_retirement date,
    nomination_process character varying(20) NOT NULL,
    vote_type character varying(2) NOT NULL,
    voice_vote boolean,
    votes_yes integer,
    votes_no integer,
    votes_yes_percent double precision,
    votes_no_percent double precision,
    how_selected character varying(20) NOT NULL,
    has_inferred_values boolean NOT NULL,
    appointer_id integer,
    court_id character varying(15),
    person_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL,
    predecessor_id integer,
    school_id integer,
    supervisor_id integer,
    CONSTRAINT people_db_positionevent_votes_no_check CHECK ((votes_no >= 0)),
    CONSTRAINT people_db_positionevent_votes_yes_check CHECK ((votes_yes >= 0))
);


ALTER TABLE public.people_db_positionevent OWNER TO django;

--
-- Name: people_db_positionevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_positionevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_positionevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_positionevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_positionevent_pgh_id_seq OWNED BY public.people_db_positionevent.pgh_id;


--
-- Name: people_db_race; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_race (
    id integer NOT NULL,
    race character varying(5) NOT NULL
);


ALTER TABLE public.people_db_race OWNER TO django;

--
-- Name: people_db_race_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_race_id_seq OWNER TO django;

--
-- Name: people_db_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_race_id_seq OWNED BY public.people_db_race.id;


--
-- Name: people_db_raceevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_raceevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    race character varying(5) NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.people_db_raceevent OWNER TO django;


--
-- Name: people_db_raceevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_raceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_raceevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_raceevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_raceevent_pgh_id_seq OWNED BY public.people_db_raceevent.pgh_id;


--
-- Name: people_db_retentionevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_retentionevent (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    retention_type character varying(10) NOT NULL,
    date_retention date NOT NULL,
    votes_yes integer,
    votes_no integer,
    unopposed boolean,
    won boolean,
    position_id integer,
    votes_no_percent double precision,
    votes_yes_percent double precision,
    CONSTRAINT people_db_retentionevent_votes_no_check CHECK ((votes_no >= 0)),
    CONSTRAINT people_db_retentionevent_votes_yes_check CHECK ((votes_yes >= 0))
);


ALTER TABLE public.people_db_retentionevent OWNER TO django;

--
-- Name: people_db_retentionevent_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_retentionevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_retentionevent_id_seq OWNER TO django;

--
-- Name: people_db_retentionevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_retentionevent_id_seq OWNED BY public.people_db_retentionevent.id;


--
-- Name: people_db_retentioneventevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_retentioneventevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    retention_type character varying(10) NOT NULL,
    date_retention date NOT NULL,
    votes_yes integer,
    votes_no integer,
    votes_yes_percent double precision,
    votes_no_percent double precision,
    unopposed boolean,
    won boolean,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL,
    position_id integer,
    CONSTRAINT people_db_retentioneventevent_votes_no_check CHECK ((votes_no >= 0)),
    CONSTRAINT people_db_retentioneventevent_votes_yes_check CHECK ((votes_yes >= 0))
);


ALTER TABLE public.people_db_retentioneventevent OWNER TO django;

--
-- Name: people_db_retentioneventevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_retentioneventevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_retentioneventevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_retentioneventevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_retentioneventevent_pgh_id_seq OWNED BY public.people_db_retentioneventevent.pgh_id;


--
-- Name: people_db_role; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_role (
    id integer NOT NULL,
    role smallint,
    date_action date,
    attorney_id integer NOT NULL,
    docket_id integer NOT NULL,
    party_id integer NOT NULL,
    role_raw text NOT NULL
);


ALTER TABLE public.people_db_role OWNER TO django;

--
-- Name: people_db_role_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_role_id_seq OWNER TO django;

--
-- Name: people_db_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_role_id_seq OWNED BY public.people_db_role.id;


--
-- Name: people_db_school; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_school (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name character varying(120) NOT NULL,
    ein integer,
    is_alias_of_id integer
);


ALTER TABLE public.people_db_school OWNER TO django;

--
-- Name: people_db_school_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_school_id_seq OWNER TO django;

--
-- Name: people_db_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_school_id_seq OWNED BY public.people_db_school.id;


--
-- Name: people_db_schoolevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_schoolevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name character varying(120) NOT NULL,
    ein integer,
    is_alias_of_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.people_db_schoolevent OWNER TO django;

--
-- Name: people_db_schoolevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_schoolevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_schoolevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_schoolevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_schoolevent_pgh_id_seq OWNED BY public.people_db_schoolevent.pgh_id;


--
-- Name: people_db_source; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_source (
    id integer NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    url character varying(2000) NOT NULL,
    date_accessed date,
    notes text NOT NULL,
    person_id integer,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.people_db_source OWNER TO django;

--
-- Name: people_db_source_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_source_id_seq OWNER TO django;

--
-- Name: people_db_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_source_id_seq OWNED BY public.people_db_source.id;


--
-- Name: people_db_sourceevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.people_db_sourceevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    url character varying(2000) NOT NULL,
    date_accessed date,
    notes text NOT NULL,
    person_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.people_db_sourceevent OWNER TO django;

--
-- Name: people_db_sourceevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.people_db_sourceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_sourceevent_pgh_id_seq OWNER TO django;

--
-- Name: people_db_sourceevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.people_db_sourceevent_pgh_id_seq OWNED BY public.people_db_sourceevent.pgh_id;


--
-- Name: search_bankruptcyinformation; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_bankruptcyinformation (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_converted timestamp with time zone,
    date_last_to_file_claims timestamp with time zone,
    date_last_to_file_govt timestamp with time zone,
    date_debtor_dismissed timestamp with time zone,
    chapter character varying(10) NOT NULL,
    trustee_str text NOT NULL,
    docket_id integer NOT NULL
);


ALTER TABLE public.search_bankruptcyinformation OWNER TO django;

--
-- Name: search_bankruptcyinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_bankruptcyinformation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_bankruptcyinformation_id_seq OWNER TO django;

--
-- Name: search_bankruptcyinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_bankruptcyinformation_id_seq OWNED BY public.search_bankruptcyinformation.id;


--
-- Name: search_bankruptcyinformationevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_bankruptcyinformationevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_converted timestamp with time zone,
    date_last_to_file_claims timestamp with time zone,
    date_last_to_file_govt timestamp with time zone,
    date_debtor_dismissed timestamp with time zone,
    chapter character varying(10) NOT NULL,
    trustee_str text NOT NULL,
    docket_id integer NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.search_bankruptcyinformationevent OWNER TO django;

--
-- Name: search_bankruptcyinformationevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq OWNER TO django;

--
-- Name: search_bankruptcyinformationevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq OWNED BY public.search_bankruptcyinformationevent.pgh_id;


--
-- Name: search_citation; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_citation (
    id integer NOT NULL,
    volume smallint NOT NULL,
    reporter text NOT NULL,
    page text NOT NULL,
    type smallint NOT NULL,
    cluster_id integer NOT NULL
);


ALTER TABLE public.search_citation OWNER TO django;

--
-- Name: search_citation_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_citation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_citation_id_seq OWNER TO django;

--
-- Name: search_citation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_citation_id_seq OWNED BY public.search_citation.id;


--
-- Name: search_citationevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_citationevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    volume smallint NOT NULL,
    reporter text NOT NULL,
    page text NOT NULL,
    type smallint NOT NULL,
    cluster_id integer NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.search_citationevent OWNER TO django;

--
-- Name: search_citationevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_citationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_citationevent_pgh_id_seq OWNER TO django;

--
-- Name: search_citationevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_citationevent_pgh_id_seq OWNED BY public.search_citationevent.pgh_id;


--
-- Name: search_claim; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_claim (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_claim_modified timestamp with time zone,
    date_original_entered timestamp with time zone,
    date_original_filed timestamp with time zone,
    date_last_amendment_entered timestamp with time zone,
    date_last_amendment_filed timestamp with time zone,
    claim_number character varying(10) NOT NULL,
    creditor_details text NOT NULL,
    creditor_id character varying(50) NOT NULL,
    status character varying(1000) NOT NULL,
    entered_by character varying(1000) NOT NULL,
    filed_by character varying(1000) NOT NULL,
    amount_claimed character varying(100) NOT NULL,
    unsecured_claimed character varying(100) NOT NULL,
    secured_claimed character varying(100) NOT NULL,
    priority_claimed character varying(100) NOT NULL,
    description text NOT NULL,
    remarks text NOT NULL,
    docket_id integer NOT NULL
);


ALTER TABLE public.search_claim OWNER TO django;

--
-- Name: search_claim_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claim_id_seq OWNER TO django;

--
-- Name: search_claim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_claim_id_seq OWNED BY public.search_claim.id;


--
-- Name: search_claim_tags; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_claim_tags (
    id integer NOT NULL,
    claim_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_claim_tags OWNER TO django;

--
-- Name: search_claim_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_claim_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claim_tags_id_seq OWNER TO django;

--
-- Name: search_claim_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_claim_tags_id_seq OWNED BY public.search_claim_tags.id;


--
-- Name: search_claimevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_claimevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_claim_modified timestamp with time zone,
    date_original_entered timestamp with time zone,
    date_original_filed timestamp with time zone,
    date_last_amendment_entered timestamp with time zone,
    date_last_amendment_filed timestamp with time zone,
    claim_number character varying(10) NOT NULL,
    creditor_details text NOT NULL,
    creditor_id character varying(50) NOT NULL,
    status character varying(1000) NOT NULL,
    entered_by character varying(1000) NOT NULL,
    filed_by character varying(1000) NOT NULL,
    amount_claimed character varying(100) NOT NULL,
    unsecured_claimed character varying(100) NOT NULL,
    secured_claimed character varying(100) NOT NULL,
    priority_claimed character varying(100) NOT NULL,
    description text NOT NULL,
    remarks text NOT NULL,
    docket_id integer NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.search_claimevent OWNER TO django;

--
-- Name: search_claimevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_claimevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claimevent_pgh_id_seq OWNER TO django;

--
-- Name: search_claimevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_claimevent_pgh_id_seq OWNED BY public.search_claimevent.pgh_id;


--
-- Name: search_claimhistory; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_claimhistory (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_upload timestamp with time zone,
    document_number character varying(32) NOT NULL,
    attachment_number smallint,
    pacer_doc_id character varying(32) NOT NULL,
    is_available boolean,
    sha1 character varying(40) NOT NULL,
    page_count integer,
    file_size integer,
    filepath_local character varying(1000) NOT NULL,
    filepath_ia character varying(1000) NOT NULL,
    ia_upload_failure_count smallint,
    thumbnail character varying(100),
    thumbnail_status smallint NOT NULL,
    plain_text text NOT NULL,
    ocr_status smallint,
    is_free_on_pacer boolean,
    is_sealed boolean,
    date_filed date,
    claim_document_type integer NOT NULL,
    description text NOT NULL,
    claim_doc_id character varying(32) NOT NULL,
    pacer_dm_id integer,
    pacer_case_id character varying(100) NOT NULL,
    claim_id integer NOT NULL
);


ALTER TABLE public.search_claimhistory OWNER TO django;

--
-- Name: search_claimhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_claimhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claimhistory_id_seq OWNER TO django;

--
-- Name: search_claimhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_claimhistory_id_seq OWNED BY public.search_claimhistory.id;


--
-- Name: search_claimhistoryevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_claimhistoryevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    sha1 character varying(40) NOT NULL,
    page_count integer,
    file_size integer,
    filepath_local character varying(1000) NOT NULL,
    filepath_ia character varying(1000) NOT NULL,
    ia_upload_failure_count smallint,
    thumbnail character varying(100),
    thumbnail_status smallint NOT NULL,
    plain_text text NOT NULL,
    ocr_status smallint,
    date_upload timestamp with time zone,
    document_number character varying(32) NOT NULL,
    attachment_number smallint,
    pacer_doc_id character varying(32) NOT NULL,
    is_available boolean,
    is_free_on_pacer boolean,
    is_sealed boolean,
    date_filed date,
    claim_document_type integer NOT NULL,
    description text NOT NULL,
    claim_doc_id character varying(32) NOT NULL,
    pacer_dm_id integer,
    pacer_case_id character varying(100) NOT NULL,
    claim_id integer NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.search_claimhistoryevent OWNER TO django;

--
-- Name: search_claimhistoryevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_claimhistoryevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claimhistoryevent_pgh_id_seq OWNER TO django;

--
-- Name: search_claimhistoryevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_claimhistoryevent_pgh_id_seq OWNED BY public.search_claimhistoryevent.pgh_id;


--
-- Name: search_claimtagsevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_claimtagsevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    claim_id integer NOT NULL,
    pgh_context_id uuid,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_claimtagsevent OWNER TO django;

--
-- Name: search_claimtagsevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_claimtagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claimtagsevent_pgh_id_seq OWNER TO django;

--
-- Name: search_claimtagsevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_claimtagsevent_pgh_id_seq OWNED BY public.search_claimtagsevent.pgh_id;


--
-- Name: search_court; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_court (
    id character varying(15) NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    in_use boolean NOT NULL,
    has_opinion_scraper boolean NOT NULL,
    has_oral_argument_scraper boolean NOT NULL,
    "position" double precision NOT NULL,
    citation_string character varying(100) NOT NULL,
    short_name character varying(100) NOT NULL,
    full_name character varying(200) NOT NULL,
    url character varying(500) NOT NULL,
    start_date date,
    end_date date,
    jurisdiction character varying(3) NOT NULL,
    notes text NOT NULL,
    pacer_court_id smallint,
    fjc_court_id character varying(3) NOT NULL,
    pacer_has_rss_feed boolean,
    date_last_pacer_contact timestamp with time zone,
    pacer_rss_entry_types text NOT NULL,
    parent_court_id character varying(15),
    CONSTRAINT search_court_pacer_court_id_check CHECK ((pacer_court_id >= 0))
);


ALTER TABLE public.search_court OWNER TO django;

--
-- Name: search_court_appeals_to; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_court_appeals_to (
    id integer NOT NULL,
    from_court_id character varying(15) NOT NULL,
    to_court_id character varying(15) NOT NULL
);


ALTER TABLE public.search_court_appeals_to OWNER TO django;

--
-- Name: search_court_appeals_to_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

ALTER TABLE public.search_court_appeals_to ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_court_appeals_to_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: search_courtappealstoevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_courtappealstoevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    from_court_id character varying(15) NOT NULL,
    pgh_context_id uuid,
    to_court_id character varying(15) NOT NULL
);


ALTER TABLE public.search_courtappealstoevent OWNER TO django;

--
-- Name: search_courtappealstoevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

ALTER TABLE public.search_courtappealstoevent ALTER COLUMN pgh_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_courtappealstoevent_pgh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: search_courtevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_courtevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id character varying(15) NOT NULL,
    pacer_court_id smallint,
    pacer_has_rss_feed boolean,
    pacer_rss_entry_types text NOT NULL,
    date_last_pacer_contact timestamp with time zone,
    fjc_court_id character varying(3) NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    in_use boolean NOT NULL,
    has_opinion_scraper boolean NOT NULL,
    has_oral_argument_scraper boolean NOT NULL,
    "position" double precision NOT NULL,
    citation_string character varying(100) NOT NULL,
    short_name character varying(100) NOT NULL,
    full_name character varying(200) NOT NULL,
    url character varying(500) NOT NULL,
    start_date date,
    end_date date,
    jurisdiction character varying(3) NOT NULL,
    notes text NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id character varying(15) NOT NULL,
    parent_court_id character varying(15),
    CONSTRAINT search_courtevent_pacer_court_id_check CHECK ((pacer_court_id >= 0))
);


ALTER TABLE public.search_courtevent OWNER TO django;

--
-- Name: search_courtevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_courtevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_courtevent_pgh_id_seq OWNER TO django;

--
-- Name: search_courtevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_courtevent_pgh_id_seq OWNED BY public.search_courtevent.pgh_id;


--
-- Name: search_courthouse; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_courthouse (
    id integer NOT NULL,
    court_seat boolean,
    building_name text NOT NULL,
    address1 text NOT NULL,
    address2 text NOT NULL,
    city text NOT NULL,
    county text NOT NULL,
    state character varying(2) NOT NULL,
    zip_code character varying(10) NOT NULL,
    country_code text NOT NULL,
    court_id character varying(15) NOT NULL
);


ALTER TABLE public.search_courthouse OWNER TO django;

--
-- Name: search_courthouse_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

ALTER TABLE public.search_courthouse ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_courthouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: search_courthouseevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_courthouseevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    court_seat boolean,
    building_name text NOT NULL,
    address1 text NOT NULL,
    address2 text NOT NULL,
    city text NOT NULL,
    county text NOT NULL,
    state character varying(2) NOT NULL,
    zip_code character varying(10) NOT NULL,
    country_code text NOT NULL,
    court_id character varying(15) NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.search_courthouseevent OWNER TO django;

--
-- Name: search_courthouseevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

ALTER TABLE public.search_courthouseevent ALTER COLUMN pgh_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_courthouseevent_pgh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: search_docket; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_docket (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_argued date,
    date_reargued date,
    date_reargument_denied date,
    case_name_short text NOT NULL,
    case_name text NOT NULL,
    case_name_full text NOT NULL,
    slug character varying(75) NOT NULL,
    docket_number text,
    date_blocked date,
    blocked boolean NOT NULL,
    court_id character varying(15) NOT NULL,
    date_cert_denied date,
    date_cert_granted date,
    assigned_to_id integer,
    cause character varying(2000) NOT NULL,
    date_filed date,
    date_last_filing date,
    date_terminated date,
    filepath_ia character varying(1000) NOT NULL,
    filepath_local character varying(1000) NOT NULL,
    jurisdiction_type character varying(100) NOT NULL,
    jury_demand character varying(500) NOT NULL,
    nature_of_suit character varying(1000) NOT NULL,
    pacer_case_id character varying(100),
    referred_to_id integer,
    source smallint NOT NULL,
    assigned_to_str text NOT NULL,
    referred_to_str text NOT NULL,
    view_count integer NOT NULL,
    date_last_index timestamp with time zone,
    appeal_from_id character varying(15),
    appeal_from_str text NOT NULL,
    appellate_case_type_information text NOT NULL,
    appellate_fee_status text NOT NULL,
    panel_str text NOT NULL,
    originating_court_information_id integer,
    mdl_status character varying(100) NOT NULL,
    filepath_ia_json character varying(1000) NOT NULL,
    ia_date_first_change timestamp with time zone,
    ia_needs_upload boolean,
    ia_upload_failure_count smallint,
    docket_number_core character varying(20) NOT NULL,
    idb_data_id integer
);


ALTER TABLE public.search_docket OWNER TO django;

--
-- Name: search_docket_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_docket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_docket_id_seq OWNER TO django;

--
-- Name: search_docket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_docket_id_seq OWNED BY public.search_docket.id;


--
-- Name: search_docket_panel; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_docket_panel (
    id integer NOT NULL,
    docket_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.search_docket_panel OWNER TO django;

--
-- Name: search_docket_panel_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_docket_panel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_docket_panel_id_seq OWNER TO django;

--
-- Name: search_docket_panel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_docket_panel_id_seq OWNED BY public.search_docket_panel.id;


--
-- Name: search_docket_tags; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_docket_tags (
    id integer NOT NULL,
    docket_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_docket_tags OWNER TO django;

--
-- Name: search_docket_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_docket_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_docket_tags_id_seq OWNER TO django;

--
-- Name: search_docket_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_docket_tags_id_seq OWNED BY public.search_docket_tags.id;


--
-- Name: search_docketentry; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_docketentry (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_filed date,
    entry_number bigint,
    description text NOT NULL,
    docket_id integer NOT NULL,
    pacer_sequence_number integer,
    recap_sequence_number character varying(50) NOT NULL,
    time_filed time without time zone
);


ALTER TABLE public.search_docketentry OWNER TO django;

--
-- Name: search_docketentry_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_docketentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_docketentry_id_seq OWNER TO django;

--
-- Name: search_docketentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_docketentry_id_seq OWNED BY public.search_docketentry.id;


--
-- Name: search_docketentry_tags; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_docketentry_tags (
    id integer NOT NULL,
    docketentry_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_docketentry_tags OWNER TO django;

--
-- Name: search_docketentry_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_docketentry_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_docketentry_tags_id_seq OWNER TO django;

--
-- Name: search_docketentry_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_docketentry_tags_id_seq OWNED BY public.search_docketentry_tags.id;


--
-- Name: search_docketentryevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_docketentryevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_filed date,
    entry_number bigint,
    recap_sequence_number character varying(50) NOT NULL,
    pacer_sequence_number integer,
    description text NOT NULL,
    docket_id integer NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL,
    time_filed time without time zone
);


ALTER TABLE public.search_docketentryevent OWNER TO django;

--
-- Name: search_docketentryevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_docketentryevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_docketentryevent_pgh_id_seq OWNER TO django;

--
-- Name: search_docketentryevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_docketentryevent_pgh_id_seq OWNED BY public.search_docketentryevent.pgh_id;


--
-- Name: search_docketentrytagsevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_docketentrytagsevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    docketentry_id integer NOT NULL,
    pgh_context_id uuid,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_docketentrytagsevent OWNER TO django;

--
-- Name: search_docketentrytagsevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_docketentrytagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_docketentrytagsevent_pgh_id_seq OWNER TO django;

--
-- Name: search_docketentrytagsevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_docketentrytagsevent_pgh_id_seq OWNED BY public.search_docketentrytagsevent.pgh_id;


--
-- Name: search_docketevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_docketevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    source smallint NOT NULL,
    appeal_from_str text NOT NULL,
    assigned_to_str text NOT NULL,
    referred_to_str text NOT NULL,
    panel_str text NOT NULL,
    date_last_index timestamp with time zone,
    date_cert_granted date,
    date_cert_denied date,
    date_argued date,
    date_reargued date,
    date_reargument_denied date,
    date_filed date,
    date_terminated date,
    date_last_filing date,
    case_name_short text NOT NULL,
    case_name text NOT NULL,
    case_name_full text NOT NULL,
    slug character varying(75) NOT NULL,
    docket_number text,
    docket_number_core character varying(20) NOT NULL,
    pacer_case_id character varying(100),
    cause character varying(2000) NOT NULL,
    nature_of_suit character varying(1000) NOT NULL,
    jury_demand character varying(500) NOT NULL,
    jurisdiction_type character varying(100) NOT NULL,
    appellate_fee_status text NOT NULL,
    appellate_case_type_information text NOT NULL,
    mdl_status character varying(100) NOT NULL,
    filepath_local character varying(1000) NOT NULL,
    filepath_ia character varying(1000) NOT NULL,
    filepath_ia_json character varying(1000) NOT NULL,
    ia_upload_failure_count smallint,
    ia_needs_upload boolean,
    ia_date_first_change timestamp with time zone,
    date_blocked date,
    blocked boolean NOT NULL,
    appeal_from_id character varying(15),
    assigned_to_id integer,
    court_id character varying(15) NOT NULL,
    idb_data_id integer,
    originating_court_information_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL,
    referred_to_id integer
);


ALTER TABLE public.search_docketevent OWNER TO django;

--
-- Name: search_docketevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_docketevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_docketevent_pgh_id_seq OWNER TO django;

--
-- Name: search_docketevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_docketevent_pgh_id_seq OWNED BY public.search_docketevent.pgh_id;


--
-- Name: search_docketpanelevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_docketpanelevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    docket_id integer NOT NULL,
    person_id integer NOT NULL,
    pgh_context_id uuid
);


ALTER TABLE public.search_docketpanelevent OWNER TO django;

--
-- Name: search_docketpanelevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_docketpanelevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_docketpanelevent_pgh_id_seq OWNER TO django;

--
-- Name: search_docketpanelevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_docketpanelevent_pgh_id_seq OWNED BY public.search_docketpanelevent.pgh_id;


--
-- Name: search_dockettagsevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_dockettagsevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    docket_id integer NOT NULL,
    pgh_context_id uuid,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_dockettagsevent OWNER TO django;

--
-- Name: search_dockettagsevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_dockettagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_dockettagsevent_pgh_id_seq OWNER TO django;

--
-- Name: search_dockettagsevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_dockettagsevent_pgh_id_seq OWNED BY public.search_dockettagsevent.pgh_id;


--
-- Name: search_opinion; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinion (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    type character varying(20) NOT NULL,
    sha1 character varying(40) NOT NULL,
    download_url character varying(500),
    local_path character varying(100) NOT NULL,
    plain_text text NOT NULL,
    html text NOT NULL,
    html_lawbox text NOT NULL,
    html_columbia text NOT NULL,
    html_with_citations text NOT NULL,
    extracted_by_ocr boolean NOT NULL,
    author_id integer,
    cluster_id integer NOT NULL,
    per_curiam boolean NOT NULL,
    page_count integer,
    author_str text NOT NULL,
    joined_by_str text NOT NULL,
    xml_harvard text NOT NULL,
    html_anon_2020 text NOT NULL
);


ALTER TABLE public.search_opinion OWNER TO django;

--
-- Name: search_opinion_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinion_id_seq OWNER TO django;

--
-- Name: search_opinion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinion_id_seq OWNED BY public.search_opinion.id;


--
-- Name: search_opinion_joined_by; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinion_joined_by (
    id integer NOT NULL,
    opinion_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.search_opinion_joined_by OWNER TO django;

--
-- Name: search_opinion_joined_by_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinion_joined_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinion_joined_by_id_seq OWNER TO django;

--
-- Name: search_opinion_joined_by_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinion_joined_by_id_seq OWNED BY public.search_opinion_joined_by.id;


--
-- Name: search_opinioncluster; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinioncluster (
    id integer NOT NULL,
    judges text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_filed date NOT NULL,
    slug character varying(75),
    case_name_short text NOT NULL,
    case_name text NOT NULL,
    case_name_full text NOT NULL,
    scdb_id character varying(10) NOT NULL,
    source character varying(10) NOT NULL,
    procedural_history text NOT NULL,
    attorneys text NOT NULL,
    nature_of_suit text NOT NULL,
    posture text NOT NULL,
    syllabus text NOT NULL,
    citation_count integer NOT NULL,
    precedential_status character varying(50) NOT NULL,
    date_blocked date,
    blocked boolean NOT NULL,
    docket_id integer NOT NULL,
    scdb_decision_direction integer,
    scdb_votes_majority integer,
    scdb_votes_minority integer,
    date_filed_is_approximate boolean NOT NULL,
    correction text NOT NULL,
    cross_reference text NOT NULL,
    disposition text NOT NULL,
    filepath_json_harvard character varying(1000) NOT NULL,
    headnotes text NOT NULL,
    history text NOT NULL,
    other_dates text NOT NULL,
    summary text NOT NULL,
    arguments text NOT NULL,
    headmatter text NOT NULL
);


ALTER TABLE public.search_opinioncluster OWNER TO django;

--
-- Name: search_opinioncluster_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinioncluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinioncluster_id_seq OWNER TO django;

--
-- Name: search_opinioncluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinioncluster_id_seq OWNED BY public.search_opinioncluster.id;


--
-- Name: search_opinioncluster_non_participating_judges; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinioncluster_non_participating_judges (
    id integer NOT NULL,
    opinioncluster_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.search_opinioncluster_non_participating_judges OWNER TO django;

--
-- Name: search_opinioncluster_non_participating_judges_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinioncluster_non_participating_judges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinioncluster_non_participating_judges_id_seq OWNER TO django;

--
-- Name: search_opinioncluster_non_participating_judges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinioncluster_non_participating_judges_id_seq OWNED BY public.search_opinioncluster_non_participating_judges.id;


--
-- Name: search_opinioncluster_panel; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinioncluster_panel (
    id integer NOT NULL,
    opinioncluster_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.search_opinioncluster_panel OWNER TO django;

--
-- Name: search_opinioncluster_panel_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinioncluster_panel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinioncluster_panel_id_seq OWNER TO django;

--
-- Name: search_opinioncluster_panel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinioncluster_panel_id_seq OWNED BY public.search_opinioncluster_panel.id;


--
-- Name: search_opinionclusterevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinionclusterevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    judges text NOT NULL,
    date_filed date NOT NULL,
    date_filed_is_approximate boolean NOT NULL,
    slug character varying(75),
    case_name_short text NOT NULL,
    case_name text NOT NULL,
    case_name_full text NOT NULL,
    scdb_id character varying(10) NOT NULL,
    scdb_decision_direction integer,
    scdb_votes_majority integer,
    scdb_votes_minority integer,
    source character varying(10) NOT NULL,
    procedural_history text NOT NULL,
    attorneys text NOT NULL,
    nature_of_suit text NOT NULL,
    posture text NOT NULL,
    syllabus text NOT NULL,
    headnotes text NOT NULL,
    summary text NOT NULL,
    disposition text NOT NULL,
    history text NOT NULL,
    other_dates text NOT NULL,
    cross_reference text NOT NULL,
    correction text NOT NULL,
    citation_count integer NOT NULL,
    precedential_status character varying(50) NOT NULL,
    date_blocked date,
    blocked boolean NOT NULL,
    filepath_json_harvard character varying(1000) NOT NULL,
    docket_id integer NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL,
    arguments text NOT NULL,
    headmatter text NOT NULL
);


ALTER TABLE public.search_opinionclusterevent OWNER TO django;

--
-- Name: search_opinionclusterevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinionclusterevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionclusterevent_pgh_id_seq OWNER TO django;

--
-- Name: search_opinionclusterevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinionclusterevent_pgh_id_seq OWNED BY public.search_opinionclusterevent.pgh_id;


--
-- Name: search_opinionclusternonparticipatingjudgesevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinionclusternonparticipatingjudgesevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    opinioncluster_id integer NOT NULL,
    person_id integer NOT NULL,
    pgh_context_id uuid
);


ALTER TABLE public.search_opinionclusternonparticipatingjudgesevent OWNER TO django;

--
-- Name: search_opinionclusternonparticipatingjudgesevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinionclusternonparticipatingjudgesevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionclusternonparticipatingjudgesevent_pgh_id_seq OWNER TO django;

--
-- Name: search_opinionclusternonparticipatingjudgesevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinionclusternonparticipatingjudgesevent_pgh_id_seq OWNED BY public.search_opinionclusternonparticipatingjudgesevent.pgh_id;


--
-- Name: search_opinionclusterpanelevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinionclusterpanelevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    opinioncluster_id integer NOT NULL,
    person_id integer NOT NULL,
    pgh_context_id uuid
);


ALTER TABLE public.search_opinionclusterpanelevent OWNER TO django;

--
-- Name: search_opinionclusterpanelevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinionclusterpanelevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionclusterpanelevent_pgh_id_seq OWNER TO django;

--
-- Name: search_opinionclusterpanelevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinionclusterpanelevent_pgh_id_seq OWNED BY public.search_opinionclusterpanelevent.pgh_id;


--
-- Name: search_opinionevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinionevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    author_str text NOT NULL,
    per_curiam boolean NOT NULL,
    joined_by_str text NOT NULL,
    type character varying(20) NOT NULL,
    sha1 character varying(40) NOT NULL,
    page_count integer,
    download_url character varying(500),
    local_path character varying(100) NOT NULL,
    plain_text text NOT NULL,
    html text NOT NULL,
    html_lawbox text NOT NULL,
    html_columbia text NOT NULL,
    html_anon_2020 text NOT NULL,
    xml_harvard text NOT NULL,
    html_with_citations text NOT NULL,
    extracted_by_ocr boolean NOT NULL,
    author_id integer,
    cluster_id integer NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.search_opinionevent OWNER TO django;

--
-- Name: search_opinionevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinionevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionevent_pgh_id_seq OWNER TO django;

--
-- Name: search_opinionevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinionevent_pgh_id_seq OWNED BY public.search_opinionevent.pgh_id;


--
-- Name: search_opinionjoinedbyevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinionjoinedbyevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    opinion_id integer NOT NULL,
    person_id integer NOT NULL,
    pgh_context_id uuid
);


ALTER TABLE public.search_opinionjoinedbyevent OWNER TO django;

--
-- Name: search_opinionjoinedbyevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq OWNER TO django;

--
-- Name: search_opinionjoinedbyevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq OWNED BY public.search_opinionjoinedbyevent.pgh_id;


--
-- Name: search_opinionscited; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinionscited (
    id integer NOT NULL,
    cited_opinion_id integer NOT NULL,
    citing_opinion_id integer NOT NULL,
    depth integer NOT NULL
);


ALTER TABLE public.search_opinionscited OWNER TO django;

--
-- Name: search_opinionscited_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinionscited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionscited_id_seq OWNER TO django;

--
-- Name: search_opinionscited_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinionscited_id_seq OWNED BY public.search_opinionscited.id;


--
-- Name: search_opinionscitedbyrecapdocument; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_opinionscitedbyrecapdocument (
    id integer NOT NULL,
    depth integer NOT NULL,
    cited_opinion_id integer NOT NULL,
    citing_document_id integer NOT NULL
);


ALTER TABLE public.search_opinionscitedbyrecapdocument OWNER TO django;

--
-- Name: search_opinionscitedbyrecapdocument_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq OWNER TO django;

--
-- Name: search_opinionscitedbyrecapdocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq OWNED BY public.search_opinionscitedbyrecapdocument.id;


--
-- Name: search_originatingcourtinformation; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_originatingcourtinformation (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    assigned_to_str text NOT NULL,
    court_reporter text NOT NULL,
    date_disposed date,
    date_filed date,
    date_judgment date,
    date_judgment_eod date,
    date_filed_noa date,
    date_received_coa date,
    assigned_to_id integer,
    docket_number text NOT NULL,
    ordering_judge_id integer,
    ordering_judge_str text NOT NULL
);


ALTER TABLE public.search_originatingcourtinformation OWNER TO django;

--
-- Name: search_originatingcourtinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_originatingcourtinformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_originatingcourtinformation_id_seq OWNER TO django;

--
-- Name: search_originatingcourtinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_originatingcourtinformation_id_seq OWNED BY public.search_originatingcourtinformation.id;


--
-- Name: search_originatingcourtinformationevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_originatingcourtinformationevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    docket_number text NOT NULL,
    assigned_to_str text NOT NULL,
    ordering_judge_str text NOT NULL,
    court_reporter text NOT NULL,
    date_disposed date,
    date_filed date,
    date_judgment date,
    date_judgment_eod date,
    date_filed_noa date,
    date_received_coa date,
    assigned_to_id integer,
    ordering_judge_id integer,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.search_originatingcourtinformationevent OWNER TO django;

--
-- Name: search_originatingcourtinformationevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq OWNER TO django;

--
-- Name: search_originatingcourtinformationevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq OWNED BY public.search_originatingcourtinformationevent.pgh_id;


--
-- Name: search_parenthetical; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_parenthetical (
    id integer NOT NULL,
    text text NOT NULL,
    score double precision NOT NULL,
    described_opinion_id integer NOT NULL,
    describing_opinion_id integer NOT NULL,
    group_id integer
);


ALTER TABLE public.search_parenthetical OWNER TO django;

--
-- Name: search_parenthetical_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_parenthetical_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_parenthetical_id_seq OWNER TO django;

--
-- Name: search_parenthetical_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_parenthetical_id_seq OWNED BY public.search_parenthetical.id;


--
-- Name: search_parentheticalgroup; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_parentheticalgroup (
    id integer NOT NULL,
    score double precision NOT NULL,
    size integer NOT NULL,
    opinion_id integer NOT NULL,
    representative_id integer NOT NULL
);


ALTER TABLE public.search_parentheticalgroup OWNER TO django;

--
-- Name: search_parentheticalgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_parentheticalgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_parentheticalgroup_id_seq OWNER TO django;

--
-- Name: search_parentheticalgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_parentheticalgroup_id_seq OWNED BY public.search_parentheticalgroup.id;


--
-- Name: search_recapdocument; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_recapdocument (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    date_upload timestamp with time zone,
    document_type integer NOT NULL,
    document_number character varying(32) NOT NULL,
    attachment_number smallint,
    pacer_doc_id character varying(32) NOT NULL,
    is_available boolean,
    sha1 character varying(40) NOT NULL,
    filepath_local character varying(1000) NOT NULL,
    filepath_ia character varying(1000) NOT NULL,
    docket_entry_id integer NOT NULL,
    description text NOT NULL,
    ocr_status smallint,
    plain_text text NOT NULL,
    page_count integer,
    is_free_on_pacer boolean,
    ia_upload_failure_count smallint,
    file_size integer,
    thumbnail character varying(100),
    thumbnail_status smallint NOT NULL,
    is_sealed boolean
);


ALTER TABLE public.search_recapdocument OWNER TO django;

--
-- Name: search_recapdocument_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_recapdocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_recapdocument_id_seq OWNER TO django;

--
-- Name: search_recapdocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_recapdocument_id_seq OWNED BY public.search_recapdocument.id;


--
-- Name: search_recapdocument_tags; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_recapdocument_tags (
    id integer NOT NULL,
    recapdocument_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_recapdocument_tags OWNER TO django;

--
-- Name: search_recapdocument_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_recapdocument_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_recapdocument_tags_id_seq OWNER TO django;

--
-- Name: search_recapdocument_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_recapdocument_tags_id_seq OWNED BY public.search_recapdocument_tags.id;


--
-- Name: search_recapdocumentevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_recapdocumentevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    sha1 character varying(40) NOT NULL,
    page_count integer,
    file_size integer,
    filepath_local character varying(1000) NOT NULL,
    filepath_ia character varying(1000) NOT NULL,
    ia_upload_failure_count smallint,
    thumbnail character varying(100),
    thumbnail_status smallint NOT NULL,
    plain_text text NOT NULL,
    ocr_status smallint,
    date_upload timestamp with time zone,
    document_number character varying(32) NOT NULL,
    attachment_number smallint,
    pacer_doc_id character varying(32) NOT NULL,
    is_available boolean,
    is_free_on_pacer boolean,
    is_sealed boolean,
    document_type integer NOT NULL,
    description text NOT NULL,
    docket_entry_id integer NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.search_recapdocumentevent OWNER TO django;

--
-- Name: search_recapdocumentevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_recapdocumentevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_recapdocumentevent_pgh_id_seq OWNER TO django;

--
-- Name: search_recapdocumentevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_recapdocumentevent_pgh_id_seq OWNED BY public.search_recapdocumentevent.pgh_id;


--
-- Name: search_recapdocumenttagsevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_recapdocumenttagsevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    pgh_context_id uuid,
    recapdocument_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_recapdocumenttagsevent OWNER TO django;

--
-- Name: search_recapdocumenttagsevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq OWNER TO django;

--
-- Name: search_recapdocumenttagsevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq OWNED BY public.search_recapdocumenttagsevent.pgh_id;


--
-- Name: search_tag; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_tag (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.search_tag OWNER TO django;

--
-- Name: search_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_tag_id_seq OWNER TO django;

--
-- Name: search_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_tag_id_seq OWNED BY public.search_tag.id;


--
-- Name: search_tagevent; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.search_tagevent (
    pgh_id integer NOT NULL,
    pgh_created_at timestamp with time zone NOT NULL,
    pgh_label text NOT NULL,
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    pgh_context_id uuid,
    pgh_obj_id integer NOT NULL
);


ALTER TABLE public.search_tagevent OWNER TO django;


--
-- Name: search_tagevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.search_tagevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_tagevent_pgh_id_seq OWNER TO django;

--
-- Name: search_tagevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.search_tagevent_pgh_id_seq OWNED BY public.search_tagevent.pgh_id;


--
-- Name: audio_audio id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.audio_audio ALTER COLUMN id SET DEFAULT nextval('public.audio_audio_id_seq'::regclass);


--
-- Name: audio_audio_panel id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.audio_audio_panel ALTER COLUMN id SET DEFAULT nextval('public.audio_audio_panel_id_seq'::regclass);


--
-- Name: audio_audioevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.audio_audioevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.audio_audioevent_pgh_id_seq'::regclass);


--
-- Name: audio_audiopanelevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.audio_audiopanelevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.audio_audiopanelevent_pgh_id_seq'::regclass);


--
-- Name: people_db_abarating id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_abarating ALTER COLUMN id SET DEFAULT nextval('public.people_db_abarating_id_seq'::regclass);


--
-- Name: people_db_abaratingevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_abaratingevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_abaratingevent_pgh_id_seq'::regclass);


--
-- Name: people_db_attorney id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_attorney ALTER COLUMN id SET DEFAULT nextval('public.people_db_attorney_id_seq'::regclass);


--
-- Name: people_db_attorneyorganization id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_attorneyorganization ALTER COLUMN id SET DEFAULT nextval('public.people_db_attorneyorganization_id_seq'::regclass);


--
-- Name: people_db_attorneyorganizationassociation id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_attorneyorganizationassociation ALTER COLUMN id SET DEFAULT nextval('public.people_db_attorneyorganizationassociation_id_seq'::regclass);


--
-- Name: people_db_criminalcomplaint id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_criminalcomplaint ALTER COLUMN id SET DEFAULT nextval('public.people_db_criminalcomplaint_id_seq'::regclass);


--
-- Name: people_db_criminalcount id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_criminalcount ALTER COLUMN id SET DEFAULT nextval('public.people_db_criminalcount_id_seq'::regclass);


--
-- Name: people_db_education id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_education ALTER COLUMN id SET DEFAULT nextval('public.people_db_education_id_seq'::regclass);


--
-- Name: people_db_educationevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_educationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_educationevent_pgh_id_seq'::regclass);


--
-- Name: people_db_party id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_party ALTER COLUMN id SET DEFAULT nextval('public.people_db_party_id_seq'::regclass);


--
-- Name: people_db_partytype id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_partytype ALTER COLUMN id SET DEFAULT nextval('public.people_db_partytype_id_seq'::regclass);


--
-- Name: people_db_person id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_person ALTER COLUMN id SET DEFAULT nextval('public.people_db_person_id_seq'::regclass);


--
-- Name: people_db_person_race id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_person_race ALTER COLUMN id SET DEFAULT nextval('public.people_db_person_race_id_seq'::regclass);


--
-- Name: people_db_personevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_personevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_personevent_pgh_id_seq'::regclass);


--
-- Name: people_db_personraceevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_personraceevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_personraceevent_pgh_id_seq'::regclass);


--
-- Name: people_db_politicalaffiliation id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_politicalaffiliation ALTER COLUMN id SET DEFAULT nextval('public.people_db_politicalaffiliation_id_seq'::regclass);


--
-- Name: people_db_politicalaffiliationevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_politicalaffiliationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_politicalaffiliationevent_pgh_id_seq'::regclass);


--
-- Name: people_db_position id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_position ALTER COLUMN id SET DEFAULT nextval('public.people_db_position_id_seq'::regclass);


--
-- Name: people_db_positionevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_positionevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_positionevent_pgh_id_seq'::regclass);


--
-- Name: people_db_race id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_race ALTER COLUMN id SET DEFAULT nextval('public.people_db_race_id_seq'::regclass);


--
-- Name: people_db_raceevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_raceevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_raceevent_pgh_id_seq'::regclass);


--
-- Name: people_db_retentionevent id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_retentionevent ALTER COLUMN id SET DEFAULT nextval('public.people_db_retentionevent_id_seq'::regclass);


--
-- Name: people_db_retentioneventevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_retentioneventevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_retentioneventevent_pgh_id_seq'::regclass);


--
-- Name: people_db_role id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_role ALTER COLUMN id SET DEFAULT nextval('public.people_db_role_id_seq'::regclass);


--
-- Name: people_db_school id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_school ALTER COLUMN id SET DEFAULT nextval('public.people_db_school_id_seq'::regclass);


--
-- Name: people_db_schoolevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_schoolevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_schoolevent_pgh_id_seq'::regclass);


--
-- Name: people_db_source id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_source ALTER COLUMN id SET DEFAULT nextval('public.people_db_source_id_seq'::regclass);


--
-- Name: people_db_sourceevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_sourceevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_sourceevent_pgh_id_seq'::regclass);


--
-- Name: search_bankruptcyinformation id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_bankruptcyinformation ALTER COLUMN id SET DEFAULT nextval('public.search_bankruptcyinformation_id_seq'::regclass);


--
-- Name: search_bankruptcyinformationevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_bankruptcyinformationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_bankruptcyinformationevent_pgh_id_seq'::regclass);


--
-- Name: search_citation id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_citation ALTER COLUMN id SET DEFAULT nextval('public.search_citation_id_seq'::regclass);


--
-- Name: search_citationevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_citationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_citationevent_pgh_id_seq'::regclass);


--
-- Name: search_claim id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claim ALTER COLUMN id SET DEFAULT nextval('public.search_claim_id_seq'::regclass);


--
-- Name: search_claim_tags id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claim_tags ALTER COLUMN id SET DEFAULT nextval('public.search_claim_tags_id_seq'::regclass);


--
-- Name: search_claimevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claimevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_claimevent_pgh_id_seq'::regclass);


--
-- Name: search_claimhistory id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claimhistory ALTER COLUMN id SET DEFAULT nextval('public.search_claimhistory_id_seq'::regclass);


--
-- Name: search_claimhistoryevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claimhistoryevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_claimhistoryevent_pgh_id_seq'::regclass);


--
-- Name: search_claimtagsevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claimtagsevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_claimtagsevent_pgh_id_seq'::regclass);


--
-- Name: search_courtevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_courtevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_courtevent_pgh_id_seq'::regclass);


--
-- Name: search_docket id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket ALTER COLUMN id SET DEFAULT nextval('public.search_docket_id_seq'::regclass);


--
-- Name: search_docket_panel id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket_panel ALTER COLUMN id SET DEFAULT nextval('public.search_docket_panel_id_seq'::regclass);


--
-- Name: search_docket_tags id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket_tags ALTER COLUMN id SET DEFAULT nextval('public.search_docket_tags_id_seq'::regclass);


--
-- Name: search_docketentry id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketentry ALTER COLUMN id SET DEFAULT nextval('public.search_docketentry_id_seq'::regclass);


--
-- Name: search_docketentry_tags id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketentry_tags ALTER COLUMN id SET DEFAULT nextval('public.search_docketentry_tags_id_seq'::regclass);


--
-- Name: search_docketentryevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketentryevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_docketentryevent_pgh_id_seq'::regclass);


--
-- Name: search_docketentrytagsevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketentrytagsevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_docketentrytagsevent_pgh_id_seq'::regclass);


--
-- Name: search_docketevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_docketevent_pgh_id_seq'::regclass);


--
-- Name: search_docketpanelevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketpanelevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_docketpanelevent_pgh_id_seq'::regclass);


--
-- Name: search_dockettagsevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_dockettagsevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_dockettagsevent_pgh_id_seq'::regclass);


--
-- Name: search_opinion id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinion ALTER COLUMN id SET DEFAULT nextval('public.search_opinion_id_seq'::regclass);


--
-- Name: search_opinion_joined_by id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinion_joined_by ALTER COLUMN id SET DEFAULT nextval('public.search_opinion_joined_by_id_seq'::regclass);


--
-- Name: search_opinioncluster id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinioncluster ALTER COLUMN id SET DEFAULT nextval('public.search_opinioncluster_id_seq'::regclass);


--
-- Name: search_opinioncluster_non_participating_judges id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinioncluster_non_participating_judges ALTER COLUMN id SET DEFAULT nextval('public.search_opinioncluster_non_participating_judges_id_seq'::regclass);


--
-- Name: search_opinioncluster_panel id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinioncluster_panel ALTER COLUMN id SET DEFAULT nextval('public.search_opinioncluster_panel_id_seq'::regclass);


--
-- Name: search_opinionclusterevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionclusterevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionclusterevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionclusternonparticipatingjudgesevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionclusternonparticipatingjudgesevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionclusternonparticipatingjudgesevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionclusterpanelevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionclusterpanelevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionclusterpanelevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionjoinedbyevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionjoinedbyevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionjoinedbyevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionscited id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionscited ALTER COLUMN id SET DEFAULT nextval('public.search_opinionscited_id_seq'::regclass);


--
-- Name: search_opinionscitedbyrecapdocument id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionscitedbyrecapdocument ALTER COLUMN id SET DEFAULT nextval('public.search_opinionscitedbyrecapdocument_id_seq'::regclass);


--
-- Name: search_originatingcourtinformation id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_originatingcourtinformation ALTER COLUMN id SET DEFAULT nextval('public.search_originatingcourtinformation_id_seq'::regclass);


--
-- Name: search_originatingcourtinformationevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_originatingcourtinformationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_originatingcourtinformationevent_pgh_id_seq'::regclass);


--
-- Name: search_parenthetical id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_parenthetical ALTER COLUMN id SET DEFAULT nextval('public.search_parenthetical_id_seq'::regclass);


--
-- Name: search_parentheticalgroup id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_parentheticalgroup ALTER COLUMN id SET DEFAULT nextval('public.search_parentheticalgroup_id_seq'::regclass);


--
-- Name: search_recapdocument id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocument ALTER COLUMN id SET DEFAULT nextval('public.search_recapdocument_id_seq'::regclass);


--
-- Name: search_recapdocument_tags id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocument_tags ALTER COLUMN id SET DEFAULT nextval('public.search_recapdocument_tags_id_seq'::regclass);


--
-- Name: search_recapdocumentevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocumentevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_recapdocumentevent_pgh_id_seq'::regclass);


--
-- Name: search_recapdocumenttagsevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocumenttagsevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_recapdocumenttagsevent_pgh_id_seq'::regclass);


--
-- Name: search_tag id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_tag ALTER COLUMN id SET DEFAULT nextval('public.search_tag_id_seq'::regclass);


--
-- Name: search_tagevent pgh_id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_tagevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_tagevent_pgh_id_seq'::regclass);


--
-- Name: audio_audio_panel audio_audio_panel_audio_id_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.audio_audio_panel
    ADD CONSTRAINT audio_audio_panel_audio_id_judge_id_key UNIQUE (audio_id, person_id);


--
-- Name: audio_audio_panel audio_audio_panel_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.audio_audio_panel
    ADD CONSTRAINT audio_audio_panel_pkey PRIMARY KEY (id);


--
-- Name: audio_audio audio_audio_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.audio_audio
    ADD CONSTRAINT audio_audio_pkey PRIMARY KEY (id);


--
-- Name: audio_audioevent audio_audioevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.audio_audioevent
    ADD CONSTRAINT audio_audioevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: audio_audiopanelevent audio_audiopanelevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.audio_audiopanelevent
    ADD CONSTRAINT audio_audiopanelevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_abarating people_db_abarating_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_abarating
    ADD CONSTRAINT people_db_abarating_pkey PRIMARY KEY (id);


--
-- Name: people_db_abaratingevent people_db_abaratingevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_abaratingevent
    ADD CONSTRAINT people_db_abaratingevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_attorney people_db_attorney_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_attorney
    ADD CONSTRAINT people_db_attorney_pkey PRIMARY KEY (id);


--
-- Name: people_db_attorneyorganizationassociation people_db_attorneyorganization_attorney_id_7cda1fb15b747f5_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_attorneyorganizationassociation
    ADD CONSTRAINT people_db_attorneyorganization_attorney_id_7cda1fb15b747f5_uniq UNIQUE (attorney_id, attorney_organization_id, docket_id);


--
-- Name: people_db_attorneyorganization people_db_attorneyorganization_lookup_key_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_attorneyorganization
    ADD CONSTRAINT people_db_attorneyorganization_lookup_key_key UNIQUE (lookup_key);


--
-- Name: people_db_attorneyorganization people_db_attorneyorganization_name_6e4a7d6ba93cb6a6_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_attorneyorganization
    ADD CONSTRAINT people_db_attorneyorganization_name_6e4a7d6ba93cb6a6_uniq UNIQUE (name, address1, address2, city, state, zip_code);


--
-- Name: people_db_attorneyorganization people_db_attorneyorganization_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_attorneyorganization
    ADD CONSTRAINT people_db_attorneyorganization_pkey PRIMARY KEY (id);


--
-- Name: people_db_attorneyorganizationassociation people_db_attorneyorganizationassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_attorneyorganizationassociation
    ADD CONSTRAINT people_db_attorneyorganizationassociation_pkey PRIMARY KEY (id);


--
-- Name: people_db_criminalcomplaint people_db_criminalcomplaint_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_criminalcomplaint
    ADD CONSTRAINT people_db_criminalcomplaint_pkey PRIMARY KEY (id);


--
-- Name: people_db_criminalcount people_db_criminalcount_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_criminalcount
    ADD CONSTRAINT people_db_criminalcount_pkey PRIMARY KEY (id);


--
-- Name: people_db_education people_db_education_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_education
    ADD CONSTRAINT people_db_education_pkey PRIMARY KEY (id);


--
-- Name: people_db_educationevent people_db_educationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_educationevent
    ADD CONSTRAINT people_db_educationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_party people_db_party_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_party
    ADD CONSTRAINT people_db_party_pkey PRIMARY KEY (id);


--
-- Name: people_db_partytype people_db_partytype_docket_id_345b40b72c694865_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_partytype
    ADD CONSTRAINT people_db_partytype_docket_id_345b40b72c694865_uniq UNIQUE (docket_id, party_id, name);


--
-- Name: people_db_partytype people_db_partytype_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_partytype
    ADD CONSTRAINT people_db_partytype_pkey PRIMARY KEY (id);


--
-- Name: people_db_person people_db_person_fjc_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_person
    ADD CONSTRAINT people_db_person_fjc_id_key UNIQUE (fjc_id);


--
-- Name: people_db_person people_db_person_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_person
    ADD CONSTRAINT people_db_person_pkey PRIMARY KEY (id);


--
-- Name: people_db_person_race people_db_person_race_person_id_race_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_person_race
    ADD CONSTRAINT people_db_person_race_person_id_race_id_key UNIQUE (person_id, race_id);


--
-- Name: people_db_person_race people_db_person_race_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_person_race
    ADD CONSTRAINT people_db_person_race_pkey PRIMARY KEY (id);


--
-- Name: people_db_personevent people_db_personevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_personevent
    ADD CONSTRAINT people_db_personevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_personraceevent people_db_personraceevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_personraceevent
    ADD CONSTRAINT people_db_personraceevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_politicalaffiliation people_db_politicalaffiliation_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_politicalaffiliation
    ADD CONSTRAINT people_db_politicalaffiliation_pkey PRIMARY KEY (id);


--
-- Name: people_db_politicalaffiliationevent people_db_politicalaffiliationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_politicalaffiliationevent
    ADD CONSTRAINT people_db_politicalaffiliationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_position people_db_position_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_position
    ADD CONSTRAINT people_db_position_pkey PRIMARY KEY (id);


--
-- Name: people_db_positionevent people_db_positionevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_positionevent
    ADD CONSTRAINT people_db_positionevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_race people_db_race_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_race
    ADD CONSTRAINT people_db_race_pkey PRIMARY KEY (id);


--
-- Name: people_db_race people_db_race_race_50897822747d246e_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_race
    ADD CONSTRAINT people_db_race_race_50897822747d246e_uniq UNIQUE (race);


--
-- Name: people_db_raceevent people_db_raceevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_raceevent
    ADD CONSTRAINT people_db_raceevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_retentionevent people_db_retentionevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_retentionevent
    ADD CONSTRAINT people_db_retentionevent_pkey PRIMARY KEY (id);


--
-- Name: people_db_retentioneventevent people_db_retentioneventevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_retentioneventevent
    ADD CONSTRAINT people_db_retentioneventevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_role people_db_role_party_id_73709a165082400a_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_role
    ADD CONSTRAINT people_db_role_party_id_73709a165082400a_uniq UNIQUE (party_id, attorney_id, role, docket_id, date_action);


--
-- Name: people_db_role people_db_role_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_role
    ADD CONSTRAINT people_db_role_pkey PRIMARY KEY (id);


--
-- Name: people_db_school people_db_school_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_school
    ADD CONSTRAINT people_db_school_pkey PRIMARY KEY (id);


--
-- Name: people_db_schoolevent people_db_schoolevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_schoolevent
    ADD CONSTRAINT people_db_schoolevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_source people_db_source_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_source
    ADD CONSTRAINT people_db_source_pkey PRIMARY KEY (id);


--
-- Name: people_db_sourceevent people_db_sourceevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.people_db_sourceevent
    ADD CONSTRAINT people_db_sourceevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_bankruptcyinformation search_bankruptcyinformation_docket_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_bankruptcyinformation
    ADD CONSTRAINT search_bankruptcyinformation_docket_id_key UNIQUE (docket_id);


--
-- Name: search_bankruptcyinformation search_bankruptcyinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_bankruptcyinformation
    ADD CONSTRAINT search_bankruptcyinformation_pkey PRIMARY KEY (id);


--
-- Name: search_bankruptcyinformationevent search_bankruptcyinformationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_bankruptcyinformationevent
    ADD CONSTRAINT search_bankruptcyinformationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_citation search_citation_cluster_id_7a668830aad411f5_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_citation
    ADD CONSTRAINT search_citation_cluster_id_7a668830aad411f5_uniq UNIQUE (cluster_id, volume, reporter, page);


--
-- Name: search_citation search_citation_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_citation
    ADD CONSTRAINT search_citation_pkey PRIMARY KEY (id);


--
-- Name: search_citationevent search_citationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_citationevent
    ADD CONSTRAINT search_citationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_claim search_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claim
    ADD CONSTRAINT search_claim_pkey PRIMARY KEY (id);


--
-- Name: search_claim_tags search_claim_tags_claim_id_tag_id_2f236693_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claim_tags
    ADD CONSTRAINT search_claim_tags_claim_id_tag_id_2f236693_uniq UNIQUE (claim_id, tag_id);


--
-- Name: search_claim_tags search_claim_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claim_tags
    ADD CONSTRAINT search_claim_tags_pkey PRIMARY KEY (id);


--
-- Name: search_claimevent search_claimevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claimevent
    ADD CONSTRAINT search_claimevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_claimhistory search_claimhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claimhistory
    ADD CONSTRAINT search_claimhistory_pkey PRIMARY KEY (id);


--
-- Name: search_claimhistoryevent search_claimhistoryevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claimhistoryevent
    ADD CONSTRAINT search_claimhistoryevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_claimtagsevent search_claimtagsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_claimtagsevent
    ADD CONSTRAINT search_claimtagsevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_court_appeals_to search_court_appeals_to_from_court_id_to_court_id_006ed7af_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_court_appeals_to
    ADD CONSTRAINT search_court_appeals_to_from_court_id_to_court_id_006ed7af_uniq UNIQUE (from_court_id, to_court_id);


--
-- Name: search_court_appeals_to search_court_appeals_to_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_court_appeals_to
    ADD CONSTRAINT search_court_appeals_to_pkey PRIMARY KEY (id);


--
-- Name: search_court search_court_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_court
    ADD CONSTRAINT search_court_pkey PRIMARY KEY (id);


--
-- Name: search_court search_court_position_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_court
    ADD CONSTRAINT search_court_position_key UNIQUE ("position");


--
-- Name: search_courtappealstoevent search_courtappealstoevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_courtappealstoevent
    ADD CONSTRAINT search_courtappealstoevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_courtevent search_courtevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_courtevent
    ADD CONSTRAINT search_courtevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_courthouse search_courthouse_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_courthouse
    ADD CONSTRAINT search_courthouse_pkey PRIMARY KEY (id);


--
-- Name: search_courthouseevent search_courthouseevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_courthouseevent
    ADD CONSTRAINT search_courthouseevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_docket search_docket_docket_number_7642c6c6dbd04704_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docket_docket_number_7642c6c6dbd04704_uniq UNIQUE (docket_number, pacer_case_id, court_id);


--
-- Name: search_docket search_docket_idb_data_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docket_idb_data_id_key UNIQUE (idb_data_id);


--
-- Name: search_docket search_docket_originating_court_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docket_originating_court_id_key UNIQUE (originating_court_information_id);


--
-- Name: search_docket_panel search_docket_panel_docket_id_person_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket_panel
    ADD CONSTRAINT search_docket_panel_docket_id_person_id_key UNIQUE (docket_id, person_id);


--
-- Name: search_docket_panel search_docket_panel_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket_panel
    ADD CONSTRAINT search_docket_panel_pkey PRIMARY KEY (id);


--
-- Name: search_docket search_docket_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docket_pkey PRIMARY KEY (id);


--
-- Name: search_docket_tags search_docket_tags_docket_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket_tags
    ADD CONSTRAINT search_docket_tags_docket_id_tag_id_key UNIQUE (docket_id, tag_id);


--
-- Name: search_docket_tags search_docket_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docket_tags
    ADD CONSTRAINT search_docket_tags_pkey PRIMARY KEY (id);


--
-- Name: search_docketentry search_docketentry_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketentry
    ADD CONSTRAINT search_docketentry_pkey PRIMARY KEY (id);


--
-- Name: search_docketentry_tags search_docketentry_tags_docketentry_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketentry_tags
    ADD CONSTRAINT search_docketentry_tags_docketentry_id_tag_id_key UNIQUE (docketentry_id, tag_id);


--
-- Name: search_docketentry_tags search_docketentry_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketentry_tags
    ADD CONSTRAINT search_docketentry_tags_pkey PRIMARY KEY (id);


--
-- Name: search_docketentryevent search_docketentryevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketentryevent
    ADD CONSTRAINT search_docketentryevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_docketentrytagsevent search_docketentrytagsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketentrytagsevent
    ADD CONSTRAINT search_docketentrytagsevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_docketevent search_docketevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketevent
    ADD CONSTRAINT search_docketevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_docketpanelevent search_docketpanelevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_docketpanelevent
    ADD CONSTRAINT search_docketpanelevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_dockettagsevent search_dockettagsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_dockettagsevent
    ADD CONSTRAINT search_dockettagsevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinion_joined_by search_opinion_joined_by_opinion_id_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinion_joined_by
    ADD CONSTRAINT search_opinion_joined_by_opinion_id_judge_id_key UNIQUE (opinion_id, person_id);


--
-- Name: search_opinion_joined_by search_opinion_joined_by_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinion_joined_by
    ADD CONSTRAINT search_opinion_joined_by_pkey PRIMARY KEY (id);


--
-- Name: search_opinion search_opinion_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinion
    ADD CONSTRAINT search_opinion_pkey PRIMARY KEY (id);


--
-- Name: search_opinioncluster_non_participating_judges search_opinioncluster_non_partic_opinioncluster_id_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinioncluster_non_participating_judges
    ADD CONSTRAINT search_opinioncluster_non_partic_opinioncluster_id_judge_id_key UNIQUE (opinioncluster_id, person_id);


--
-- Name: search_opinioncluster_non_participating_judges search_opinioncluster_non_participating_judges_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinioncluster_non_participating_judges
    ADD CONSTRAINT search_opinioncluster_non_participating_judges_pkey PRIMARY KEY (id);


--
-- Name: search_opinioncluster_panel search_opinioncluster_panel_opinioncluster_id_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinioncluster_panel
    ADD CONSTRAINT search_opinioncluster_panel_opinioncluster_id_judge_id_key UNIQUE (opinioncluster_id, person_id);


--
-- Name: search_opinioncluster_panel search_opinioncluster_panel_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinioncluster_panel
    ADD CONSTRAINT search_opinioncluster_panel_pkey PRIMARY KEY (id);


--
-- Name: search_opinioncluster search_opinioncluster_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinioncluster
    ADD CONSTRAINT search_opinioncluster_pkey PRIMARY KEY (id);


--
-- Name: search_opinionclusterevent search_opinionclusterevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionclusterevent
    ADD CONSTRAINT search_opinionclusterevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionclusternonparticipatingjudgesevent search_opinionclusternonparticipatingjudgesevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionclusternonparticipatingjudgesevent
    ADD CONSTRAINT search_opinionclusternonparticipatingjudgesevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionclusterpanelevent search_opinionclusterpanelevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionclusterpanelevent
    ADD CONSTRAINT search_opinionclusterpanelevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionevent search_opinionevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionevent
    ADD CONSTRAINT search_opinionevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionjoinedbyevent search_opinionjoinedbyevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionjoinedbyevent
    ADD CONSTRAINT search_opinionjoinedbyevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionscited search_opinionscited_citing_opinion_id_7165e96b2aed974f_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionscited
    ADD CONSTRAINT search_opinionscited_citing_opinion_id_7165e96b2aed974f_uniq UNIQUE (citing_opinion_id, cited_opinion_id);


--
-- Name: search_opinionscited search_opinionscited_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionscited
    ADD CONSTRAINT search_opinionscited_pkey PRIMARY KEY (id);


--
-- Name: search_opinionscitedbyrecapdocument search_opinionscitedbyre_citing_document_id_cited_0c621cfd_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionscitedbyrecapdocument
    ADD CONSTRAINT search_opinionscitedbyre_citing_document_id_cited_0c621cfd_uniq UNIQUE (citing_document_id, cited_opinion_id);


--
-- Name: search_opinionscitedbyrecapdocument search_opinionscitedbyrecapdocument_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_opinionscitedbyrecapdocument
    ADD CONSTRAINT search_opinionscitedbyrecapdocument_pkey PRIMARY KEY (id);


--
-- Name: search_originatingcourtinformation search_originatingcourtinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_originatingcourtinformation
    ADD CONSTRAINT search_originatingcourtinformation_pkey PRIMARY KEY (id);


--
-- Name: search_originatingcourtinformationevent search_originatingcourtinformationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_originatingcourtinformationevent
    ADD CONSTRAINT search_originatingcourtinformationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_parenthetical search_parenthetical_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_parenthetical
    ADD CONSTRAINT search_parenthetical_pkey PRIMARY KEY (id);


--
-- Name: search_parentheticalgroup search_parentheticalgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_parentheticalgroup
    ADD CONSTRAINT search_parentheticalgroup_pkey PRIMARY KEY (id);


--
-- Name: search_recapdocument search_recapdocument_docket_entry_id_37b2f4ece60cde00_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocument
    ADD CONSTRAINT search_recapdocument_docket_entry_id_37b2f4ece60cde00_uniq UNIQUE (docket_entry_id, document_number, attachment_number);


--
-- Name: search_recapdocument search_recapdocument_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocument
    ADD CONSTRAINT search_recapdocument_pkey PRIMARY KEY (id);


--
-- Name: search_recapdocument_tags search_recapdocument_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocument_tags
    ADD CONSTRAINT search_recapdocument_tags_pkey PRIMARY KEY (id);


--
-- Name: search_recapdocument_tags search_recapdocument_tags_recapdocument_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocument_tags
    ADD CONSTRAINT search_recapdocument_tags_recapdocument_id_tag_id_key UNIQUE (recapdocument_id, tag_id);


--
-- Name: search_recapdocumentevent search_recapdocumentevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocumentevent
    ADD CONSTRAINT search_recapdocumentevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_recapdocumenttagsevent search_recapdocumenttagsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_recapdocumenttagsevent
    ADD CONSTRAINT search_recapdocumenttagsevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_tag search_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_tag
    ADD CONSTRAINT search_tag_name_key UNIQUE (name);


--
-- Name: search_tag search_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_tag
    ADD CONSTRAINT search_tag_pkey PRIMARY KEY (id);


--
-- Name: search_tagevent search_tagevent_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.search_tagevent
    ADD CONSTRAINT search_tagevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: audio_audio_03b47046; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_03b47046 ON public.audio_audio USING btree (local_path_original_file);


--
-- Name: audio_audio_0b869b2f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_0b869b2f ON public.audio_audio USING btree (date_blocked);


--
-- Name: audio_audio_1427d4ab; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_1427d4ab ON public.audio_audio USING btree (docket_id);


--
-- Name: audio_audio_1cbcfc0f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_1cbcfc0f ON public.audio_audio USING btree (download_url);


--
-- Name: audio_audio_41ddbca9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_41ddbca9 ON public.audio_audio USING btree (local_path_mp3);


--
-- Name: audio_audio_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_5fdb3d66 ON public.audio_audio USING btree (date_modified);


--
-- Name: audio_audio_61326117; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_61326117 ON public.audio_audio USING btree (blocked);


--
-- Name: audio_audio_74a89174; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_74a89174 ON public.audio_audio USING btree (sha1);


--
-- Name: audio_audio_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_c69e55a4 ON public.audio_audio USING btree (date_created);


--
-- Name: audio_audio_download_url_44408fffeee4f71b_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_download_url_44408fffeee4f71b_like ON public.audio_audio USING btree (download_url varchar_pattern_ops);


--
-- Name: audio_audio_local_path_mp3_11f796e4872a9bad_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_local_path_mp3_11f796e4872a9bad_like ON public.audio_audio USING btree (local_path_mp3 varchar_pattern_ops);


--
-- Name: audio_audio_local_path_original_file_102ce483dde8495d_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_local_path_original_file_102ce483dde8495d_like ON public.audio_audio USING btree (local_path_original_file varchar_pattern_ops);


--
-- Name: audio_audio_panel_26f6023f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_panel_26f6023f ON public.audio_audio_panel USING btree (audio_id);


--
-- Name: audio_audio_panel_e7c5d788; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_panel_e7c5d788 ON public.audio_audio_panel USING btree (person_id);


--
-- Name: audio_audio_sha1_2510d5a8f56f35d4_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audio_sha1_2510d5a8f56f35d4_like ON public.audio_audio USING btree (sha1 varchar_pattern_ops);


--
-- Name: audio_audioevent_docket_id_d4acad63; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audioevent_docket_id_d4acad63 ON public.audio_audioevent USING btree (docket_id);


--
-- Name: audio_audioevent_pgh_context_id_f695da7c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audioevent_pgh_context_id_f695da7c ON public.audio_audioevent USING btree (pgh_context_id);


--
-- Name: audio_audioevent_pgh_obj_id_d4cc0c20; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audioevent_pgh_obj_id_d4cc0c20 ON public.audio_audioevent USING btree (pgh_obj_id);


--
-- Name: audio_audiopanelevent_audio_id_3aab9feb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audiopanelevent_audio_id_3aab9feb ON public.audio_audiopanelevent USING btree (audio_id);


--
-- Name: audio_audiopanelevent_person_id_0280e6c8; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audiopanelevent_person_id_0280e6c8 ON public.audio_audiopanelevent USING btree (person_id);


--
-- Name: audio_audiopanelevent_pgh_context_id_5c5401fc; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX audio_audiopanelevent_pgh_context_id_5c5401fc ON public.audio_audiopanelevent USING btree (pgh_context_id);


--
-- Name: district_court_docket_lookup_idx; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX district_court_docket_lookup_idx ON public.search_docket USING btree (court_id, docket_number_core, pacer_case_id);


--
-- Name: people_db_abarating_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_abarating_5fdb3d66 ON public.people_db_abarating USING btree (date_modified);


--
-- Name: people_db_abarating_a8452ca7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_abarating_a8452ca7 ON public.people_db_abarating USING btree (person_id);


--
-- Name: people_db_abarating_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_abarating_c69e55a4 ON public.people_db_abarating USING btree (date_created);


--
-- Name: people_db_abaratingevent_person_id_976485e8; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_abaratingevent_person_id_976485e8 ON public.people_db_abaratingevent USING btree (person_id);


--
-- Name: people_db_abaratingevent_pgh_context_id_60d3496a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_abaratingevent_pgh_context_id_60d3496a ON public.people_db_abaratingevent USING btree (pgh_context_id);


--
-- Name: people_db_abaratingevent_pgh_obj_id_0e6a9bc3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_abaratingevent_pgh_obj_id_0e6a9bc3 ON public.people_db_abaratingevent USING btree (pgh_obj_id);


--
-- Name: people_db_attorney_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorney_5fdb3d66 ON public.people_db_attorney USING btree (date_modified);


--
-- Name: people_db_attorney_b068931c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorney_b068931c ON public.people_db_attorney USING btree (name);


--
-- Name: people_db_attorney_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorney_c69e55a4 ON public.people_db_attorney USING btree (date_created);


--
-- Name: people_db_attorney_name_46d318a02757f6dd_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorney_name_46d318a02757f6dd_like ON public.people_db_attorney USING btree (name text_pattern_ops);


--
-- Name: people_db_attorneyorganization_0c0ae404; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_0c0ae404 ON public.people_db_attorneyorganization USING btree (zip_code);


--
-- Name: people_db_attorneyorganization_4ed5d2ea; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_4ed5d2ea ON public.people_db_attorneyorganization USING btree (city);


--
-- Name: people_db_attorneyorganization_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_5fdb3d66 ON public.people_db_attorneyorganization USING btree (date_modified);


--
-- Name: people_db_attorneyorganization_81e70cb1; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_81e70cb1 ON public.people_db_attorneyorganization USING btree (address1);


--
-- Name: people_db_attorneyorganization_9ed39e2e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_9ed39e2e ON public.people_db_attorneyorganization USING btree (state);


--
-- Name: people_db_attorneyorganization_address1_403814857b548870_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_address1_403814857b548870_like ON public.people_db_attorneyorganization USING btree (address1 text_pattern_ops);


--
-- Name: people_db_attorneyorganization_address2_403814857b4403d3_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_address2_403814857b4403d3_like ON public.people_db_attorneyorganization USING btree (address2 text_pattern_ops);


--
-- Name: people_db_attorneyorganization_b068931c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_b068931c ON public.people_db_attorneyorganization USING btree (name);


--
-- Name: people_db_attorneyorganization_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_c69e55a4 ON public.people_db_attorneyorganization USING btree (date_created);


--
-- Name: people_db_attorneyorganization_city_2a5498a19c997008_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_city_2a5498a19c997008_like ON public.people_db_attorneyorganization USING btree (city text_pattern_ops);


--
-- Name: people_db_attorneyorganization_f669f8e9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_f669f8e9 ON public.people_db_attorneyorganization USING btree (address2);


--
-- Name: people_db_attorneyorganization_lookup_key_4723770634841e39_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_lookup_key_4723770634841e39_like ON public.people_db_attorneyorganization USING btree (lookup_key text_pattern_ops);


--
-- Name: people_db_attorneyorganization_name_eddcefc5b671344_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_name_eddcefc5b671344_like ON public.people_db_attorneyorganization USING btree (name text_pattern_ops);


--
-- Name: people_db_attorneyorganization_state_18fe99f5bf671255_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_state_18fe99f5bf671255_like ON public.people_db_attorneyorganization USING btree (state varchar_pattern_ops);


--
-- Name: people_db_attorneyorganization_zip_code_66632293e4093e4e_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganization_zip_code_66632293e4093e4e_like ON public.people_db_attorneyorganization USING btree (zip_code varchar_pattern_ops);


--
-- Name: people_db_attorneyorganizationassociation_1427d4ab; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganizationassociation_1427d4ab ON public.people_db_attorneyorganizationassociation USING btree (docket_id);


--
-- Name: people_db_attorneyorganizationassociation_9f99f769; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganizationassociation_9f99f769 ON public.people_db_attorneyorganizationassociation USING btree (attorney_id);


--
-- Name: people_db_attorneyorganizationassociation_a2c8783d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_attorneyorganizationassociation_a2c8783d ON public.people_db_attorneyorganizationassociation USING btree (attorney_organization_id);


--
-- Name: people_db_criminalcomplaint_4edc179c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_criminalcomplaint_4edc179c ON public.people_db_criminalcomplaint USING btree (party_type_id);


--
-- Name: people_db_criminalcount_4edc179c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_criminalcount_4edc179c ON public.people_db_criminalcount USING btree (party_type_id);


--
-- Name: people_db_education_5fc7164b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_education_5fc7164b ON public.people_db_education USING btree (school_id);


--
-- Name: people_db_education_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_education_5fdb3d66 ON public.people_db_education USING btree (date_modified);


--
-- Name: people_db_education_a8452ca7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_education_a8452ca7 ON public.people_db_education USING btree (person_id);


--
-- Name: people_db_education_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_education_c69e55a4 ON public.people_db_education USING btree (date_created);


--
-- Name: people_db_educationevent_person_id_86892be3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_educationevent_person_id_86892be3 ON public.people_db_educationevent USING btree (person_id);


--
-- Name: people_db_educationevent_pgh_context_id_93dac561; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_educationevent_pgh_context_id_93dac561 ON public.people_db_educationevent USING btree (pgh_context_id);


--
-- Name: people_db_educationevent_pgh_obj_id_242c5dea; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_educationevent_pgh_obj_id_242c5dea ON public.people_db_educationevent USING btree (pgh_obj_id);


--
-- Name: people_db_educationevent_school_id_5d83b038; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_educationevent_school_id_5d83b038 ON public.people_db_educationevent USING btree (school_id);


--
-- Name: people_db_party_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_party_5fdb3d66 ON public.people_db_party USING btree (date_modified);


--
-- Name: people_db_party_b068931c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_party_b068931c ON public.people_db_party USING btree (name);


--
-- Name: people_db_party_bb2cb5a6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_party_bb2cb5a6 ON public.people_db_party USING btree (extra_info);


--
-- Name: people_db_party_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_party_c69e55a4 ON public.people_db_party USING btree (date_created);


--
-- Name: people_db_party_extra_info_7a50cbcc44fd5d7a_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_party_extra_info_7a50cbcc44fd5d7a_like ON public.people_db_party USING btree (extra_info text_pattern_ops);


--
-- Name: people_db_party_name_3d12b76fe7f0ae1c_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_party_name_3d12b76fe7f0ae1c_like ON public.people_db_party USING btree (name text_pattern_ops);


--
-- Name: people_db_partytype_1427d4ab; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_partytype_1427d4ab ON public.people_db_partytype USING btree (docket_id);


--
-- Name: people_db_partytype_2c662395; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_partytype_2c662395 ON public.people_db_partytype USING btree (party_id);


--
-- Name: people_db_partytype_b068931c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_partytype_b068931c ON public.people_db_partytype USING btree (name);


--
-- Name: people_db_partytype_bb2cb5a6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_partytype_bb2cb5a6 ON public.people_db_partytype USING btree (extra_info);


--
-- Name: people_db_partytype_name_4cb81702de26fee8_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_partytype_name_4cb81702de26fee8_like ON public.people_db_partytype USING btree (name varchar_pattern_ops);


--
-- Name: people_db_person_2dbcba41; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_2dbcba41 ON public.people_db_person USING btree (slug);


--
-- Name: people_db_person_3c6ec45e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_3c6ec45e ON public.people_db_person USING btree (is_alias_of_id);


--
-- Name: people_db_person_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_5fdb3d66 ON public.people_db_person USING btree (date_modified);


--
-- Name: people_db_person_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_c69e55a4 ON public.people_db_person USING btree (date_created);


--
-- Name: people_db_person_c943ec03; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_c943ec03 ON public.people_db_person USING btree (name_last);


--
-- Name: people_db_person_e489b049; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_e489b049 ON public.people_db_person USING btree (ftm_total_received);


--
-- Name: people_db_person_name_last_2c38f190d58b7eba_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_name_last_2c38f190d58b7eba_like ON public.people_db_person USING btree (name_last varchar_pattern_ops);


--
-- Name: people_db_person_race_3f2f3687; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_race_3f2f3687 ON public.people_db_person_race USING btree (race_id);


--
-- Name: people_db_person_race_a8452ca7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_race_a8452ca7 ON public.people_db_person_race USING btree (person_id);


--
-- Name: people_db_person_slug_10074d278f243e42_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_person_slug_10074d278f243e42_like ON public.people_db_person USING btree (slug varchar_pattern_ops);


--
-- Name: people_db_personevent_is_alias_of_id_dff0de5e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_personevent_is_alias_of_id_dff0de5e ON public.people_db_personevent USING btree (is_alias_of_id);


--
-- Name: people_db_personevent_pgh_context_id_8c18edc2; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_personevent_pgh_context_id_8c18edc2 ON public.people_db_personevent USING btree (pgh_context_id);


--
-- Name: people_db_personevent_pgh_obj_id_3a44721c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_personevent_pgh_obj_id_3a44721c ON public.people_db_personevent USING btree (pgh_obj_id);


--
-- Name: people_db_personraceevent_person_id_000fffe6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_personraceevent_person_id_000fffe6 ON public.people_db_personraceevent USING btree (person_id);


--
-- Name: people_db_personraceevent_pgh_context_id_6e61479f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_personraceevent_pgh_context_id_6e61479f ON public.people_db_personraceevent USING btree (pgh_context_id);


--
-- Name: people_db_personraceevent_race_id_ec19c576; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_personraceevent_race_id_ec19c576 ON public.people_db_personraceevent USING btree (race_id);


--
-- Name: people_db_politicalaffiliation_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_politicalaffiliation_5fdb3d66 ON public.people_db_politicalaffiliation USING btree (date_modified);


--
-- Name: people_db_politicalaffiliation_a8452ca7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_politicalaffiliation_a8452ca7 ON public.people_db_politicalaffiliation USING btree (person_id);


--
-- Name: people_db_politicalaffiliation_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_politicalaffiliation_c69e55a4 ON public.people_db_politicalaffiliation USING btree (date_created);


--
-- Name: people_db_politicalaffiliationevent_person_id_968b07ce; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_politicalaffiliationevent_person_id_968b07ce ON public.people_db_politicalaffiliationevent USING btree (person_id);


--
-- Name: people_db_politicalaffiliationevent_pgh_context_id_dfbcdb75; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_politicalaffiliationevent_pgh_context_id_dfbcdb75 ON public.people_db_politicalaffiliationevent USING btree (pgh_context_id);


--
-- Name: people_db_politicalaffiliationevent_pgh_obj_id_c98e3cf6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_politicalaffiliationevent_pgh_obj_id_c98e3cf6 ON public.people_db_politicalaffiliationevent USING btree (pgh_obj_id);


--
-- Name: people_db_position_0ce67364; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_0ce67364 ON public.people_db_position USING btree (date_start);


--
-- Name: people_db_position_1301727a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_1301727a ON public.people_db_position USING btree (date_elected);


--
-- Name: people_db_position_22b8ff35; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_22b8ff35 ON public.people_db_position USING btree (appointer_id);


--
-- Name: people_db_position_2a1c0b55; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_2a1c0b55 ON public.people_db_position USING btree (date_confirmation);


--
-- Name: people_db_position_43e12164; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_43e12164 ON public.people_db_position USING btree (date_judicial_committee_action);


--
-- Name: people_db_position_5fc7164b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_5fc7164b ON public.people_db_position USING btree (school_id);


--
-- Name: people_db_position_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_5fdb3d66 ON public.people_db_position USING btree (date_modified);


--
-- Name: people_db_position_7a183bc6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_7a183bc6 ON public.people_db_position USING btree (date_recess_appointment);


--
-- Name: people_db_position_7a46e69c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_7a46e69c ON public.people_db_position USING btree (court_id);


--
-- Name: people_db_position_a2289cae; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_a2289cae ON public.people_db_position USING btree (date_referred_to_judicial_committee);


--
-- Name: people_db_position_a7ad19f8; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_a7ad19f8 ON public.people_db_position USING btree (date_nominated);


--
-- Name: people_db_position_a8452ca7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_a8452ca7 ON public.people_db_position USING btree (person_id);


--
-- Name: people_db_position_a9962d2d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_a9962d2d ON public.people_db_position USING btree (date_retirement);


--
-- Name: people_db_position_b070f947; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_b070f947 ON public.people_db_position USING btree (predecessor_id);


--
-- Name: people_db_position_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_c69e55a4 ON public.people_db_position USING btree (date_created);


--
-- Name: people_db_position_court_id_7141eee9b516a894_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_court_id_7141eee9b516a894_like ON public.people_db_position USING btree (court_id varchar_pattern_ops);


--
-- Name: people_db_position_d32bfe21; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_d32bfe21 ON public.people_db_position USING btree (date_termination);


--
-- Name: people_db_position_eae0a89e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_eae0a89e ON public.people_db_position USING btree (supervisor_id);


--
-- Name: people_db_position_ed551732; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_position_ed551732 ON public.people_db_position USING btree (date_hearing);


--
-- Name: people_db_positionevent_appointer_id_9a1a141d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_positionevent_appointer_id_9a1a141d ON public.people_db_positionevent USING btree (appointer_id);


--
-- Name: people_db_positionevent_court_id_c27f27bf; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_positionevent_court_id_c27f27bf ON public.people_db_positionevent USING btree (court_id);


--
-- Name: people_db_positionevent_court_id_c27f27bf_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_positionevent_court_id_c27f27bf_like ON public.people_db_positionevent USING btree (court_id varchar_pattern_ops);


--
-- Name: people_db_positionevent_person_id_b48e5d5c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_positionevent_person_id_b48e5d5c ON public.people_db_positionevent USING btree (person_id);


--
-- Name: people_db_positionevent_pgh_context_id_91818e04; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_positionevent_pgh_context_id_91818e04 ON public.people_db_positionevent USING btree (pgh_context_id);


--
-- Name: people_db_positionevent_pgh_obj_id_e37b1a99; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_positionevent_pgh_obj_id_e37b1a99 ON public.people_db_positionevent USING btree (pgh_obj_id);


--
-- Name: people_db_positionevent_predecessor_id_a183a0e5; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_positionevent_predecessor_id_a183a0e5 ON public.people_db_positionevent USING btree (predecessor_id);


--
-- Name: people_db_positionevent_school_id_8435314e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_positionevent_school_id_8435314e ON public.people_db_positionevent USING btree (school_id);


--
-- Name: people_db_positionevent_supervisor_id_d1b31dbb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_positionevent_supervisor_id_d1b31dbb ON public.people_db_positionevent USING btree (supervisor_id);


--
-- Name: people_db_raceevent_pgh_context_id_590006cf; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_raceevent_pgh_context_id_590006cf ON public.people_db_raceevent USING btree (pgh_context_id);


--
-- Name: people_db_raceevent_pgh_obj_id_f7ec57e8; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_raceevent_pgh_obj_id_f7ec57e8 ON public.people_db_raceevent USING btree (pgh_obj_id);


--
-- Name: people_db_retentionevent_4e6b5ce9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_retentionevent_4e6b5ce9 ON public.people_db_retentionevent USING btree (date_retention);


--
-- Name: people_db_retentionevent_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_retentionevent_5fdb3d66 ON public.people_db_retentionevent USING btree (date_modified);


--
-- Name: people_db_retentionevent_bce5bd07; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_retentionevent_bce5bd07 ON public.people_db_retentionevent USING btree (position_id);


--
-- Name: people_db_retentionevent_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_retentionevent_c69e55a4 ON public.people_db_retentionevent USING btree (date_created);


--
-- Name: people_db_retentioneventevent_pgh_context_id_81f7850b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_retentioneventevent_pgh_context_id_81f7850b ON public.people_db_retentioneventevent USING btree (pgh_context_id);


--
-- Name: people_db_retentioneventevent_pgh_obj_id_902d74ea; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_retentioneventevent_pgh_obj_id_902d74ea ON public.people_db_retentioneventevent USING btree (pgh_obj_id);


--
-- Name: people_db_retentioneventevent_position_id_96c16566; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_retentioneventevent_position_id_96c16566 ON public.people_db_retentioneventevent USING btree (position_id);


--
-- Name: people_db_role_1427d4ab; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_role_1427d4ab ON public.people_db_role USING btree (docket_id);


--
-- Name: people_db_role_29a7e964; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_role_29a7e964 ON public.people_db_role USING btree (role);


--
-- Name: people_db_role_2c662395; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_role_2c662395 ON public.people_db_role USING btree (party_id);


--
-- Name: people_db_role_9f99f769; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_role_9f99f769 ON public.people_db_role USING btree (attorney_id);


--
-- Name: people_db_school_3c6ec45e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_school_3c6ec45e ON public.people_db_school USING btree (is_alias_of_id);


--
-- Name: people_db_school_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_school_5fdb3d66 ON public.people_db_school USING btree (date_modified);


--
-- Name: people_db_school_b068931c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_school_b068931c ON public.people_db_school USING btree (name);


--
-- Name: people_db_school_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_school_c69e55a4 ON public.people_db_school USING btree (date_created);


--
-- Name: people_db_school_ffef75ef; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_school_ffef75ef ON public.people_db_school USING btree (ein);


--
-- Name: people_db_school_name_55359da037ff6cd5_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_school_name_55359da037ff6cd5_like ON public.people_db_school USING btree (name varchar_pattern_ops);


--
-- Name: people_db_schoolevent_is_alias_of_id_4c4332d7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_schoolevent_is_alias_of_id_4c4332d7 ON public.people_db_schoolevent USING btree (is_alias_of_id);


--
-- Name: people_db_schoolevent_pgh_context_id_b32512bd; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_schoolevent_pgh_context_id_b32512bd ON public.people_db_schoolevent USING btree (pgh_context_id);


--
-- Name: people_db_schoolevent_pgh_obj_id_57bf2a67; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_schoolevent_pgh_obj_id_57bf2a67 ON public.people_db_schoolevent USING btree (pgh_obj_id);


--
-- Name: people_db_source_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_source_5fdb3d66 ON public.people_db_source USING btree (date_modified);


--
-- Name: people_db_source_a8452ca7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_source_a8452ca7 ON public.people_db_source USING btree (person_id);


--
-- Name: people_db_source_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_source_c69e55a4 ON public.people_db_source USING btree (date_created);


--
-- Name: people_db_sourceevent_person_id_f32cf8b3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_sourceevent_person_id_f32cf8b3 ON public.people_db_sourceevent USING btree (person_id);


--
-- Name: people_db_sourceevent_pgh_context_id_6bf9fb8f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_sourceevent_pgh_context_id_6bf9fb8f ON public.people_db_sourceevent USING btree (pgh_context_id);


--
-- Name: people_db_sourceevent_pgh_obj_id_c37b1d95; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX people_db_sourceevent_pgh_obj_id_c37b1d95 ON public.people_db_sourceevent USING btree (pgh_obj_id);


--
-- Name: search_bankruptcyinformation_date_created_60f180b0; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_bankruptcyinformation_date_created_60f180b0 ON public.search_bankruptcyinformation USING btree (date_created);


--
-- Name: search_bankruptcyinformation_date_modified_c1b76dd9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_bankruptcyinformation_date_modified_c1b76dd9 ON public.search_bankruptcyinformation USING btree (date_modified);


--
-- Name: search_bankruptcyinformationevent_docket_id_e6ca7d29; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_bankruptcyinformationevent_docket_id_e6ca7d29 ON public.search_bankruptcyinformationevent USING btree (docket_id);


--
-- Name: search_bankruptcyinformationevent_pgh_context_id_5e7bd505; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_bankruptcyinformationevent_pgh_context_id_5e7bd505 ON public.search_bankruptcyinformationevent USING btree (pgh_context_id);


--
-- Name: search_bankruptcyinformationevent_pgh_obj_id_73c1db25; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_bankruptcyinformationevent_pgh_obj_id_73c1db25 ON public.search_bankruptcyinformationevent USING btree (pgh_obj_id);


--
-- Name: search_cita_volume_464334_idx; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_cita_volume_464334_idx ON public.search_citation USING btree (volume, reporter);


--
-- Name: search_cita_volume_92c344_idx; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_cita_volume_92c344_idx ON public.search_citation USING btree (volume, reporter, page);


--
-- Name: search_citation_966557f0; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_citation_966557f0 ON public.search_citation USING btree (reporter);


--
-- Name: search_citation_a97b1c12; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_citation_a97b1c12 ON public.search_citation USING btree (cluster_id);


--
-- Name: search_citation_reporter_1b48f47a0886ffdd_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_citation_reporter_1b48f47a0886ffdd_like ON public.search_citation USING btree (reporter text_pattern_ops);


--
-- Name: search_citationevent_cluster_id_3cc4bdde; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_citationevent_cluster_id_3cc4bdde ON public.search_citationevent USING btree (cluster_id);


--
-- Name: search_citationevent_pgh_context_id_a721796b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_citationevent_pgh_context_id_a721796b ON public.search_citationevent USING btree (pgh_context_id);


--
-- Name: search_citationevent_pgh_obj_id_74bef0e4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_citationevent_pgh_obj_id_74bef0e4 ON public.search_citationevent USING btree (pgh_obj_id);


--
-- Name: search_claim_claim_number_263236b3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claim_claim_number_263236b3 ON public.search_claim USING btree (claim_number);


--
-- Name: search_claim_claim_number_263236b3_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claim_claim_number_263236b3_like ON public.search_claim USING btree (claim_number varchar_pattern_ops);


--
-- Name: search_claim_date_created_8c2e998c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claim_date_created_8c2e998c ON public.search_claim USING btree (date_created);


--
-- Name: search_claim_date_modified_f38130a2; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claim_date_modified_f38130a2 ON public.search_claim USING btree (date_modified);


--
-- Name: search_claim_docket_id_b37171a9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claim_docket_id_b37171a9 ON public.search_claim USING btree (docket_id);


--
-- Name: search_claim_tags_claim_id_2cf554b5; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claim_tags_claim_id_2cf554b5 ON public.search_claim_tags USING btree (claim_id);


--
-- Name: search_claim_tags_tag_id_73b6bd4d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claim_tags_tag_id_73b6bd4d ON public.search_claim_tags USING btree (tag_id);


--
-- Name: search_claimevent_docket_id_b016b91c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimevent_docket_id_b016b91c ON public.search_claimevent USING btree (docket_id);


--
-- Name: search_claimevent_pgh_context_id_421c9863; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimevent_pgh_context_id_421c9863 ON public.search_claimevent USING btree (pgh_context_id);


--
-- Name: search_claimevent_pgh_obj_id_eb8bb005; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimevent_pgh_obj_id_eb8bb005 ON public.search_claimevent USING btree (pgh_obj_id);


--
-- Name: search_claimhistory_claim_id_e130e572; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimhistory_claim_id_e130e572 ON public.search_claimhistory USING btree (claim_id);


--
-- Name: search_claimhistory_date_created_586d545e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimhistory_date_created_586d545e ON public.search_claimhistory USING btree (date_created);


--
-- Name: search_claimhistory_date_modified_5f6ec339; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimhistory_date_modified_5f6ec339 ON public.search_claimhistory USING btree (date_modified);


--
-- Name: search_claimhistory_document_number_6316c155; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimhistory_document_number_6316c155 ON public.search_claimhistory USING btree (document_number);


--
-- Name: search_claimhistory_document_number_6316c155_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimhistory_document_number_6316c155_like ON public.search_claimhistory USING btree (document_number varchar_pattern_ops);


--
-- Name: search_claimhistory_is_free_on_pacer_81332a2c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimhistory_is_free_on_pacer_81332a2c ON public.search_claimhistory USING btree (is_free_on_pacer);


--
-- Name: search_claimhistoryevent_claim_id_a256e51f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimhistoryevent_claim_id_a256e51f ON public.search_claimhistoryevent USING btree (claim_id);


--
-- Name: search_claimhistoryevent_pgh_context_id_fbccd42a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimhistoryevent_pgh_context_id_fbccd42a ON public.search_claimhistoryevent USING btree (pgh_context_id);


--
-- Name: search_claimhistoryevent_pgh_obj_id_51dc3876; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimhistoryevent_pgh_obj_id_51dc3876 ON public.search_claimhistoryevent USING btree (pgh_obj_id);


--
-- Name: search_claimtagsevent_claim_id_34146335; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimtagsevent_claim_id_34146335 ON public.search_claimtagsevent USING btree (claim_id);


--
-- Name: search_claimtagsevent_pgh_context_id_bb236d3a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimtagsevent_pgh_context_id_bb236d3a ON public.search_claimtagsevent USING btree (pgh_context_id);


--
-- Name: search_claimtagsevent_tag_id_fdeb7331; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_claimtagsevent_tag_id_fdeb7331 ON public.search_claimtagsevent USING btree (tag_id);


--
-- Name: search_court_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_court_5fdb3d66 ON public.search_court USING btree (date_modified);


--
-- Name: search_court_appeals_to_from_court_id_fb09cc1a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_court_appeals_to_from_court_id_fb09cc1a ON public.search_court_appeals_to USING btree (from_court_id);


--
-- Name: search_court_appeals_to_from_court_id_fb09cc1a_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_court_appeals_to_from_court_id_fb09cc1a_like ON public.search_court_appeals_to USING btree (from_court_id varchar_pattern_ops);


--
-- Name: search_court_appeals_to_to_court_id_49ac3d9c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_court_appeals_to_to_court_id_49ac3d9c ON public.search_court_appeals_to USING btree (to_court_id);


--
-- Name: search_court_appeals_to_to_court_id_49ac3d9c_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_court_appeals_to_to_court_id_49ac3d9c_like ON public.search_court_appeals_to USING btree (to_court_id varchar_pattern_ops);


--
-- Name: search_court_id_28e1a61bd5ca39cc_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_court_id_28e1a61bd5ca39cc_like ON public.search_court USING btree (id varchar_pattern_ops);


--
-- Name: search_court_parent_court_id_51ba1d28; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_court_parent_court_id_51ba1d28 ON public.search_court USING btree (parent_court_id);


--
-- Name: search_court_parent_court_id_51ba1d28_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_court_parent_court_id_51ba1d28_like ON public.search_court USING btree (parent_court_id varchar_pattern_ops);


--
-- Name: search_courtappealstoevent_from_court_id_75784b8f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtappealstoevent_from_court_id_75784b8f ON public.search_courtappealstoevent USING btree (from_court_id);


--
-- Name: search_courtappealstoevent_from_court_id_75784b8f_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtappealstoevent_from_court_id_75784b8f_like ON public.search_courtappealstoevent USING btree (from_court_id varchar_pattern_ops);


--
-- Name: search_courtappealstoevent_pgh_context_id_e65511b3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtappealstoevent_pgh_context_id_e65511b3 ON public.search_courtappealstoevent USING btree (pgh_context_id);


--
-- Name: search_courtappealstoevent_to_court_id_5540ee1b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtappealstoevent_to_court_id_5540ee1b ON public.search_courtappealstoevent USING btree (to_court_id);


--
-- Name: search_courtappealstoevent_to_court_id_5540ee1b_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtappealstoevent_to_court_id_5540ee1b_like ON public.search_courtappealstoevent USING btree (to_court_id varchar_pattern_ops);


--
-- Name: search_courtevent_parent_court_id_342036cc; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtevent_parent_court_id_342036cc ON public.search_courtevent USING btree (parent_court_id);


--
-- Name: search_courtevent_parent_court_id_342036cc_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtevent_parent_court_id_342036cc_like ON public.search_courtevent USING btree (parent_court_id varchar_pattern_ops);


--
-- Name: search_courtevent_pgh_context_id_7a93b57e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtevent_pgh_context_id_7a93b57e ON public.search_courtevent USING btree (pgh_context_id);


--
-- Name: search_courtevent_pgh_obj_id_a86c8348; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtevent_pgh_obj_id_a86c8348 ON public.search_courtevent USING btree (pgh_obj_id);


--
-- Name: search_courtevent_pgh_obj_id_a86c8348_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courtevent_pgh_obj_id_a86c8348_like ON public.search_courtevent USING btree (pgh_obj_id varchar_pattern_ops);


--
-- Name: search_courthouse_court_id_6528f572; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courthouse_court_id_6528f572 ON public.search_courthouse USING btree (court_id);


--
-- Name: search_courthouse_court_id_6528f572_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courthouse_court_id_6528f572_like ON public.search_courthouse USING btree (court_id varchar_pattern_ops);


--
-- Name: search_courthouseevent_court_id_ecdd5b8a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courthouseevent_court_id_ecdd5b8a ON public.search_courthouseevent USING btree (court_id);


--
-- Name: search_courthouseevent_court_id_ecdd5b8a_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courthouseevent_court_id_ecdd5b8a_like ON public.search_courthouseevent USING btree (court_id varchar_pattern_ops);


--
-- Name: search_courthouseevent_pgh_context_id_affccfe3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courthouseevent_pgh_context_id_affccfe3 ON public.search_courthouseevent USING btree (pgh_context_id);


--
-- Name: search_courthouseevent_pgh_obj_id_2bdd6824; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_courthouseevent_pgh_obj_id_2bdd6824 ON public.search_courthouseevent USING btree (pgh_obj_id);


--
-- Name: search_dock_court_i_a043ae_idx; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_dock_court_i_a043ae_idx ON public.search_docket USING btree (court_id, id);


--
-- Name: search_dock_recap_s_306ab9_idx; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_dock_recap_s_306ab9_idx ON public.search_docketentry USING btree (recap_sequence_number, entry_number);


--
-- Name: search_docket_02c1725c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_02c1725c ON public.search_docket USING btree (assigned_to_id);


--
-- Name: search_docket_0b869b2f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_0b869b2f ON public.search_docket USING btree (date_blocked);


--
-- Name: search_docket_34894a03; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_34894a03 ON public.search_docket USING btree (pacer_case_id);


--
-- Name: search_docket_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_5fdb3d66 ON public.search_docket USING btree (date_modified);


--
-- Name: search_docket_64cdae4d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_64cdae4d ON public.search_docket USING btree (referred_to_id);


--
-- Name: search_docket_695b63bb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_695b63bb ON public.search_docket USING btree (appeal_from_id);


--
-- Name: search_docket_6c91ba55; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_6c91ba55 ON public.search_docket USING btree (docket_number_core);


--
-- Name: search_docket_7a46e69c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_7a46e69c ON public.search_docket USING btree (court_id);


--
-- Name: search_docket_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_c69e55a4 ON public.search_docket USING btree (date_created);


--
-- Name: search_docket_court_id_2d2438b2594e74ba_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_court_id_2d2438b2594e74ba_like ON public.search_docket USING btree (court_id varchar_pattern_ops);


--
-- Name: search_docket_docket_number_4af29e98dca38326_uniq; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_docket_number_4af29e98dca38326_uniq ON public.search_docket USING btree (docket_number);


--
-- Name: search_docket_docket_number_core_713b7b04e01f11d7_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_docket_number_core_713b7b04e01f11d7_like ON public.search_docket USING btree (docket_number_core varchar_pattern_ops);


--
-- Name: search_docket_panel_1427d4ab; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_panel_1427d4ab ON public.search_docket_panel USING btree (docket_id);


--
-- Name: search_docket_panel_a8452ca7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_panel_a8452ca7 ON public.search_docket_panel USING btree (person_id);


--
-- Name: search_docket_tags_1427d4ab; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_tags_1427d4ab ON public.search_docket_tags USING btree (docket_id);


--
-- Name: search_docket_tags_76f094bc; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docket_tags_76f094bc ON public.search_docket_tags USING btree (tag_id);


--
-- Name: search_docketentry_1427d4ab; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentry_1427d4ab ON public.search_docketentry USING btree (docket_id);


--
-- Name: search_docketentry_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentry_5fdb3d66 ON public.search_docketentry USING btree (date_modified);


--
-- Name: search_docketentry_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentry_c69e55a4 ON public.search_docketentry USING btree (date_created);


--
-- Name: search_docketentry_tags_76f094bc; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentry_tags_76f094bc ON public.search_docketentry_tags USING btree (tag_id);


--
-- Name: search_docketentry_tags_b02d089e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentry_tags_b02d089e ON public.search_docketentry_tags USING btree (docketentry_id);


--
-- Name: search_docketentryevent_docket_id_469ad4c0; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentryevent_docket_id_469ad4c0 ON public.search_docketentryevent USING btree (docket_id);


--
-- Name: search_docketentryevent_pgh_context_id_1bd9c36d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentryevent_pgh_context_id_1bd9c36d ON public.search_docketentryevent USING btree (pgh_context_id);


--
-- Name: search_docketentryevent_pgh_obj_id_584ac554; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentryevent_pgh_obj_id_584ac554 ON public.search_docketentryevent USING btree (pgh_obj_id);


--
-- Name: search_docketentrytagsevent_docketentry_id_1aa64197; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentrytagsevent_docketentry_id_1aa64197 ON public.search_docketentrytagsevent USING btree (docketentry_id);


--
-- Name: search_docketentrytagsevent_pgh_context_id_f91c4367; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentrytagsevent_pgh_context_id_f91c4367 ON public.search_docketentrytagsevent USING btree (pgh_context_id);


--
-- Name: search_docketentrytagsevent_tag_id_9d769fa5; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketentrytagsevent_tag_id_9d769fa5 ON public.search_docketentrytagsevent USING btree (tag_id);


--
-- Name: search_docketevent_appeal_from_id_388367c7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_appeal_from_id_388367c7 ON public.search_docketevent USING btree (appeal_from_id);


--
-- Name: search_docketevent_appeal_from_id_388367c7_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_appeal_from_id_388367c7_like ON public.search_docketevent USING btree (appeal_from_id varchar_pattern_ops);


--
-- Name: search_docketevent_assigned_to_id_13bac477; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_assigned_to_id_13bac477 ON public.search_docketevent USING btree (assigned_to_id);


--
-- Name: search_docketevent_court_id_c6baeb82; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_court_id_c6baeb82 ON public.search_docketevent USING btree (court_id);


--
-- Name: search_docketevent_court_id_c6baeb82_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_court_id_c6baeb82_like ON public.search_docketevent USING btree (court_id varchar_pattern_ops);


--
-- Name: search_docketevent_idb_data_id_62179a0f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_idb_data_id_62179a0f ON public.search_docketevent USING btree (idb_data_id);


--
-- Name: search_docketevent_originating_court_information_id_47acc418; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_originating_court_information_id_47acc418 ON public.search_docketevent USING btree (originating_court_information_id);


--
-- Name: search_docketevent_pgh_context_id_72300038; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_pgh_context_id_72300038 ON public.search_docketevent USING btree (pgh_context_id);


--
-- Name: search_docketevent_pgh_obj_id_5d06013e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_pgh_obj_id_5d06013e ON public.search_docketevent USING btree (pgh_obj_id);


--
-- Name: search_docketevent_referred_to_id_ba58a272; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketevent_referred_to_id_ba58a272 ON public.search_docketevent USING btree (referred_to_id);


--
-- Name: search_docketpanelevent_docket_id_1a9e206c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketpanelevent_docket_id_1a9e206c ON public.search_docketpanelevent USING btree (docket_id);


--
-- Name: search_docketpanelevent_person_id_97094b3d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketpanelevent_person_id_97094b3d ON public.search_docketpanelevent USING btree (person_id);


--
-- Name: search_docketpanelevent_pgh_context_id_03019aa7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_docketpanelevent_pgh_context_id_03019aa7 ON public.search_docketpanelevent USING btree (pgh_context_id);


--
-- Name: search_dockettagsevent_docket_id_b1874f82; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_dockettagsevent_docket_id_b1874f82 ON public.search_dockettagsevent USING btree (docket_id);


--
-- Name: search_dockettagsevent_pgh_context_id_69b62450; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_dockettagsevent_pgh_context_id_69b62450 ON public.search_dockettagsevent USING btree (pgh_context_id);


--
-- Name: search_dockettagsevent_tag_id_728990f4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_dockettagsevent_tag_id_728990f4 ON public.search_dockettagsevent USING btree (tag_id);


--
-- Name: search_opin_depth_3307bd_idx; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opin_depth_3307bd_idx ON public.search_opinionscitedbyrecapdocument USING btree (depth);


--
-- Name: search_opinion_1cbcfc0f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_1cbcfc0f ON public.search_opinion USING btree (download_url);


--
-- Name: search_opinion_4f331e2f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_4f331e2f ON public.search_opinion USING btree (author_id);


--
-- Name: search_opinion_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_5fdb3d66 ON public.search_opinion USING btree (date_modified);


--
-- Name: search_opinion_71485e76; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_71485e76 ON public.search_opinion USING btree (local_path);


--
-- Name: search_opinion_74a89174; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_74a89174 ON public.search_opinion USING btree (sha1);


--
-- Name: search_opinion_a97b1c12; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_a97b1c12 ON public.search_opinion USING btree (cluster_id);


--
-- Name: search_opinion_bded6737; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_bded6737 ON public.search_opinion USING btree (extracted_by_ocr);


--
-- Name: search_opinion_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_c69e55a4 ON public.search_opinion USING btree (date_created);


--
-- Name: search_opinion_download_url_3b11b165f23bc568_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_download_url_3b11b165f23bc568_like ON public.search_opinion USING btree (download_url varchar_pattern_ops);


--
-- Name: search_opinion_joined_by_8a09c46f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_joined_by_8a09c46f ON public.search_opinion_joined_by USING btree (opinion_id);


--
-- Name: search_opinion_joined_by_e7c5d788; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_joined_by_e7c5d788 ON public.search_opinion_joined_by USING btree (person_id);


--
-- Name: search_opinion_local_path_63290b39b28ef927_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_local_path_63290b39b28ef927_like ON public.search_opinion USING btree (local_path varchar_pattern_ops);


--
-- Name: search_opinion_sha1_5887dd5d3475ad17_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinion_sha1_5887dd5d3475ad17_like ON public.search_opinion USING btree (sha1 varchar_pattern_ops);


--
-- Name: search_opinioncluster_0b869b2f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_0b869b2f ON public.search_opinioncluster USING btree (date_blocked);


--
-- Name: search_opinioncluster_1427d4ab; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_1427d4ab ON public.search_opinioncluster USING btree (docket_id);


--
-- Name: search_opinioncluster_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_5fdb3d66 ON public.search_opinioncluster USING btree (date_modified);


--
-- Name: search_opinioncluster_61326117; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_61326117 ON public.search_opinioncluster USING btree (blocked);


--
-- Name: search_opinioncluster_98cc5f59; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_98cc5f59 ON public.search_opinioncluster USING btree (date_filed);


--
-- Name: search_opinioncluster_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_c69e55a4 ON public.search_opinioncluster USING btree (date_created);


--
-- Name: search_opinioncluster_d91c83eb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_d91c83eb ON public.search_opinioncluster USING btree (citation_count);


--
-- Name: search_opinioncluster_e0fd3ccf; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_e0fd3ccf ON public.search_opinioncluster USING btree (scdb_id);


--
-- Name: search_opinioncluster_f796c05b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_f796c05b ON public.search_opinioncluster USING btree (precedential_status);


--
-- Name: search_opinioncluster_filepath_json_harvard_4b8057d0; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_filepath_json_harvard_4b8057d0 ON public.search_opinioncluster USING btree (filepath_json_harvard);


--
-- Name: search_opinioncluster_filepath_json_harvard_4b8057d0_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_filepath_json_harvard_4b8057d0_like ON public.search_opinioncluster USING btree (filepath_json_harvard varchar_pattern_ops);


--
-- Name: search_opinioncluster_non_participating_judges_49bb60ae; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_non_participating_judges_49bb60ae ON public.search_opinioncluster_non_participating_judges USING btree (opinioncluster_id);


--
-- Name: search_opinioncluster_non_participating_judges_e7c5d788; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_non_participating_judges_e7c5d788 ON public.search_opinioncluster_non_participating_judges USING btree (person_id);


--
-- Name: search_opinioncluster_panel_49bb60ae; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_panel_49bb60ae ON public.search_opinioncluster_panel USING btree (opinioncluster_id);


--
-- Name: search_opinioncluster_panel_e7c5d788; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_panel_e7c5d788 ON public.search_opinioncluster_panel USING btree (person_id);


--
-- Name: search_opinioncluster_precedential_status_2bdec6e2dedba28b_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_precedential_status_2bdec6e2dedba28b_like ON public.search_opinioncluster USING btree (precedential_status varchar_pattern_ops);


--
-- Name: search_opinioncluster_supreme_court_db_id_4297061ed6ba336_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinioncluster_supreme_court_db_id_4297061ed6ba336_like ON public.search_opinioncluster USING btree (scdb_id varchar_pattern_ops);


--
-- Name: search_opinionclusterevent_docket_id_165932da; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionclusterevent_docket_id_165932da ON public.search_opinionclusterevent USING btree (docket_id);


--
-- Name: search_opinionclusterevent_pgh_context_id_273003da; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionclusterevent_pgh_context_id_273003da ON public.search_opinionclusterevent USING btree (pgh_context_id);


--
-- Name: search_opinionclusterevent_pgh_obj_id_f1ea380d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionclusterevent_pgh_obj_id_f1ea380d ON public.search_opinionclusterevent USING btree (pgh_obj_id);


--
-- Name: search_opinionclusternonpa_opinioncluster_id_cc505710; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionclusternonpa_opinioncluster_id_cc505710 ON public.search_opinionclusternonparticipatingjudgesevent USING btree (opinioncluster_id);


--
-- Name: search_opinionclusternonpa_person_id_7bf4f773; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionclusternonpa_person_id_7bf4f773 ON public.search_opinionclusternonparticipatingjudgesevent USING btree (person_id);


--
-- Name: search_opinionclusternonpa_pgh_context_id_aef74bea; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionclusternonpa_pgh_context_id_aef74bea ON public.search_opinionclusternonparticipatingjudgesevent USING btree (pgh_context_id);


--
-- Name: search_opinionclusterpanelevent_opinioncluster_id_7128c9e4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionclusterpanelevent_opinioncluster_id_7128c9e4 ON public.search_opinionclusterpanelevent USING btree (opinioncluster_id);


--
-- Name: search_opinionclusterpanelevent_person_id_b1c6a4a7; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionclusterpanelevent_person_id_b1c6a4a7 ON public.search_opinionclusterpanelevent USING btree (person_id);


--
-- Name: search_opinionclusterpanelevent_pgh_context_id_8dcb8078; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionclusterpanelevent_pgh_context_id_8dcb8078 ON public.search_opinionclusterpanelevent USING btree (pgh_context_id);


--
-- Name: search_opinionevent_author_id_43b0c67a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionevent_author_id_43b0c67a ON public.search_opinionevent USING btree (author_id);


--
-- Name: search_opinionevent_cluster_id_1205465b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionevent_cluster_id_1205465b ON public.search_opinionevent USING btree (cluster_id);


--
-- Name: search_opinionevent_pgh_context_id_723082e0; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionevent_pgh_context_id_723082e0 ON public.search_opinionevent USING btree (pgh_context_id);


--
-- Name: search_opinionevent_pgh_obj_id_63a2bc5f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionevent_pgh_obj_id_63a2bc5f ON public.search_opinionevent USING btree (pgh_obj_id);


--
-- Name: search_opinionjoinedbyevent_opinion_id_9271b281; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionjoinedbyevent_opinion_id_9271b281 ON public.search_opinionjoinedbyevent USING btree (opinion_id);


--
-- Name: search_opinionjoinedbyevent_person_id_dffa9dcb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionjoinedbyevent_person_id_dffa9dcb ON public.search_opinionjoinedbyevent USING btree (person_id);


--
-- Name: search_opinionjoinedbyevent_pgh_context_id_48acc9ad; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionjoinedbyevent_pgh_context_id_48acc9ad ON public.search_opinionjoinedbyevent USING btree (pgh_context_id);


--
-- Name: search_opinionscited_5b8b69a0; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionscited_5b8b69a0 ON public.search_opinionscited USING btree (citing_opinion_id);


--
-- Name: search_opinionscited_740050e6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionscited_740050e6 ON public.search_opinionscited USING btree (cited_opinion_id);


--
-- Name: search_opinionscited_depth_46bacaef; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionscited_depth_46bacaef ON public.search_opinionscited USING btree (depth);


--
-- Name: search_opinionscitedbyrecapdocument_cited_opinion_id_5f0347bb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionscitedbyrecapdocument_cited_opinion_id_5f0347bb ON public.search_opinionscitedbyrecapdocument USING btree (cited_opinion_id);


--
-- Name: search_opinionscitedbyrecapdocument_citing_document_id_c64b751b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_opinionscitedbyrecapdocument_citing_document_id_c64b751b ON public.search_opinionscitedbyrecapdocument USING btree (citing_document_id);


--
-- Name: search_originatingcourtinf_ordering_judge_id_5aa931cb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_originatingcourtinf_ordering_judge_id_5aa931cb ON public.search_originatingcourtinformationevent USING btree (ordering_judge_id);


--
-- Name: search_originatingcourtinformation_02c1725c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_originatingcourtinformation_02c1725c ON public.search_originatingcourtinformation USING btree (assigned_to_id);


--
-- Name: search_originatingcourtinformation_09a6c128; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_originatingcourtinformation_09a6c128 ON public.search_originatingcourtinformation USING btree (ordering_judge_id);


--
-- Name: search_originatingcourtinformation_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_originatingcourtinformation_5fdb3d66 ON public.search_originatingcourtinformation USING btree (date_modified);


--
-- Name: search_originatingcourtinformation_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_originatingcourtinformation_c69e55a4 ON public.search_originatingcourtinformation USING btree (date_created);


--
-- Name: search_originatingcourtinformationevent_assigned_to_id_fcce9094; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_originatingcourtinformationevent_assigned_to_id_fcce9094 ON public.search_originatingcourtinformationevent USING btree (assigned_to_id);


--
-- Name: search_originatingcourtinformationevent_pgh_context_id_d8ffc4c8; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_originatingcourtinformationevent_pgh_context_id_d8ffc4c8 ON public.search_originatingcourtinformationevent USING btree (pgh_context_id);


--
-- Name: search_originatingcourtinformationevent_pgh_obj_id_32490a9c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_originatingcourtinformationevent_pgh_obj_id_32490a9c ON public.search_originatingcourtinformationevent USING btree (pgh_obj_id);


--
-- Name: search_pare_score_16f118_idx; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_pare_score_16f118_idx ON public.search_parentheticalgroup USING btree (score);


--
-- Name: search_parenthetical_described_opinion_id_ddd408db; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_parenthetical_described_opinion_id_ddd408db ON public.search_parenthetical USING btree (described_opinion_id);


--
-- Name: search_parenthetical_describing_opinion_id_07864494; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_parenthetical_describing_opinion_id_07864494 ON public.search_parenthetical USING btree (describing_opinion_id);


--
-- Name: search_parenthetical_group_id_00a7def3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_parenthetical_group_id_00a7def3 ON public.search_parenthetical USING btree (group_id);


--
-- Name: search_parenthetical_score_cab0b2a1; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_parenthetical_score_cab0b2a1 ON public.search_parenthetical USING btree (score);


--
-- Name: search_parentheticalgroup_opinion_id_fd6bb935; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_parentheticalgroup_opinion_id_fd6bb935 ON public.search_parentheticalgroup USING btree (opinion_id);


--
-- Name: search_parentheticalgroup_representative_id_00e5a857; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_parentheticalgroup_representative_id_00e5a857 ON public.search_parentheticalgroup USING btree (representative_id);


--
-- Name: search_reca_documen_cc5acd_idx; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_reca_documen_cc5acd_idx ON public.search_recapdocument USING btree (document_type, document_number, attachment_number);


--
-- Name: search_recapdocument_1dec38a6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocument_1dec38a6 ON public.search_recapdocument USING btree (is_free_on_pacer);


--
-- Name: search_recapdocument_40d913b2; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocument_40d913b2 ON public.search_recapdocument USING btree (docket_entry_id);


--
-- Name: search_recapdocument_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocument_5fdb3d66 ON public.search_recapdocument USING btree (date_modified);


--
-- Name: search_recapdocument_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocument_c69e55a4 ON public.search_recapdocument USING btree (date_created);


--
-- Name: search_recapdocument_document_number_6f825e81ddd11fde_uniq; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocument_document_number_6f825e81ddd11fde_uniq ON public.search_recapdocument USING btree (document_number);


--
-- Name: search_recapdocument_filepath_local_7dc6b0e53ccf753_uniq; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocument_filepath_local_7dc6b0e53ccf753_uniq ON public.search_recapdocument USING btree (filepath_local);


--
-- Name: search_recapdocument_pacer_doc_id_12ec9c122839e6aa_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocument_pacer_doc_id_12ec9c122839e6aa_like ON public.search_recapdocument USING btree (pacer_doc_id varchar_pattern_ops);


--
-- Name: search_recapdocument_tags_76f094bc; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocument_tags_76f094bc ON public.search_recapdocument_tags USING btree (tag_id);


--
-- Name: search_recapdocument_tags_fae26ff6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocument_tags_fae26ff6 ON public.search_recapdocument_tags USING btree (recapdocument_id);


--
-- Name: search_recapdocumentevent_docket_entry_id_055ee57b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocumentevent_docket_entry_id_055ee57b ON public.search_recapdocumentevent USING btree (docket_entry_id);


--
-- Name: search_recapdocumentevent_pgh_context_id_37bf47c3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocumentevent_pgh_context_id_37bf47c3 ON public.search_recapdocumentevent USING btree (pgh_context_id);


--
-- Name: search_recapdocumentevent_pgh_obj_id_aa9c8d6e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocumentevent_pgh_obj_id_aa9c8d6e ON public.search_recapdocumentevent USING btree (pgh_obj_id);


--
-- Name: search_recapdocumenttagsevent_pgh_context_id_ff9be284; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocumenttagsevent_pgh_context_id_ff9be284 ON public.search_recapdocumenttagsevent USING btree (pgh_context_id);


--
-- Name: search_recapdocumenttagsevent_recapdocument_id_c6f0a858; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocumenttagsevent_recapdocument_id_c6f0a858 ON public.search_recapdocumenttagsevent USING btree (recapdocument_id);


--
-- Name: search_recapdocumenttagsevent_tag_id_9fa96f02; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_recapdocumenttagsevent_tag_id_9fa96f02 ON public.search_recapdocumenttagsevent USING btree (tag_id);


--
-- Name: search_tag_5fdb3d66; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_tag_5fdb3d66 ON public.search_tag USING btree (date_modified);


--
-- Name: search_tag_c69e55a4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_tag_c69e55a4 ON public.search_tag USING btree (date_created);


--
-- Name: search_tag_name_30c16b352387258b_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_tag_name_30c16b352387258b_like ON public.search_tag USING btree (name varchar_pattern_ops);


--
-- Name: search_tagevent_pgh_context_id_03f699de; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_tagevent_pgh_context_id_03f699de ON public.search_tagevent USING btree (pgh_context_id);


--
-- Name: search_tagevent_pgh_obj_id_af8c9817; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX search_tagevent_pgh_obj_id_af8c9817 ON public.search_tagevent USING btree (pgh_obj_id);


--
-- Name: search_court_appeals_to pgtrigger_update_or_delete_snapshot_delete_01d31; Type: TRIGGER; Schema: public; Owner: django
--


----------------------------------------------------------------
--
-- DONE ABOVE
--
----------------------------------------------------------------
