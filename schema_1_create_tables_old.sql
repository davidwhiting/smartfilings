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

----------------------------------- CREATE TABLES  -----------------------------------------------------

-- Name: audio_audio
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
CREATE SEQUENCE public.audio_audio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.audio_audio_id_seq OWNER TO django;
ALTER SEQUENCE public.audio_audio_id_seq OWNED BY public.audio_audio.id;


-- Name: audio_audio_panel

CREATE TABLE public.audio_audio_panel (
    id integer NOT NULL,
    audio_id integer NOT NULL,
    person_id integer NOT NULL
);
ALTER TABLE public.audio_audio_panel OWNER TO django;
CREATE SEQUENCE public.audio_audio_panel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.audio_audio_panel_id_seq OWNER TO django;
ALTER SEQUENCE public.audio_audio_panel_id_seq OWNED BY public.audio_audio_panel.id;

-- Name: audio_audioevent
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
CREATE SEQUENCE public.audio_audioevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.audio_audioevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.audio_audioevent_pgh_id_seq OWNED BY public.audio_audioevent.pgh_id;

-- Name: audio_audiopanelevent
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
CREATE SEQUENCE public.audio_audiopanelevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.audio_audiopanelevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.audio_audiopanelevent_pgh_id_seq OWNED BY public.audio_audiopanelevent.pgh_id;

-- Name: people_db_abarating
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
CREATE SEQUENCE public.people_db_abarating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_abarating_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_abarating_id_seq OWNED BY public.people_db_abarating.id;

-- Name: people_db_abaratingevent
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
CREATE SEQUENCE public.people_db_abaratingevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_abaratingevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_abaratingevent_pgh_id_seq OWNED BY public.people_db_abaratingevent.pgh_id;

-- Name: people_db_attorney
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
CREATE SEQUENCE public.people_db_attorney_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_attorney_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_attorney_id_seq OWNED BY public.people_db_attorney.id;

-- Name: people_db_attorneyorganization
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
CREATE SEQUENCE public.people_db_attorneyorganization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_attorneyorganization_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_attorneyorganization_id_seq OWNED BY public.people_db_attorneyorganization.id;

-- Name: people_db_attorneyorganizationassociation
CREATE TABLE public.people_db_attorneyorganizationassociation (
    id integer NOT NULL,
    attorney_id integer NOT NULL,
    attorney_organization_id integer NOT NULL,
    docket_id integer NOT NULL
);
ALTER TABLE public.people_db_attorneyorganizationassociation OWNER TO django;
CREATE SEQUENCE public.people_db_attorneyorganizationassociation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_attorneyorganizationassociation_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_attorneyorganizationassociation_id_seq OWNED BY public.people_db_attorneyorganizationassociation.id;

-- Name: people_db_criminalcomplaint
CREATE TABLE public.people_db_criminalcomplaint (
    id integer NOT NULL,
    name text NOT NULL,
    disposition text NOT NULL,
    party_type_id integer NOT NULL
);
ALTER TABLE public.people_db_criminalcomplaint OWNER TO django;
CREATE SEQUENCE public.people_db_criminalcomplaint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_criminalcomplaint_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_criminalcomplaint_id_seq OWNED BY public.people_db_criminalcomplaint.id;

-- Name: people_db_criminalcount
CREATE TABLE public.people_db_criminalcount (
    id integer NOT NULL,
    name text NOT NULL,
    disposition text NOT NULL,
    status smallint NOT NULL,
    party_type_id integer NOT NULL
);
ALTER TABLE public.people_db_criminalcount OWNER TO django;
CREATE SEQUENCE public.people_db_criminalcount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_criminalcount_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_criminalcount_id_seq OWNED BY public.people_db_criminalcount.id;

-- Name: people_db_education
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
CREATE SEQUENCE public.people_db_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_education_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_education_id_seq OWNED BY public.people_db_education.id;

-- Name: people_db_educationevent
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
CREATE SEQUENCE public.people_db_educationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_educationevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_educationevent_pgh_id_seq OWNED BY public.people_db_educationevent.pgh_id;

-- Name: people_db_party
CREATE TABLE public.people_db_party (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name text NOT NULL,
    extra_info text NOT NULL
);
ALTER TABLE public.people_db_party OWNER TO django;
CREATE SEQUENCE public.people_db_party_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_party_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_party_id_seq OWNED BY public.people_db_party.id;

-- Name: people_db_partytype
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
CREATE SEQUENCE public.people_db_partytype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_partytype_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_partytype_id_seq OWNED BY public.people_db_partytype.id;

-- Name: people_db_person
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
CREATE SEQUENCE public.people_db_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_person_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_person_id_seq OWNED BY public.people_db_person.id;

-- Name: people_db_person_race
CREATE TABLE public.people_db_person_race (
    id integer NOT NULL,
    person_id integer NOT NULL,
    race_id integer NOT NULL
);
ALTER TABLE public.people_db_person_race OWNER TO django;
CREATE SEQUENCE public.people_db_person_race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_person_race_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_person_race_id_seq OWNED BY public.people_db_person_race.id;

-- Name: people_db_personevent
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
CREATE SEQUENCE public.people_db_personevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_personevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_personevent_pgh_id_seq OWNED BY public.people_db_personevent.pgh_id;

-- Name: people_db_personraceevent
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
CREATE SEQUENCE public.people_db_personraceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_personraceevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_personraceevent_pgh_id_seq OWNED BY public.people_db_personraceevent.pgh_id;

-- Name: people_db_politicalaffiliation
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
CREATE SEQUENCE public.people_db_politicalaffiliation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_politicalaffiliation_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_politicalaffiliation_id_seq OWNED BY public.people_db_politicalaffiliation.id;

-- Name: people_db_politicalaffiliationevent
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
CREATE SEQUENCE public.people_db_politicalaffiliationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_politicalaffiliationevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_politicalaffiliationevent_pgh_id_seq OWNED BY public.people_db_politicalaffiliationevent.pgh_id;

-- Name: people_db_position
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
CREATE SEQUENCE public.people_db_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_position_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_position_id_seq OWNED BY public.people_db_position.id;

-- Name: people_db_positionevent; Type: TABLE; Schema: public; Owner: django
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
CREATE SEQUENCE public.people_db_positionevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_positionevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_positionevent_pgh_id_seq OWNED BY public.people_db_positionevent.pgh_id;

-- Name: people_db_race
CREATE TABLE public.people_db_race (
    id integer NOT NULL,
    race character varying(5) NOT NULL
);
ALTER TABLE public.people_db_race OWNER TO django;
CREATE SEQUENCE public.people_db_race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_race_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_race_id_seq OWNED BY public.people_db_race.id;

-- Name: people_db_raceevent
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
CREATE SEQUENCE public.people_db_raceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_raceevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_raceevent_pgh_id_seq OWNED BY public.people_db_raceevent.pgh_id;

-- Name: people_db_retentionevent
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
CREATE SEQUENCE public.people_db_retentionevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_retentionevent_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_retentionevent_id_seq OWNED BY public.people_db_retentionevent.id;

-- Name: people_db_retentioneventevent
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
CREATE SEQUENCE public.people_db_retentioneventevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_retentioneventevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_retentioneventevent_pgh_id_seq OWNED BY public.people_db_retentioneventevent.pgh_id;

-- Name: people_db_role
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
CREATE SEQUENCE public.people_db_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_role_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_role_id_seq OWNED BY public.people_db_role.id;

-- Name: people_db_school
CREATE TABLE public.people_db_school (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name character varying(120) NOT NULL,
    ein integer,
    is_alias_of_id integer
);
ALTER TABLE public.people_db_school OWNER TO django;
CREATE SEQUENCE public.people_db_school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_school_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_school_id_seq OWNED BY public.people_db_school.id;

-- Name: people_db_schoolevent
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
CREATE SEQUENCE public.people_db_schoolevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_schoolevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_schoolevent_pgh_id_seq OWNED BY public.people_db_schoolevent.pgh_id;

-- Name: people_db_source
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
CREATE SEQUENCE public.people_db_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_source_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_source_id_seq OWNED BY public.people_db_source.id;

-- Name: people_db_sourceevent
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
CREATE SEQUENCE public.people_db_sourceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.people_db_sourceevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.people_db_sourceevent_pgh_id_seq OWNED BY public.people_db_sourceevent.pgh_id;

-- Name: search_bankruptcyinformation
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
CREATE SEQUENCE public.search_bankruptcyinformation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_bankruptcyinformation_id_seq OWNER TO django;
ALTER SEQUENCE public.search_bankruptcyinformation_id_seq OWNED BY public.search_bankruptcyinformation.id;

-- Name: search_bankruptcyinformationevent
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
CREATE SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq OWNED BY public.search_bankruptcyinformationevent.pgh_id;

-- Name: search_citation
CREATE TABLE public.search_citation (
    id integer NOT NULL,
    volume smallint NOT NULL,
    reporter text NOT NULL,
    page text NOT NULL,
    type smallint NOT NULL,
    cluster_id integer NOT NULL
);
ALTER TABLE public.search_citation OWNER TO django;
CREATE SEQUENCE public.search_citation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_citation_id_seq OWNER TO django;
ALTER SEQUENCE public.search_citation_id_seq OWNED BY public.search_citation.id;

-- Name: search_citationevent
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
CREATE SEQUENCE public.search_citationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_citationevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_citationevent_pgh_id_seq OWNED BY public.search_citationevent.pgh_id;

-- Name: search_claim
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
CREATE SEQUENCE public.search_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_claim_id_seq OWNER TO django;
ALTER SEQUENCE public.search_claim_id_seq OWNED BY public.search_claim.id;

-- Name: search_claim_tags
CREATE TABLE public.search_claim_tags (
    id integer NOT NULL,
    claim_id integer NOT NULL,
    tag_id integer NOT NULL
);
ALTER TABLE public.search_claim_tags OWNER TO django;
CREATE SEQUENCE public.search_claim_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_claim_tags_id_seq OWNER TO django;
ALTER SEQUENCE public.search_claim_tags_id_seq OWNED BY public.search_claim_tags.id;

-- Name: search_claimevent
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
CREATE SEQUENCE public.search_claimevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_claimevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_claimevent_pgh_id_seq OWNED BY public.search_claimevent.pgh_id;

-- Name: search_claimhistory
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
CREATE SEQUENCE public.search_claimhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_claimhistory_id_seq OWNER TO django;
ALTER SEQUENCE public.search_claimhistory_id_seq OWNED BY public.search_claimhistory.id;

-- Name: search_claimhistoryevent
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
CREATE SEQUENCE public.search_claimhistoryevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_claimhistoryevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_claimhistoryevent_pgh_id_seq OWNED BY public.search_claimhistoryevent.pgh_id;

-- Name: search_claimtagsevent
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
CREATE SEQUENCE public.search_claimtagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_claimtagsevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_claimtagsevent_pgh_id_seq OWNED BY public.search_claimtagsevent.pgh_id;

-- Name: search_court
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

-- Name: search_court_appeals_to
CREATE TABLE public.search_court_appeals_to (
    id integer NOT NULL,
    from_court_id character varying(15) NOT NULL,
    to_court_id character varying(15) NOT NULL
);
ALTER TABLE public.search_court_appeals_to OWNER TO django;
ALTER TABLE public.search_court_appeals_to ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_court_appeals_to_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

-- Name: search_courtappealstoevent
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
ALTER TABLE public.search_courtappealstoevent ALTER COLUMN pgh_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_courtappealstoevent_pgh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

-- Name: search_courtevent
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
CREATE SEQUENCE public.search_courtevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_courtevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_courtevent_pgh_id_seq OWNED BY public.search_courtevent.pgh_id;

-- Name: search_courthouse
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
ALTER TABLE public.search_courthouse ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_courthouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

-- Name: search_courthouseevent
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
ALTER TABLE public.search_courthouseevent ALTER COLUMN pgh_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_courthouseevent_pgh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

-- Name: search_docket
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
CREATE SEQUENCE public.search_docket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_docket_id_seq OWNER TO django;
ALTER SEQUENCE public.search_docket_id_seq OWNED BY public.search_docket.id;

-- Name: search_docket_panel
CREATE TABLE public.search_docket_panel (
    id integer NOT NULL,
    docket_id integer NOT NULL,
    person_id integer NOT NULL
);
ALTER TABLE public.search_docket_panel OWNER TO django;
CREATE SEQUENCE public.search_docket_panel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_docket_panel_id_seq OWNER TO django;
ALTER SEQUENCE public.search_docket_panel_id_seq OWNED BY public.search_docket_panel.id;

-- Name: search_docket_tags
CREATE TABLE public.search_docket_tags (
    id integer NOT NULL,
    docket_id integer NOT NULL,
    tag_id integer NOT NULL
);
ALTER TABLE public.search_docket_tags OWNER TO django;
CREATE SEQUENCE public.search_docket_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_docket_tags_id_seq OWNER TO django;
ALTER SEQUENCE public.search_docket_tags_id_seq OWNED BY public.search_docket_tags.id;

-- Name: search_docketentry
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
CREATE SEQUENCE public.search_docketentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_docketentry_id_seq OWNER TO django;
ALTER SEQUENCE public.search_docketentry_id_seq OWNED BY public.search_docketentry.id;

-- Name: search_docketentry_tags
CREATE TABLE public.search_docketentry_tags (
    id integer NOT NULL,
    docketentry_id integer NOT NULL,
    tag_id integer NOT NULL
);
ALTER TABLE public.search_docketentry_tags OWNER TO django;
CREATE SEQUENCE public.search_docketentry_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_docketentry_tags_id_seq OWNER TO django;
ALTER SEQUENCE public.search_docketentry_tags_id_seq OWNED BY public.search_docketentry_tags.id;

-- Name: search_docketentryevent
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
CREATE SEQUENCE public.search_docketentryevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_docketentryevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_docketentryevent_pgh_id_seq OWNED BY public.search_docketentryevent.pgh_id;

-- Name: search_docketentrytagsevent
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
CREATE SEQUENCE public.search_docketentrytagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_docketentrytagsevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_docketentrytagsevent_pgh_id_seq OWNED BY public.search_docketentrytagsevent.pgh_id;

-- Name: search_docketevent
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
CREATE SEQUENCE public.search_docketevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_docketevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_docketevent_pgh_id_seq OWNED BY public.search_docketevent.pgh_id;

-- Name: search_docketpanelevent
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
CREATE SEQUENCE public.search_docketpanelevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_docketpanelevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_docketpanelevent_pgh_id_seq OWNED BY public.search_docketpanelevent.pgh_id;

-- Name: search_dockettagsevent
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
CREATE SEQUENCE public.search_dockettagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_dockettagsevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_dockettagsevent_pgh_id_seq OWNED BY public.search_dockettagsevent.pgh_id;

-- Name: search_opinion
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
CREATE SEQUENCE public.search_opinion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinion_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinion_id_seq OWNED BY public.search_opinion.id;

-- Name: search_opinion_joined_by
CREATE TABLE public.search_opinion_joined_by (
    id integer NOT NULL,
    opinion_id integer NOT NULL,
    person_id integer NOT NULL
);
ALTER TABLE public.search_opinion_joined_by OWNER TO django;
CREATE SEQUENCE public.search_opinion_joined_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinion_joined_by_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinion_joined_by_id_seq OWNED BY public.search_opinion_joined_by.id;

-- Name: search_opinioncluster
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
CREATE SEQUENCE public.search_opinioncluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinioncluster_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinioncluster_id_seq OWNED BY public.search_opinioncluster.id;

-- Name: search_opinioncluster_non_participating_judges
CREATE TABLE public.search_opinioncluster_non_participating_judges (
    id integer NOT NULL,
    opinioncluster_id integer NOT NULL,
    person_id integer NOT NULL
);
ALTER TABLE public.search_opinioncluster_non_participating_judges OWNER TO django;
CREATE SEQUENCE public.search_opinioncluster_non_participating_judges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinioncluster_non_participating_judges_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinioncluster_non_participating_judges_id_seq OWNED BY public.search_opinioncluster_non_participating_judges.id;

-- Name: search_opinioncluster_panel
CREATE TABLE public.search_opinioncluster_panel (
    id integer NOT NULL,
    opinioncluster_id integer NOT NULL,
    person_id integer NOT NULL
);
ALTER TABLE public.search_opinioncluster_panel OWNER TO django;
CREATE SEQUENCE public.search_opinioncluster_panel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinioncluster_panel_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinioncluster_panel_id_seq OWNED BY public.search_opinioncluster_panel.id;

-- Name: search_opinionclusterevent
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
CREATE SEQUENCE public.search_opinionclusterevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinionclusterevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinionclusterevent_pgh_id_seq OWNED BY public.search_opinionclusterevent.pgh_id;

-- Name: search_opinionclusternonparticipatingjudgesevent
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
CREATE SEQUENCE public.search_opinionclusternonparticipatingjudgesevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinionclusternonparticipatingjudgesevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinionclusternonparticipatingjudgesevent_pgh_id_seq OWNED BY public.search_opinionclusternonparticipatingjudgesevent.pgh_id;

-- Name: search_opinionclusterpanelevent
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
CREATE SEQUENCE public.search_opinionclusterpanelevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinionclusterpanelevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinionclusterpanelevent_pgh_id_seq OWNED BY public.search_opinionclusterpanelevent.pgh_id;

-- Name: search_opinionevent
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
CREATE SEQUENCE public.search_opinionevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinionevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinionevent_pgh_id_seq OWNED BY public.search_opinionevent.pgh_id;

-- Name: search_opinionjoinedbyevent
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
CREATE SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq OWNED BY public.search_opinionjoinedbyevent.pgh_id;

-- Name: search_opinionscited
CREATE TABLE public.search_opinionscited (
    id integer NOT NULL,
    cited_opinion_id integer NOT NULL,
    citing_opinion_id integer NOT NULL,
    depth integer NOT NULL
);
ALTER TABLE public.search_opinionscited OWNER TO django;
CREATE SEQUENCE public.search_opinionscited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinionscited_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinionscited_id_seq OWNED BY public.search_opinionscited.id;

-- Name: search_opinionscitedbyrecapdocument
CREATE TABLE public.search_opinionscitedbyrecapdocument (
    id integer NOT NULL,
    depth integer NOT NULL,
    cited_opinion_id integer NOT NULL,
    citing_document_id integer NOT NULL
);
ALTER TABLE public.search_opinionscitedbyrecapdocument OWNER TO django;
CREATE SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq OWNER TO django;
ALTER SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq OWNED BY public.search_opinionscitedbyrecapdocument.id;

-- Name: search_originatingcourtinformation
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
CREATE SEQUENCE public.search_originatingcourtinformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_originatingcourtinformation_id_seq OWNER TO django;
ALTER SEQUENCE public.search_originatingcourtinformation_id_seq OWNED BY public.search_originatingcourtinformation.id;

-- Name: search_originatingcourtinformationevent
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
CREATE SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq OWNED BY public.search_originatingcourtinformationevent.pgh_id;

-- Name: search_parenthetical
CREATE TABLE public.search_parenthetical (
    id integer NOT NULL,
    text text NOT NULL,
    score double precision NOT NULL,
    described_opinion_id integer NOT NULL,
    describing_opinion_id integer NOT NULL,
    group_id integer
);
ALTER TABLE public.search_parenthetical OWNER TO django;
CREATE SEQUENCE public.search_parenthetical_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_parenthetical_id_seq OWNER TO django;
ALTER SEQUENCE public.search_parenthetical_id_seq OWNED BY public.search_parenthetical.id;

-- Name: search_parentheticalgroup
CREATE TABLE public.search_parentheticalgroup (
    id integer NOT NULL,
    score double precision NOT NULL,
    size integer NOT NULL,
    opinion_id integer NOT NULL,
    representative_id integer NOT NULL
);
ALTER TABLE public.search_parentheticalgroup OWNER TO django;
CREATE SEQUENCE public.search_parentheticalgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_parentheticalgroup_id_seq OWNER TO django;
ALTER SEQUENCE public.search_parentheticalgroup_id_seq OWNED BY public.search_parentheticalgroup.id;

-- Name: search_recapdocument
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
CREATE SEQUENCE public.search_recapdocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_recapdocument_id_seq OWNER TO django;
ALTER SEQUENCE public.search_recapdocument_id_seq OWNED BY public.search_recapdocument.id;

-- Name: search_recapdocument_tags
CREATE TABLE public.search_recapdocument_tags (
    id integer NOT NULL,
    recapdocument_id integer NOT NULL,
    tag_id integer NOT NULL
);
ALTER TABLE public.search_recapdocument_tags OWNER TO django;
CREATE SEQUENCE public.search_recapdocument_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_recapdocument_tags_id_seq OWNER TO django;
ALTER SEQUENCE public.search_recapdocument_tags_id_seq OWNED BY public.search_recapdocument_tags.id;

-- Name: search_recapdocumentevent
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
CREATE SEQUENCE public.search_recapdocumentevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_recapdocumentevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_recapdocumentevent_pgh_id_seq OWNED BY public.search_recapdocumentevent.pgh_id;

-- Name: search_recapdocumenttagsevent
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
CREATE SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq OWNED BY public.search_recapdocumenttagsevent.pgh_id;

-- Name: search_tag
CREATE TABLE public.search_tag (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL
);
ALTER TABLE public.search_tag OWNER TO django;
CREATE SEQUENCE public.search_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_tag_id_seq OWNER TO django;
ALTER SEQUENCE public.search_tag_id_seq OWNED BY public.search_tag.id;

-- Name: search_tagevent
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
CREATE SEQUENCE public.search_tagevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.search_tagevent_pgh_id_seq OWNER TO django;
ALTER SEQUENCE public.search_tagevent_pgh_id_seq OWNED BY public.search_tagevent.pgh_id;
