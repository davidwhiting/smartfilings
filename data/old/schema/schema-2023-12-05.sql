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
-- ---------------- Databases Created Below
--

--
-- ---------------------------------------------------------------------------- 
--

-- FIGURE THIS ONE OUT
-- CANT FIND IT
-- echo "Loading fjc-integrated-database-2023-12-04.csv to database"
COPY public.recap_fjcintegrateddatabase (
	       id, date_created, date_modified, dataset_source, office,
	       docket_number, origin, date_filed, jurisdiction, nature_of_suit,
	       title, section, subsection, diversity_of_residence, class_action,
	       monetary_demand, county_of_residence, arbitration_at_filing,
	       arbitration_at_termination, multidistrict_litigation_docket_number,
	       plaintiff, defendant, date_transfer, transfer_office,
	       transfer_docket_number, transfer_origin, date_terminated,
	       termination_class_action_status, procedural_progress, disposition,
	       nature_of_judgement, amount_received, judgment, pro_se,
	       year_of_tape, nature_of_offense, version, circuit_id, district_id
	   ) FROM '/Volumes/aspen_cove/data/courtlistener/fjc-integrated-database-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)

--
-- ---------------------------------------------------------------------------- 
--





--
-- Name: people_db_abarating; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.people_db_abarating OWNER TO david;

--
-- Name: people_db_abarating_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_abarating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_abarating_id_seq OWNER TO david;

--
-- Name: people_db_abarating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_abarating_id_seq OWNED BY public.people_db_abarating.id;


--
-- Name: people_db_abaratingevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.people_db_abaratingevent OWNER TO david;

--
-- Name: people_db_abaratingevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_abaratingevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_abaratingevent_pgh_id_seq OWNER TO david;

--
-- Name: people_db_abaratingevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_abaratingevent_pgh_id_seq OWNED BY public.people_db_abaratingevent.pgh_id;


--
-- Name: people_db_attorney; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.people_db_attorney OWNER TO david;

--
-- Name: people_db_attorney_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_attorney_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_attorney_id_seq OWNER TO david;

--
-- Name: people_db_attorney_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_attorney_id_seq OWNED BY public.people_db_attorney.id;


--
-- Name: people_db_attorneyorganization; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.people_db_attorneyorganization OWNER TO david;

--
-- Name: people_db_attorneyorganization_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_attorneyorganization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_attorneyorganization_id_seq OWNER TO david;

--
-- Name: people_db_attorneyorganization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_attorneyorganization_id_seq OWNED BY public.people_db_attorneyorganization.id;


--
-- Name: people_db_attorneyorganizationassociation; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.people_db_attorneyorganizationassociation (
    id integer NOT NULL,
    attorney_id integer NOT NULL,
    attorney_organization_id integer NOT NULL,
    docket_id integer NOT NULL
);


ALTER TABLE public.people_db_attorneyorganizationassociation OWNER TO david;

--
-- Name: people_db_attorneyorganizationassociation_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_attorneyorganizationassociation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_attorneyorganizationassociation_id_seq OWNER TO david;

--
-- Name: people_db_attorneyorganizationassociation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_attorneyorganizationassociation_id_seq OWNED BY public.people_db_attorneyorganizationassociation.id;


--
-- Name: people_db_criminalcomplaint; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.people_db_criminalcomplaint (
    id integer NOT NULL,
    name text NOT NULL,
    disposition text NOT NULL,
    party_type_id integer NOT NULL
);


ALTER TABLE public.people_db_criminalcomplaint OWNER TO david;

--
-- Name: people_db_criminalcomplaint_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_criminalcomplaint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_criminalcomplaint_id_seq OWNER TO david;

--
-- Name: people_db_criminalcomplaint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_criminalcomplaint_id_seq OWNED BY public.people_db_criminalcomplaint.id;


--
-- Name: people_db_criminalcount; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.people_db_criminalcount (
    id integer NOT NULL,
    name text NOT NULL,
    disposition text NOT NULL,
    status smallint NOT NULL,
    party_type_id integer NOT NULL
);


ALTER TABLE public.people_db_criminalcount OWNER TO david;

--
-- Name: people_db_criminalcount_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_criminalcount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_criminalcount_id_seq OWNER TO david;

--
-- Name: people_db_criminalcount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_criminalcount_id_seq OWNED BY public.people_db_criminalcount.id;


--
-- Name: people_db_party; Type: TABLE; Schema: public; Owner: david
--
CREATE TABLE public.people_db_party (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name text NOT NULL,
    extra_info text NOT NULL
);
ALTER TABLE public.people_db_party OWNER TO david;
--
-- Name: people_db_party_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_party_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_party_id_seq OWNER TO david;

--
-- Name: people_db_party_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_party_id_seq OWNED BY public.people_db_party.id;


--
-- Name: people_db_partytype; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.people_db_partytype OWNER TO david;

--
-- Name: people_db_partytype_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_partytype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_partytype_id_seq OWNER TO david;

--
-- Name: people_db_partytype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_partytype_id_seq OWNED BY public.people_db_partytype.id;














--
-- Name: people_db_role; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.people_db_role OWNER TO david;

--
-- Name: people_db_role_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_role_id_seq OWNER TO david;

--
-- Name: people_db_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_role_id_seq OWNED BY public.people_db_role.id;


----------------------------------------------------------------------------------


--
-- Name: people_db_source; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.people_db_source OWNER TO david;

--
-- Name: people_db_source_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_source_id_seq OWNER TO david;

--
-- Name: people_db_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_source_id_seq OWNED BY public.people_db_source.id;


--
-- Name: people_db_sourceevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.people_db_sourceevent OWNER TO david;

--
-- Name: people_db_sourceevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.people_db_sourceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.people_db_sourceevent_pgh_id_seq OWNER TO david;

--
-- Name: people_db_sourceevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.people_db_sourceevent_pgh_id_seq OWNED BY public.people_db_sourceevent.pgh_id;


--
-- Name: search_bankruptcyinformation; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_bankruptcyinformation OWNER TO david;

--
-- Name: search_bankruptcyinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_bankruptcyinformation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_bankruptcyinformation_id_seq OWNER TO david;

--
-- Name: search_bankruptcyinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_bankruptcyinformation_id_seq OWNED BY public.search_bankruptcyinformation.id;


--
-- Name: search_bankruptcyinformationevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_bankruptcyinformationevent OWNER TO david;

--
-- Name: search_bankruptcyinformationevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq OWNER TO david;

--
-- Name: search_bankruptcyinformationevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq OWNED BY public.search_bankruptcyinformationevent.pgh_id;




--
-- Name: search_citation_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_citation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_citation_id_seq OWNER TO david;

--
-- Name: search_citation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_citation_id_seq OWNED BY public.search_citation.id;


--
-- Name: search_citationevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_citationevent OWNER TO david;

--
-- Name: search_citationevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_citationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_citationevent_pgh_id_seq OWNER TO david;

--
-- Name: search_citationevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_citationevent_pgh_id_seq OWNED BY public.search_citationevent.pgh_id;


--
-- Name: search_claim; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_claim OWNER TO david;

--
-- Name: search_claim_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claim_id_seq OWNER TO david;

--
-- Name: search_claim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_claim_id_seq OWNED BY public.search_claim.id;


--
-- Name: search_claim_tags; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.search_claim_tags (
    id integer NOT NULL,
    claim_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_claim_tags OWNER TO david;

--
-- Name: search_claim_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_claim_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claim_tags_id_seq OWNER TO david;

--
-- Name: search_claim_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_claim_tags_id_seq OWNED BY public.search_claim_tags.id;


--
-- Name: search_claimevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_claimevent OWNER TO david;

--
-- Name: search_claimevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_claimevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claimevent_pgh_id_seq OWNER TO david;

--
-- Name: search_claimevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_claimevent_pgh_id_seq OWNED BY public.search_claimevent.pgh_id;


--
-- Name: search_claimhistory; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_claimhistory OWNER TO david;

--
-- Name: search_claimhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_claimhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claimhistory_id_seq OWNER TO david;

--
-- Name: search_claimhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_claimhistory_id_seq OWNED BY public.search_claimhistory.id;


--
-- Name: search_claimhistoryevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_claimhistoryevent OWNER TO david;

--
-- Name: search_claimhistoryevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_claimhistoryevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claimhistoryevent_pgh_id_seq OWNER TO david;

--
-- Name: search_claimhistoryevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_claimhistoryevent_pgh_id_seq OWNED BY public.search_claimhistoryevent.pgh_id;


--
-- Name: search_claimtagsevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_claimtagsevent OWNER TO david;

--
-- Name: search_claimtagsevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_claimtagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_claimtagsevent_pgh_id_seq OWNER TO david;

--
-- Name: search_claimtagsevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_claimtagsevent_pgh_id_seq OWNED BY public.search_claimtagsevent.pgh_id;






--
-- Name: search_court_appeals_to_id_seq; Type: SEQUENCE; Schema: public; Owner: david
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
-- Name: search_courtappealstoevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_courtappealstoevent OWNER TO david;

--
-- Name: search_courtappealstoevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
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
-- Name: search_courtevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_courtevent OWNER TO david;

--
-- Name: search_courtevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_courtevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_courtevent_pgh_id_seq OWNER TO david;

--
-- Name: search_courtevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_courtevent_pgh_id_seq OWNED BY public.search_courtevent.pgh_id;



------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------



--
-- Name: search_opinionevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_opinionevent OWNER TO david;

--
-- Name: search_opinionevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_opinionevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionevent_pgh_id_seq OWNER TO david;

--
-- Name: search_opinionevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_opinionevent_pgh_id_seq OWNED BY public.search_opinionevent.pgh_id;


--
-- Name: search_opinionjoinedbyevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_opinionjoinedbyevent OWNER TO david;

--
-- Name: search_opinionjoinedbyevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq OWNER TO david;

--
-- Name: search_opinionjoinedbyevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq OWNED BY public.search_opinionjoinedbyevent.pgh_id;



--
-- Name: search_opinionscited_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_opinionscited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionscited_id_seq OWNER TO david;

--
-- Name: search_opinionscited_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_opinionscited_id_seq OWNED BY public.search_opinionscited.id;


--
-- Name: search_opinionscitedbyrecapdocument; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.search_opinionscitedbyrecapdocument (
    id integer NOT NULL,
    depth integer NOT NULL,
    cited_opinion_id integer NOT NULL,
    citing_document_id integer NOT NULL
);


ALTER TABLE public.search_opinionscitedbyrecapdocument OWNER TO david;

--
-- Name: search_opinionscitedbyrecapdocument_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq OWNER TO david;

--
-- Name: search_opinionscitedbyrecapdocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq OWNED BY public.search_opinionscitedbyrecapdocument.id;



--
-- Name: search_originatingcourtinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_originatingcourtinformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_originatingcourtinformation_id_seq OWNER TO david;

--
-- Name: search_originatingcourtinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_originatingcourtinformation_id_seq OWNED BY public.search_originatingcourtinformation.id;


--
-- Name: search_originatingcourtinformationevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_originatingcourtinformationevent OWNER TO david;

--
-- Name: search_originatingcourtinformationevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq OWNER TO david;

--
-- Name: search_originatingcourtinformationevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq OWNED BY public.search_originatingcourtinformationevent.pgh_id;



--
-- Name: search_parenthetical_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_parenthetical_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_parenthetical_id_seq OWNER TO david;

--
-- Name: search_parenthetical_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_parenthetical_id_seq OWNED BY public.search_parenthetical.id;


--
-- Name: search_parentheticalgroup; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.search_parentheticalgroup (
    id integer NOT NULL,
    score double precision NOT NULL,
    size integer NOT NULL,
    opinion_id integer NOT NULL,
    representative_id integer NOT NULL
);


ALTER TABLE public.search_parentheticalgroup OWNER TO david;

--
-- Name: search_parentheticalgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_parentheticalgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_parentheticalgroup_id_seq OWNER TO david;

--
-- Name: search_parentheticalgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_parentheticalgroup_id_seq OWNED BY public.search_parentheticalgroup.id;


--
-- Name: search_recapdocument; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_recapdocument OWNER TO david;

--
-- Name: search_recapdocument_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_recapdocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_recapdocument_id_seq OWNER TO david;

--
-- Name: search_recapdocument_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_recapdocument_id_seq OWNED BY public.search_recapdocument.id;


--
-- Name: search_recapdocument_tags; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.search_recapdocument_tags (
    id integer NOT NULL,
    recapdocument_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.search_recapdocument_tags OWNER TO david;

--
-- Name: search_recapdocument_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_recapdocument_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_recapdocument_tags_id_seq OWNER TO david;

--
-- Name: search_recapdocument_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_recapdocument_tags_id_seq OWNED BY public.search_recapdocument_tags.id;


--
-- Name: search_recapdocumentevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_recapdocumentevent OWNER TO david;

--
-- Name: search_recapdocumentevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_recapdocumentevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_recapdocumentevent_pgh_id_seq OWNER TO david;

--
-- Name: search_recapdocumentevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_recapdocumentevent_pgh_id_seq OWNED BY public.search_recapdocumentevent.pgh_id;


--
-- Name: search_recapdocumenttagsevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_recapdocumenttagsevent OWNER TO david;

--
-- Name: search_recapdocumenttagsevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq OWNER TO david;

--
-- Name: search_recapdocumenttagsevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq OWNED BY public.search_recapdocumenttagsevent.pgh_id;


--
-- Name: search_tag; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE public.search_tag (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.search_tag OWNER TO david;

--
-- Name: search_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_tag_id_seq OWNER TO david;

--
-- Name: search_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_tag_id_seq OWNED BY public.search_tag.id;


--
-- Name: search_tagevent; Type: TABLE; Schema: public; Owner: david
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


ALTER TABLE public.search_tagevent OWNER TO david;

--
-- Name: search_tagevent_pgh_id_seq; Type: SEQUENCE; Schema: public; Owner: david
--

CREATE SEQUENCE public.search_tagevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_tagevent_pgh_id_seq OWNER TO david;

--
-- Name: search_tagevent_pgh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: david
--

ALTER SEQUENCE public.search_tagevent_pgh_id_seq OWNED BY public.search_tagevent.pgh_id;


--
-- Name: audio_audio id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audio ALTER COLUMN id SET DEFAULT nextval('public.audio_audio_id_seq'::regclass);


--
-- Name: audio_audio_panel id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audio_panel ALTER COLUMN id SET DEFAULT nextval('public.audio_audio_panel_id_seq'::regclass);


--
-- Name: audio_audioevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audioevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.audio_audioevent_pgh_id_seq'::regclass);


--
-- Name: audio_audiopanelevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audiopanelevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.audio_audiopanelevent_pgh_id_seq'::regclass);


--
-- Name: people_db_abarating id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_abarating ALTER COLUMN id SET DEFAULT nextval('public.people_db_abarating_id_seq'::regclass);


--
-- Name: people_db_abaratingevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_abaratingevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_abaratingevent_pgh_id_seq'::regclass);


--
-- Name: people_db_attorney id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorney ALTER COLUMN id SET DEFAULT nextval('public.people_db_attorney_id_seq'::regclass);


--
-- Name: people_db_attorneyorganization id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganization ALTER COLUMN id SET DEFAULT nextval('public.people_db_attorneyorganization_id_seq'::regclass);


--
-- Name: people_db_attorneyorganizationassociation id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganizationassociation ALTER COLUMN id SET DEFAULT nextval('public.people_db_attorneyorganizationassociation_id_seq'::regclass);


--
-- Name: people_db_criminalcomplaint id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_criminalcomplaint ALTER COLUMN id SET DEFAULT nextval('public.people_db_criminalcomplaint_id_seq'::regclass);


--
-- Name: people_db_criminalcount id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_criminalcount ALTER COLUMN id SET DEFAULT nextval('public.people_db_criminalcount_id_seq'::regclass);


--
-- Name: people_db_education id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_education ALTER COLUMN id SET DEFAULT nextval('public.people_db_education_id_seq'::regclass);


--
-- Name: people_db_educationevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_educationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_educationevent_pgh_id_seq'::regclass);


--
-- Name: people_db_party id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_party ALTER COLUMN id SET DEFAULT nextval('public.people_db_party_id_seq'::regclass);


--
-- Name: people_db_partytype id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_partytype ALTER COLUMN id SET DEFAULT nextval('public.people_db_partytype_id_seq'::regclass);


--
-- Name: people_db_person id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_person ALTER COLUMN id SET DEFAULT nextval('public.people_db_person_id_seq'::regclass);


--
-- Name: people_db_person_race id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_person_race ALTER COLUMN id SET DEFAULT nextval('public.people_db_person_race_id_seq'::regclass);


--
-- Name: people_db_personevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_personevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_personevent_pgh_id_seq'::regclass);


--
-- Name: people_db_personraceevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_personraceevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_personraceevent_pgh_id_seq'::regclass);


--
-- Name: people_db_politicalaffiliation id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_politicalaffiliation ALTER COLUMN id SET DEFAULT nextval('public.people_db_politicalaffiliation_id_seq'::regclass);


--
-- Name: people_db_politicalaffiliationevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_politicalaffiliationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_politicalaffiliationevent_pgh_id_seq'::regclass);


--
-- Name: people_db_position id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_position ALTER COLUMN id SET DEFAULT nextval('public.people_db_position_id_seq'::regclass);


--
-- Name: people_db_positionevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_positionevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_positionevent_pgh_id_seq'::regclass);


--
-- Name: people_db_race id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_race ALTER COLUMN id SET DEFAULT nextval('public.people_db_race_id_seq'::regclass);


--
-- Name: people_db_raceevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_raceevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_raceevent_pgh_id_seq'::regclass);


--
-- Name: people_db_retentionevent id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_retentionevent ALTER COLUMN id SET DEFAULT nextval('public.people_db_retentionevent_id_seq'::regclass);


--
-- Name: people_db_retentioneventevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_retentioneventevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_retentioneventevent_pgh_id_seq'::regclass);


--
-- Name: people_db_role id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_role ALTER COLUMN id SET DEFAULT nextval('public.people_db_role_id_seq'::regclass);


--
-- Name: people_db_school id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_school ALTER COLUMN id SET DEFAULT nextval('public.people_db_school_id_seq'::regclass);


--
-- Name: people_db_schoolevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_schoolevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_schoolevent_pgh_id_seq'::regclass);


--
-- Name: people_db_source id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_source ALTER COLUMN id SET DEFAULT nextval('public.people_db_source_id_seq'::regclass);


--
-- Name: people_db_sourceevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_sourceevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.people_db_sourceevent_pgh_id_seq'::regclass);


--
-- Name: search_bankruptcyinformation id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_bankruptcyinformation ALTER COLUMN id SET DEFAULT nextval('public.search_bankruptcyinformation_id_seq'::regclass);


--
-- Name: search_bankruptcyinformationevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_bankruptcyinformationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_bankruptcyinformationevent_pgh_id_seq'::regclass);


--
-- Name: search_citation id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_citation ALTER COLUMN id SET DEFAULT nextval('public.search_citation_id_seq'::regclass);


--
-- Name: search_citationevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_citationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_citationevent_pgh_id_seq'::regclass);


--
-- Name: search_claim id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claim ALTER COLUMN id SET DEFAULT nextval('public.search_claim_id_seq'::regclass);


--
-- Name: search_claim_tags id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claim_tags ALTER COLUMN id SET DEFAULT nextval('public.search_claim_tags_id_seq'::regclass);


--
-- Name: search_claimevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claimevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_claimevent_pgh_id_seq'::regclass);


--
-- Name: search_claimhistory id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claimhistory ALTER COLUMN id SET DEFAULT nextval('public.search_claimhistory_id_seq'::regclass);


--
-- Name: search_claimhistoryevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claimhistoryevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_claimhistoryevent_pgh_id_seq'::regclass);


--
-- Name: search_claimtagsevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claimtagsevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_claimtagsevent_pgh_id_seq'::regclass);


--
-- Name: search_courtevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_courtevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_courtevent_pgh_id_seq'::regclass);


--
-- Name: search_docket id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket ALTER COLUMN id SET DEFAULT nextval('public.search_docket_id_seq'::regclass);


--
-- Name: search_docket_panel id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_panel ALTER COLUMN id SET DEFAULT nextval('public.search_docket_panel_id_seq'::regclass);


--
-- Name: search_docket_tags id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_tags ALTER COLUMN id SET DEFAULT nextval('public.search_docket_tags_id_seq'::regclass);


--
-- Name: search_docketentry id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentry ALTER COLUMN id SET DEFAULT nextval('public.search_docketentry_id_seq'::regclass);


--
-- Name: search_docketentry_tags id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentry_tags ALTER COLUMN id SET DEFAULT nextval('public.search_docketentry_tags_id_seq'::regclass);


--
-- Name: search_docketentryevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentryevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_docketentryevent_pgh_id_seq'::regclass);


--
-- Name: search_docketentrytagsevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentrytagsevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_docketentrytagsevent_pgh_id_seq'::regclass);


--
-- Name: search_docketevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_docketevent_pgh_id_seq'::regclass);


--
-- Name: search_docketpanelevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketpanelevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_docketpanelevent_pgh_id_seq'::regclass);


--
-- Name: search_dockettagsevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_dockettagsevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_dockettagsevent_pgh_id_seq'::regclass);


--
-- Name: search_opinion id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinion ALTER COLUMN id SET DEFAULT nextval('public.search_opinion_id_seq'::regclass);


--
-- Name: search_opinion_joined_by id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinion_joined_by ALTER COLUMN id SET DEFAULT nextval('public.search_opinion_joined_by_id_seq'::regclass);


--
-- Name: search_opinioncluster id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster ALTER COLUMN id SET DEFAULT nextval('public.search_opinioncluster_id_seq'::regclass);


--
-- Name: search_opinioncluster_non_participating_judges id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_non_participating_judges ALTER COLUMN id SET DEFAULT nextval('public.search_opinioncluster_non_participating_judges_id_seq'::regclass);


--
-- Name: search_opinioncluster_panel id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_panel ALTER COLUMN id SET DEFAULT nextval('public.search_opinioncluster_panel_id_seq'::regclass);


--
-- Name: search_opinionclusterevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionclusterevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionclusterevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionclusternonparticipatingjudgesevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionclusternonparticipatingjudgesevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionclusternonparticipatingjudgesevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionclusterpanelevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionclusterpanelevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionclusterpanelevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionjoinedbyevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionjoinedbyevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_opinionjoinedbyevent_pgh_id_seq'::regclass);


--
-- Name: search_opinionscited id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscited ALTER COLUMN id SET DEFAULT nextval('public.search_opinionscited_id_seq'::regclass);


--
-- Name: search_opinionscitedbyrecapdocument id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscitedbyrecapdocument ALTER COLUMN id SET DEFAULT nextval('public.search_opinionscitedbyrecapdocument_id_seq'::regclass);


--
-- Name: search_originatingcourtinformation id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_originatingcourtinformation ALTER COLUMN id SET DEFAULT nextval('public.search_originatingcourtinformation_id_seq'::regclass);


--
-- Name: search_originatingcourtinformationevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_originatingcourtinformationevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_originatingcourtinformationevent_pgh_id_seq'::regclass);


--
-- Name: search_parenthetical id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_parenthetical ALTER COLUMN id SET DEFAULT nextval('public.search_parenthetical_id_seq'::regclass);


--
-- Name: search_parentheticalgroup id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_parentheticalgroup ALTER COLUMN id SET DEFAULT nextval('public.search_parentheticalgroup_id_seq'::regclass);


--
-- Name: search_recapdocument id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocument ALTER COLUMN id SET DEFAULT nextval('public.search_recapdocument_id_seq'::regclass);


--
-- Name: search_recapdocument_tags id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocument_tags ALTER COLUMN id SET DEFAULT nextval('public.search_recapdocument_tags_id_seq'::regclass);


--
-- Name: search_recapdocumentevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocumentevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_recapdocumentevent_pgh_id_seq'::regclass);


--
-- Name: search_recapdocumenttagsevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocumenttagsevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_recapdocumenttagsevent_pgh_id_seq'::regclass);


--
-- Name: search_tag id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_tag ALTER COLUMN id SET DEFAULT nextval('public.search_tag_id_seq'::regclass);


--
-- Name: search_tagevent pgh_id; Type: DEFAULT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_tagevent ALTER COLUMN pgh_id SET DEFAULT nextval('public.search_tagevent_pgh_id_seq'::regclass);


--
-- Name: audio_audio_panel audio_audio_panel_audio_id_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audio_panel
    ADD CONSTRAINT audio_audio_panel_audio_id_judge_id_key UNIQUE (audio_id, person_id);


--
-- Name: audio_audio_panel audio_audio_panel_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audio_panel
    ADD CONSTRAINT audio_audio_panel_pkey PRIMARY KEY (id);


--
-- Name: audio_audio audio_audio_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audio
    ADD CONSTRAINT audio_audio_pkey PRIMARY KEY (id);


--
-- Name: audio_audioevent audio_audioevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audioevent
    ADD CONSTRAINT audio_audioevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: audio_audiopanelevent audio_audiopanelevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audiopanelevent
    ADD CONSTRAINT audio_audiopanelevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_abarating people_db_abarating_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_abarating
    ADD CONSTRAINT people_db_abarating_pkey PRIMARY KEY (id);


--
-- Name: people_db_abaratingevent people_db_abaratingevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_abaratingevent
    ADD CONSTRAINT people_db_abaratingevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_attorney people_db_attorney_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorney
    ADD CONSTRAINT people_db_attorney_pkey PRIMARY KEY (id);


--
-- Name: people_db_attorneyorganizationassociation people_db_attorneyorganization_attorney_id_7cda1fb15b747f5_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganizationassociation
    ADD CONSTRAINT people_db_attorneyorganization_attorney_id_7cda1fb15b747f5_uniq UNIQUE (attorney_id, attorney_organization_id, docket_id);


--
-- Name: people_db_attorneyorganization people_db_attorneyorganization_lookup_key_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganization
    ADD CONSTRAINT people_db_attorneyorganization_lookup_key_key UNIQUE (lookup_key);


--
-- Name: people_db_attorneyorganization people_db_attorneyorganization_name_6e4a7d6ba93cb6a6_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganization
    ADD CONSTRAINT people_db_attorneyorganization_name_6e4a7d6ba93cb6a6_uniq UNIQUE (name, address1, address2, city, state, zip_code);


--
-- Name: people_db_attorneyorganization people_db_attorneyorganization_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganization
    ADD CONSTRAINT people_db_attorneyorganization_pkey PRIMARY KEY (id);


--
-- Name: people_db_attorneyorganizationassociation people_db_attorneyorganizationassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganizationassociation
    ADD CONSTRAINT people_db_attorneyorganizationassociation_pkey PRIMARY KEY (id);


--
-- Name: people_db_criminalcomplaint people_db_criminalcomplaint_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_criminalcomplaint
    ADD CONSTRAINT people_db_criminalcomplaint_pkey PRIMARY KEY (id);


--
-- Name: people_db_criminalcount people_db_criminalcount_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_criminalcount
    ADD CONSTRAINT people_db_criminalcount_pkey PRIMARY KEY (id);


--
-- Name: people_db_education people_db_education_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_education
    ADD CONSTRAINT people_db_education_pkey PRIMARY KEY (id);


--
-- Name: people_db_educationevent people_db_educationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_educationevent
    ADD CONSTRAINT people_db_educationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_party people_db_party_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_party
    ADD CONSTRAINT people_db_party_pkey PRIMARY KEY (id);


--
-- Name: people_db_partytype people_db_partytype_docket_id_345b40b72c694865_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_partytype
    ADD CONSTRAINT people_db_partytype_docket_id_345b40b72c694865_uniq UNIQUE (docket_id, party_id, name);


--
-- Name: people_db_partytype people_db_partytype_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_partytype
    ADD CONSTRAINT people_db_partytype_pkey PRIMARY KEY (id);


--
-- Name: people_db_person people_db_person_fjc_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_person
    ADD CONSTRAINT people_db_person_fjc_id_key UNIQUE (fjc_id);


--
-- Name: people_db_person people_db_person_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_person
    ADD CONSTRAINT people_db_person_pkey PRIMARY KEY (id);


--
-- Name: people_db_person_race people_db_person_race_person_id_race_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_person_race
    ADD CONSTRAINT people_db_person_race_person_id_race_id_key UNIQUE (person_id, race_id);


--
-- Name: people_db_person_race people_db_person_race_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_person_race
    ADD CONSTRAINT people_db_person_race_pkey PRIMARY KEY (id);


--
-- Name: people_db_personevent people_db_personevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_personevent
    ADD CONSTRAINT people_db_personevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_personraceevent people_db_personraceevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_personraceevent
    ADD CONSTRAINT people_db_personraceevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_politicalaffiliation people_db_politicalaffiliation_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_politicalaffiliation
    ADD CONSTRAINT people_db_politicalaffiliation_pkey PRIMARY KEY (id);


--
-- Name: people_db_politicalaffiliationevent people_db_politicalaffiliationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_politicalaffiliationevent
    ADD CONSTRAINT people_db_politicalaffiliationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_position people_db_position_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_position
    ADD CONSTRAINT people_db_position_pkey PRIMARY KEY (id);


--
-- Name: people_db_positionevent people_db_positionevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_positionevent
    ADD CONSTRAINT people_db_positionevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_race people_db_race_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_race
    ADD CONSTRAINT people_db_race_pkey PRIMARY KEY (id);


--
-- Name: people_db_race people_db_race_race_50897822747d246e_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_race
    ADD CONSTRAINT people_db_race_race_50897822747d246e_uniq UNIQUE (race);


--
-- Name: people_db_raceevent people_db_raceevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_raceevent
    ADD CONSTRAINT people_db_raceevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_retentionevent people_db_retentionevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_retentionevent
    ADD CONSTRAINT people_db_retentionevent_pkey PRIMARY KEY (id);


--
-- Name: people_db_retentioneventevent people_db_retentioneventevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_retentioneventevent
    ADD CONSTRAINT people_db_retentioneventevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_role people_db_role_party_id_73709a165082400a_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_role
    ADD CONSTRAINT people_db_role_party_id_73709a165082400a_uniq UNIQUE (party_id, attorney_id, role, docket_id, date_action);


--
-- Name: people_db_role people_db_role_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_role
    ADD CONSTRAINT people_db_role_pkey PRIMARY KEY (id);


--
-- Name: people_db_school people_db_school_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_school
    ADD CONSTRAINT people_db_school_pkey PRIMARY KEY (id);


--
-- Name: people_db_schoolevent people_db_schoolevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_schoolevent
    ADD CONSTRAINT people_db_schoolevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: people_db_source people_db_source_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_source
    ADD CONSTRAINT people_db_source_pkey PRIMARY KEY (id);


--
-- Name: people_db_sourceevent people_db_sourceevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_sourceevent
    ADD CONSTRAINT people_db_sourceevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_bankruptcyinformation search_bankruptcyinformation_docket_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_bankruptcyinformation
    ADD CONSTRAINT search_bankruptcyinformation_docket_id_key UNIQUE (docket_id);


--
-- Name: search_bankruptcyinformation search_bankruptcyinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_bankruptcyinformation
    ADD CONSTRAINT search_bankruptcyinformation_pkey PRIMARY KEY (id);


--
-- Name: search_bankruptcyinformationevent search_bankruptcyinformationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_bankruptcyinformationevent
    ADD CONSTRAINT search_bankruptcyinformationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_citation search_citation_cluster_id_7a668830aad411f5_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_citation
    ADD CONSTRAINT search_citation_cluster_id_7a668830aad411f5_uniq UNIQUE (cluster_id, volume, reporter, page);


--
-- Name: search_citation search_citation_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_citation
    ADD CONSTRAINT search_citation_pkey PRIMARY KEY (id);


--
-- Name: search_citationevent search_citationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_citationevent
    ADD CONSTRAINT search_citationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_claim search_claim_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claim
    ADD CONSTRAINT search_claim_pkey PRIMARY KEY (id);


--
-- Name: search_claim_tags search_claim_tags_claim_id_tag_id_2f236693_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claim_tags
    ADD CONSTRAINT search_claim_tags_claim_id_tag_id_2f236693_uniq UNIQUE (claim_id, tag_id);


--
-- Name: search_claim_tags search_claim_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claim_tags
    ADD CONSTRAINT search_claim_tags_pkey PRIMARY KEY (id);


--
-- Name: search_claimevent search_claimevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claimevent
    ADD CONSTRAINT search_claimevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_claimhistory search_claimhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claimhistory
    ADD CONSTRAINT search_claimhistory_pkey PRIMARY KEY (id);


--
-- Name: search_claimhistoryevent search_claimhistoryevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claimhistoryevent
    ADD CONSTRAINT search_claimhistoryevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_claimtagsevent search_claimtagsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claimtagsevent
    ADD CONSTRAINT search_claimtagsevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_court_appeals_to search_court_appeals_to_from_court_id_to_court_id_006ed7af_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_court_appeals_to
    ADD CONSTRAINT search_court_appeals_to_from_court_id_to_court_id_006ed7af_uniq UNIQUE (from_court_id, to_court_id);


--
-- Name: search_court_appeals_to search_court_appeals_to_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_court_appeals_to
    ADD CONSTRAINT search_court_appeals_to_pkey PRIMARY KEY (id);


--
-- Name: search_court search_court_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_court
    ADD CONSTRAINT search_court_pkey PRIMARY KEY (id);


--
-- Name: search_court search_court_position_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_court
    ADD CONSTRAINT search_court_position_key UNIQUE ("position");


--
-- Name: search_courtappealstoevent search_courtappealstoevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_courtappealstoevent
    ADD CONSTRAINT search_courtappealstoevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_courtevent search_courtevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_courtevent
    ADD CONSTRAINT search_courtevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_courthouse search_courthouse_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_courthouse
    ADD CONSTRAINT search_courthouse_pkey PRIMARY KEY (id);


--
-- Name: search_courthouseevent search_courthouseevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_courthouseevent
    ADD CONSTRAINT search_courthouseevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_docket search_docket_docket_number_7642c6c6dbd04704_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docket_docket_number_7642c6c6dbd04704_uniq UNIQUE (docket_number, pacer_case_id, court_id);


--
-- Name: search_docket search_docket_idb_data_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docket_idb_data_id_key UNIQUE (idb_data_id);


--
-- Name: search_docket search_docket_originating_court_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docket_originating_court_id_key UNIQUE (originating_court_information_id);


--
-- Name: search_docket_panel search_docket_panel_docket_id_person_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_panel
    ADD CONSTRAINT search_docket_panel_docket_id_person_id_key UNIQUE (docket_id, person_id);


--
-- Name: search_docket_panel search_docket_panel_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_panel
    ADD CONSTRAINT search_docket_panel_pkey PRIMARY KEY (id);


--
-- Name: search_docket search_docket_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docket_pkey PRIMARY KEY (id);


--
-- Name: search_docket_tags search_docket_tags_docket_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_tags
    ADD CONSTRAINT search_docket_tags_docket_id_tag_id_key UNIQUE (docket_id, tag_id);


--
-- Name: search_docket_tags search_docket_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_tags
    ADD CONSTRAINT search_docket_tags_pkey PRIMARY KEY (id);


--
-- Name: search_docketentry search_docketentry_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentry
    ADD CONSTRAINT search_docketentry_pkey PRIMARY KEY (id);


--
-- Name: search_docketentry_tags search_docketentry_tags_docketentry_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentry_tags
    ADD CONSTRAINT search_docketentry_tags_docketentry_id_tag_id_key UNIQUE (docketentry_id, tag_id);


--
-- Name: search_docketentry_tags search_docketentry_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentry_tags
    ADD CONSTRAINT search_docketentry_tags_pkey PRIMARY KEY (id);


--
-- Name: search_docketentryevent search_docketentryevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentryevent
    ADD CONSTRAINT search_docketentryevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_docketentrytagsevent search_docketentrytagsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentrytagsevent
    ADD CONSTRAINT search_docketentrytagsevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_docketevent search_docketevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketevent
    ADD CONSTRAINT search_docketevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_docketpanelevent search_docketpanelevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketpanelevent
    ADD CONSTRAINT search_docketpanelevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_dockettagsevent search_dockettagsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_dockettagsevent
    ADD CONSTRAINT search_dockettagsevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinion_joined_by search_opinion_joined_by_opinion_id_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinion_joined_by
    ADD CONSTRAINT search_opinion_joined_by_opinion_id_judge_id_key UNIQUE (opinion_id, person_id);


--
-- Name: search_opinion_joined_by search_opinion_joined_by_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinion_joined_by
    ADD CONSTRAINT search_opinion_joined_by_pkey PRIMARY KEY (id);


--
-- Name: search_opinion search_opinion_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinion
    ADD CONSTRAINT search_opinion_pkey PRIMARY KEY (id);


--
-- Name: search_opinioncluster_non_participating_judges search_opinioncluster_non_partic_opinioncluster_id_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_non_participating_judges
    ADD CONSTRAINT search_opinioncluster_non_partic_opinioncluster_id_judge_id_key UNIQUE (opinioncluster_id, person_id);


--
-- Name: search_opinioncluster_non_participating_judges search_opinioncluster_non_participating_judges_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_non_participating_judges
    ADD CONSTRAINT search_opinioncluster_non_participating_judges_pkey PRIMARY KEY (id);


--
-- Name: search_opinioncluster_panel search_opinioncluster_panel_opinioncluster_id_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_panel
    ADD CONSTRAINT search_opinioncluster_panel_opinioncluster_id_judge_id_key UNIQUE (opinioncluster_id, person_id);


--
-- Name: search_opinioncluster_panel search_opinioncluster_panel_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_panel
    ADD CONSTRAINT search_opinioncluster_panel_pkey PRIMARY KEY (id);


--
-- Name: search_opinioncluster search_opinioncluster_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster
    ADD CONSTRAINT search_opinioncluster_pkey PRIMARY KEY (id);


--
-- Name: search_opinionclusterevent search_opinionclusterevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionclusterevent
    ADD CONSTRAINT search_opinionclusterevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionclusternonparticipatingjudgesevent search_opinionclusternonparticipatingjudgesevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionclusternonparticipatingjudgesevent
    ADD CONSTRAINT search_opinionclusternonparticipatingjudgesevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionclusterpanelevent search_opinionclusterpanelevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionclusterpanelevent
    ADD CONSTRAINT search_opinionclusterpanelevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionevent search_opinionevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionevent
    ADD CONSTRAINT search_opinionevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionjoinedbyevent search_opinionjoinedbyevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionjoinedbyevent
    ADD CONSTRAINT search_opinionjoinedbyevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_opinionscited search_opinionscited_citing_opinion_id_7165e96b2aed974f_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscited
    ADD CONSTRAINT search_opinionscited_citing_opinion_id_7165e96b2aed974f_uniq UNIQUE (citing_opinion_id, cited_opinion_id);


--
-- Name: search_opinionscited search_opinionscited_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscited
    ADD CONSTRAINT search_opinionscited_pkey PRIMARY KEY (id);


--
-- Name: search_opinionscitedbyrecapdocument search_opinionscitedbyre_citing_document_id_cited_0c621cfd_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscitedbyrecapdocument
    ADD CONSTRAINT search_opinionscitedbyre_citing_document_id_cited_0c621cfd_uniq UNIQUE (citing_document_id, cited_opinion_id);


--
-- Name: search_opinionscitedbyrecapdocument search_opinionscitedbyrecapdocument_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscitedbyrecapdocument
    ADD CONSTRAINT search_opinionscitedbyrecapdocument_pkey PRIMARY KEY (id);


--
-- Name: search_originatingcourtinformation search_originatingcourtinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_originatingcourtinformation
    ADD CONSTRAINT search_originatingcourtinformation_pkey PRIMARY KEY (id);


--
-- Name: search_originatingcourtinformationevent search_originatingcourtinformationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_originatingcourtinformationevent
    ADD CONSTRAINT search_originatingcourtinformationevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_parenthetical search_parenthetical_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_parenthetical
    ADD CONSTRAINT search_parenthetical_pkey PRIMARY KEY (id);


--
-- Name: search_parentheticalgroup search_parentheticalgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_parentheticalgroup
    ADD CONSTRAINT search_parentheticalgroup_pkey PRIMARY KEY (id);


--
-- Name: search_recapdocument search_recapdocument_docket_entry_id_37b2f4ece60cde00_uniq; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocument
    ADD CONSTRAINT search_recapdocument_docket_entry_id_37b2f4ece60cde00_uniq UNIQUE (docket_entry_id, document_number, attachment_number);


--
-- Name: search_recapdocument search_recapdocument_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocument
    ADD CONSTRAINT search_recapdocument_pkey PRIMARY KEY (id);


--
-- Name: search_recapdocument_tags search_recapdocument_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocument_tags
    ADD CONSTRAINT search_recapdocument_tags_pkey PRIMARY KEY (id);


--
-- Name: search_recapdocument_tags search_recapdocument_tags_recapdocument_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocument_tags
    ADD CONSTRAINT search_recapdocument_tags_recapdocument_id_tag_id_key UNIQUE (recapdocument_id, tag_id);


--
-- Name: search_recapdocumentevent search_recapdocumentevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocumentevent
    ADD CONSTRAINT search_recapdocumentevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_recapdocumenttagsevent search_recapdocumenttagsevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocumenttagsevent
    ADD CONSTRAINT search_recapdocumenttagsevent_pkey PRIMARY KEY (pgh_id);


--
-- Name: search_tag search_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_tag
    ADD CONSTRAINT search_tag_name_key UNIQUE (name);


--
-- Name: search_tag search_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_tag
    ADD CONSTRAINT search_tag_pkey PRIMARY KEY (id);


--
-- Name: search_tagevent search_tagevent_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_tagevent
    ADD CONSTRAINT search_tagevent_pkey PRIMARY KEY (pgh_id);

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------
---------- INDEX BELOW
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--
-- Name: audio_audio_03b47046; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_03b47046 ON public.audio_audio USING btree (local_path_original_file);

--
-- Name: audio_audio_0b869b2f; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_0b869b2f ON public.audio_audio USING btree (date_blocked);
--
-- Name: audio_audio_1427d4ab; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_1427d4ab ON public.audio_audio USING btree (docket_id);
--
-- Name: audio_audio_1cbcfc0f; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_1cbcfc0f ON public.audio_audio USING btree (download_url);
--
-- Name: audio_audio_41ddbca9; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_41ddbca9 ON public.audio_audio USING btree (local_path_mp3);
--
-- Name: audio_audio_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_5fdb3d66 ON public.audio_audio USING btree (date_modified);
--
-- Name: audio_audio_61326117; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_61326117 ON public.audio_audio USING btree (blocked);
--
-- Name: audio_audio_74a89174; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_74a89174 ON public.audio_audio USING btree (sha1);
--
-- Name: audio_audio_c69e55a4; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_c69e55a4 ON public.audio_audio USING btree (date_created);
--
-- Name: audio_audio_download_url_44408fffeee4f71b_like; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_download_url_44408fffeee4f71b_like ON public.audio_audio USING btree (download_url varchar_pattern_ops);
--
-- Name: audio_audio_local_path_mp3_11f796e4872a9bad_like; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_local_path_mp3_11f796e4872a9bad_like ON public.audio_audio USING btree (local_path_mp3 varchar_pattern_ops);
--
-- Name: audio_audio_local_path_original_file_102ce483dde8495d_like; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_local_path_original_file_102ce483dde8495d_like ON public.audio_audio USING btree (local_path_original_file varchar_pattern_ops);
--
-- Name: audio_audio_panel_26f6023f; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_panel_26f6023f ON public.audio_audio_panel USING btree (audio_id);
--
-- Name: audio_audio_panel_e7c5d788; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_panel_e7c5d788 ON public.audio_audio_panel USING btree (person_id);
--
-- Name: audio_audio_sha1_2510d5a8f56f35d4_like; Type: INDEX; Schema: public; Owner: david
--
CREATE INDEX audio_audio_sha1_2510d5a8f56f35d4_like ON public.audio_audio USING btree (sha1 varchar_pattern_ops);



--
-- Name: audio_audioevent_docket_id_d4acad63; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX audio_audioevent_docket_id_d4acad63 ON public.audio_audioevent USING btree (docket_id);


--
-- Name: audio_audioevent_pgh_context_id_f695da7c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX audio_audioevent_pgh_context_id_f695da7c ON public.audio_audioevent USING btree (pgh_context_id);


--
-- Name: audio_audioevent_pgh_obj_id_d4cc0c20; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX audio_audioevent_pgh_obj_id_d4cc0c20 ON public.audio_audioevent USING btree (pgh_obj_id);


--
-- Name: audio_audiopanelevent_audio_id_3aab9feb; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX audio_audiopanelevent_audio_id_3aab9feb ON public.audio_audiopanelevent USING btree (audio_id);


--
-- Name: audio_audiopanelevent_person_id_0280e6c8; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX audio_audiopanelevent_person_id_0280e6c8 ON public.audio_audiopanelevent USING btree (person_id);


--
-- Name: audio_audiopanelevent_pgh_context_id_5c5401fc; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX audio_audiopanelevent_pgh_context_id_5c5401fc ON public.audio_audiopanelevent USING btree (pgh_context_id);


--
-- Name: district_court_docket_lookup_idx; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX district_court_docket_lookup_idx ON public.search_docket USING btree (court_id, docket_number_core, pacer_case_id);


--
-- Name: people_db_abarating_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_abarating_5fdb3d66 ON public.people_db_abarating USING btree (date_modified);


--
-- Name: people_db_abarating_a8452ca7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_abarating_a8452ca7 ON public.people_db_abarating USING btree (person_id);


--
-- Name: people_db_abarating_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_abarating_c69e55a4 ON public.people_db_abarating USING btree (date_created);


--
-- Name: people_db_abaratingevent_person_id_976485e8; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_abaratingevent_person_id_976485e8 ON public.people_db_abaratingevent USING btree (person_id);


--
-- Name: people_db_abaratingevent_pgh_context_id_60d3496a; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_abaratingevent_pgh_context_id_60d3496a ON public.people_db_abaratingevent USING btree (pgh_context_id);


--
-- Name: people_db_abaratingevent_pgh_obj_id_0e6a9bc3; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_abaratingevent_pgh_obj_id_0e6a9bc3 ON public.people_db_abaratingevent USING btree (pgh_obj_id);


--
-- Name: people_db_attorney_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorney_5fdb3d66 ON public.people_db_attorney USING btree (date_modified);


--
-- Name: people_db_attorney_b068931c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorney_b068931c ON public.people_db_attorney USING btree (name);


--
-- Name: people_db_attorney_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorney_c69e55a4 ON public.people_db_attorney USING btree (date_created);


--
-- Name: people_db_attorney_name_46d318a02757f6dd_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorney_name_46d318a02757f6dd_like ON public.people_db_attorney USING btree (name text_pattern_ops);


--
-- Name: people_db_attorneyorganization_0c0ae404; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_0c0ae404 ON public.people_db_attorneyorganization USING btree (zip_code);


--
-- Name: people_db_attorneyorganization_4ed5d2ea; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_4ed5d2ea ON public.people_db_attorneyorganization USING btree (city);


--
-- Name: people_db_attorneyorganization_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_5fdb3d66 ON public.people_db_attorneyorganization USING btree (date_modified);


--
-- Name: people_db_attorneyorganization_81e70cb1; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_81e70cb1 ON public.people_db_attorneyorganization USING btree (address1);


--
-- Name: people_db_attorneyorganization_9ed39e2e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_9ed39e2e ON public.people_db_attorneyorganization USING btree (state);


--
-- Name: people_db_attorneyorganization_address1_403814857b548870_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_address1_403814857b548870_like ON public.people_db_attorneyorganization USING btree (address1 text_pattern_ops);


--
-- Name: people_db_attorneyorganization_address2_403814857b4403d3_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_address2_403814857b4403d3_like ON public.people_db_attorneyorganization USING btree (address2 text_pattern_ops);


--
-- Name: people_db_attorneyorganization_b068931c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_b068931c ON public.people_db_attorneyorganization USING btree (name);


--
-- Name: people_db_attorneyorganization_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_c69e55a4 ON public.people_db_attorneyorganization USING btree (date_created);


--
-- Name: people_db_attorneyorganization_city_2a5498a19c997008_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_city_2a5498a19c997008_like ON public.people_db_attorneyorganization USING btree (city text_pattern_ops);


--
-- Name: people_db_attorneyorganization_f669f8e9; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_f669f8e9 ON public.people_db_attorneyorganization USING btree (address2);


--
-- Name: people_db_attorneyorganization_lookup_key_4723770634841e39_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_lookup_key_4723770634841e39_like ON public.people_db_attorneyorganization USING btree (lookup_key text_pattern_ops);


--
-- Name: people_db_attorneyorganization_name_eddcefc5b671344_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_name_eddcefc5b671344_like ON public.people_db_attorneyorganization USING btree (name text_pattern_ops);


--
-- Name: people_db_attorneyorganization_state_18fe99f5bf671255_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_state_18fe99f5bf671255_like ON public.people_db_attorneyorganization USING btree (state varchar_pattern_ops);


--
-- Name: people_db_attorneyorganization_zip_code_66632293e4093e4e_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganization_zip_code_66632293e4093e4e_like ON public.people_db_attorneyorganization USING btree (zip_code varchar_pattern_ops);


--
-- Name: people_db_attorneyorganizationassociation_1427d4ab; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganizationassociation_1427d4ab ON public.people_db_attorneyorganizationassociation USING btree (docket_id);


--
-- Name: people_db_attorneyorganizationassociation_9f99f769; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganizationassociation_9f99f769 ON public.people_db_attorneyorganizationassociation USING btree (attorney_id);


--
-- Name: people_db_attorneyorganizationassociation_a2c8783d; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_attorneyorganizationassociation_a2c8783d ON public.people_db_attorneyorganizationassociation USING btree (attorney_organization_id);


--
-- Name: people_db_criminalcomplaint_4edc179c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_criminalcomplaint_4edc179c ON public.people_db_criminalcomplaint USING btree (party_type_id);


--
-- Name: people_db_criminalcount_4edc179c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_criminalcount_4edc179c ON public.people_db_criminalcount USING btree (party_type_id);


--
-- Name: people_db_education_5fc7164b; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_education_5fc7164b ON public.people_db_education USING btree (school_id);


--
-- Name: people_db_education_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_education_5fdb3d66 ON public.people_db_education USING btree (date_modified);


--
-- Name: people_db_education_a8452ca7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_education_a8452ca7 ON public.people_db_education USING btree (person_id);


--
-- Name: people_db_education_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_education_c69e55a4 ON public.people_db_education USING btree (date_created);


--
-- Name: people_db_educationevent_person_id_86892be3; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_educationevent_person_id_86892be3 ON public.people_db_educationevent USING btree (person_id);


--
-- Name: people_db_educationevent_pgh_context_id_93dac561; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_educationevent_pgh_context_id_93dac561 ON public.people_db_educationevent USING btree (pgh_context_id);


--
-- Name: people_db_educationevent_pgh_obj_id_242c5dea; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_educationevent_pgh_obj_id_242c5dea ON public.people_db_educationevent USING btree (pgh_obj_id);


--
-- Name: people_db_educationevent_school_id_5d83b038; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_educationevent_school_id_5d83b038 ON public.people_db_educationevent USING btree (school_id);


--
-- Name: people_db_party_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_party_5fdb3d66 ON public.people_db_party USING btree (date_modified);


--
-- Name: people_db_party_b068931c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_party_b068931c ON public.people_db_party USING btree (name);


--
-- Name: people_db_party_bb2cb5a6; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_party_bb2cb5a6 ON public.people_db_party USING btree (extra_info);


--
-- Name: people_db_party_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_party_c69e55a4 ON public.people_db_party USING btree (date_created);


--
-- Name: people_db_party_extra_info_7a50cbcc44fd5d7a_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_party_extra_info_7a50cbcc44fd5d7a_like ON public.people_db_party USING btree (extra_info text_pattern_ops);


--
-- Name: people_db_party_name_3d12b76fe7f0ae1c_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_party_name_3d12b76fe7f0ae1c_like ON public.people_db_party USING btree (name text_pattern_ops);


--
-- Name: people_db_partytype_1427d4ab; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_partytype_1427d4ab ON public.people_db_partytype USING btree (docket_id);


--
-- Name: people_db_partytype_2c662395; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_partytype_2c662395 ON public.people_db_partytype USING btree (party_id);


--
-- Name: people_db_partytype_b068931c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_partytype_b068931c ON public.people_db_partytype USING btree (name);


--
-- Name: people_db_partytype_bb2cb5a6; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_partytype_bb2cb5a6 ON public.people_db_partytype USING btree (extra_info);


--
-- Name: people_db_partytype_name_4cb81702de26fee8_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_partytype_name_4cb81702de26fee8_like ON public.people_db_partytype USING btree (name varchar_pattern_ops);


--
-- Name: people_db_person_2dbcba41; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_2dbcba41 ON public.people_db_person USING btree (slug);


--
-- Name: people_db_person_3c6ec45e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_3c6ec45e ON public.people_db_person USING btree (is_alias_of_id);


--
-- Name: people_db_person_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_5fdb3d66 ON public.people_db_person USING btree (date_modified);


--
-- Name: people_db_person_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_c69e55a4 ON public.people_db_person USING btree (date_created);


--
-- Name: people_db_person_c943ec03; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_c943ec03 ON public.people_db_person USING btree (name_last);


--
-- Name: people_db_person_e489b049; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_e489b049 ON public.people_db_person USING btree (ftm_total_received);


--
-- Name: people_db_person_name_last_2c38f190d58b7eba_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_name_last_2c38f190d58b7eba_like ON public.people_db_person USING btree (name_last varchar_pattern_ops);


--
-- Name: people_db_person_race_3f2f3687; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_race_3f2f3687 ON public.people_db_person_race USING btree (race_id);


--
-- Name: people_db_person_race_a8452ca7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_race_a8452ca7 ON public.people_db_person_race USING btree (person_id);


--
-- Name: people_db_person_slug_10074d278f243e42_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_person_slug_10074d278f243e42_like ON public.people_db_person USING btree (slug varchar_pattern_ops);


--
-- Name: people_db_personevent_is_alias_of_id_dff0de5e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_personevent_is_alias_of_id_dff0de5e ON public.people_db_personevent USING btree (is_alias_of_id);


--
-- Name: people_db_personevent_pgh_context_id_8c18edc2; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_personevent_pgh_context_id_8c18edc2 ON public.people_db_personevent USING btree (pgh_context_id);


--
-- Name: people_db_personevent_pgh_obj_id_3a44721c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_personevent_pgh_obj_id_3a44721c ON public.people_db_personevent USING btree (pgh_obj_id);


--
-- Name: people_db_personraceevent_person_id_000fffe6; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_personraceevent_person_id_000fffe6 ON public.people_db_personraceevent USING btree (person_id);


--
-- Name: people_db_personraceevent_pgh_context_id_6e61479f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_personraceevent_pgh_context_id_6e61479f ON public.people_db_personraceevent USING btree (pgh_context_id);


--
-- Name: people_db_personraceevent_race_id_ec19c576; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_personraceevent_race_id_ec19c576 ON public.people_db_personraceevent USING btree (race_id);


--
-- Name: people_db_politicalaffiliation_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_politicalaffiliation_5fdb3d66 ON public.people_db_politicalaffiliation USING btree (date_modified);


--
-- Name: people_db_politicalaffiliation_a8452ca7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_politicalaffiliation_a8452ca7 ON public.people_db_politicalaffiliation USING btree (person_id);


--
-- Name: people_db_politicalaffiliation_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_politicalaffiliation_c69e55a4 ON public.people_db_politicalaffiliation USING btree (date_created);


--
-- Name: people_db_politicalaffiliationevent_person_id_968b07ce; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_politicalaffiliationevent_person_id_968b07ce ON public.people_db_politicalaffiliationevent USING btree (person_id);


--
-- Name: people_db_politicalaffiliationevent_pgh_context_id_dfbcdb75; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_politicalaffiliationevent_pgh_context_id_dfbcdb75 ON public.people_db_politicalaffiliationevent USING btree (pgh_context_id);


--
-- Name: people_db_politicalaffiliationevent_pgh_obj_id_c98e3cf6; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_politicalaffiliationevent_pgh_obj_id_c98e3cf6 ON public.people_db_politicalaffiliationevent USING btree (pgh_obj_id);


--
-- Name: people_db_position_0ce67364; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_0ce67364 ON public.people_db_position USING btree (date_start);


--
-- Name: people_db_position_1301727a; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_1301727a ON public.people_db_position USING btree (date_elected);


--
-- Name: people_db_position_22b8ff35; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_22b8ff35 ON public.people_db_position USING btree (appointer_id);


--
-- Name: people_db_position_2a1c0b55; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_2a1c0b55 ON public.people_db_position USING btree (date_confirmation);


--
-- Name: people_db_position_43e12164; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_43e12164 ON public.people_db_position USING btree (date_judicial_committee_action);


--
-- Name: people_db_position_5fc7164b; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_5fc7164b ON public.people_db_position USING btree (school_id);


--
-- Name: people_db_position_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_5fdb3d66 ON public.people_db_position USING btree (date_modified);


--
-- Name: people_db_position_7a183bc6; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_7a183bc6 ON public.people_db_position USING btree (date_recess_appointment);


--
-- Name: people_db_position_7a46e69c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_7a46e69c ON public.people_db_position USING btree (court_id);


--
-- Name: people_db_position_a2289cae; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_a2289cae ON public.people_db_position USING btree (date_referred_to_judicial_committee);


--
-- Name: people_db_position_a7ad19f8; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_a7ad19f8 ON public.people_db_position USING btree (date_nominated);


--
-- Name: people_db_position_a8452ca7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_a8452ca7 ON public.people_db_position USING btree (person_id);


--
-- Name: people_db_position_a9962d2d; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_a9962d2d ON public.people_db_position USING btree (date_retirement);


--
-- Name: people_db_position_b070f947; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_b070f947 ON public.people_db_position USING btree (predecessor_id);


--
-- Name: people_db_position_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_c69e55a4 ON public.people_db_position USING btree (date_created);


--
-- Name: people_db_position_court_id_7141eee9b516a894_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_court_id_7141eee9b516a894_like ON public.people_db_position USING btree (court_id varchar_pattern_ops);


--
-- Name: people_db_position_d32bfe21; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_d32bfe21 ON public.people_db_position USING btree (date_termination);


--
-- Name: people_db_position_eae0a89e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_eae0a89e ON public.people_db_position USING btree (supervisor_id);


--
-- Name: people_db_position_ed551732; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_position_ed551732 ON public.people_db_position USING btree (date_hearing);


--
-- Name: people_db_positionevent_appointer_id_9a1a141d; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_positionevent_appointer_id_9a1a141d ON public.people_db_positionevent USING btree (appointer_id);


--
-- Name: people_db_positionevent_court_id_c27f27bf; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_positionevent_court_id_c27f27bf ON public.people_db_positionevent USING btree (court_id);


--
-- Name: people_db_positionevent_court_id_c27f27bf_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_positionevent_court_id_c27f27bf_like ON public.people_db_positionevent USING btree (court_id varchar_pattern_ops);


--
-- Name: people_db_positionevent_person_id_b48e5d5c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_positionevent_person_id_b48e5d5c ON public.people_db_positionevent USING btree (person_id);


--
-- Name: people_db_positionevent_pgh_context_id_91818e04; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_positionevent_pgh_context_id_91818e04 ON public.people_db_positionevent USING btree (pgh_context_id);


--
-- Name: people_db_positionevent_pgh_obj_id_e37b1a99; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_positionevent_pgh_obj_id_e37b1a99 ON public.people_db_positionevent USING btree (pgh_obj_id);


--
-- Name: people_db_positionevent_predecessor_id_a183a0e5; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_positionevent_predecessor_id_a183a0e5 ON public.people_db_positionevent USING btree (predecessor_id);


--
-- Name: people_db_positionevent_school_id_8435314e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_positionevent_school_id_8435314e ON public.people_db_positionevent USING btree (school_id);


--
-- Name: people_db_positionevent_supervisor_id_d1b31dbb; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_positionevent_supervisor_id_d1b31dbb ON public.people_db_positionevent USING btree (supervisor_id);


--
-- Name: people_db_raceevent_pgh_context_id_590006cf; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_raceevent_pgh_context_id_590006cf ON public.people_db_raceevent USING btree (pgh_context_id);


--
-- Name: people_db_raceevent_pgh_obj_id_f7ec57e8; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_raceevent_pgh_obj_id_f7ec57e8 ON public.people_db_raceevent USING btree (pgh_obj_id);


--
-- Name: people_db_retentionevent_4e6b5ce9; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_retentionevent_4e6b5ce9 ON public.people_db_retentionevent USING btree (date_retention);


--
-- Name: people_db_retentionevent_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_retentionevent_5fdb3d66 ON public.people_db_retentionevent USING btree (date_modified);


--
-- Name: people_db_retentionevent_bce5bd07; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_retentionevent_bce5bd07 ON public.people_db_retentionevent USING btree (position_id);


--
-- Name: people_db_retentionevent_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_retentionevent_c69e55a4 ON public.people_db_retentionevent USING btree (date_created);


--
-- Name: people_db_retentioneventevent_pgh_context_id_81f7850b; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_retentioneventevent_pgh_context_id_81f7850b ON public.people_db_retentioneventevent USING btree (pgh_context_id);


--
-- Name: people_db_retentioneventevent_pgh_obj_id_902d74ea; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_retentioneventevent_pgh_obj_id_902d74ea ON public.people_db_retentioneventevent USING btree (pgh_obj_id);


--
-- Name: people_db_retentioneventevent_position_id_96c16566; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_retentioneventevent_position_id_96c16566 ON public.people_db_retentioneventevent USING btree (position_id);


--
-- Name: people_db_role_1427d4ab; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_role_1427d4ab ON public.people_db_role USING btree (docket_id);


--
-- Name: people_db_role_29a7e964; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_role_29a7e964 ON public.people_db_role USING btree (role);


--
-- Name: people_db_role_2c662395; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_role_2c662395 ON public.people_db_role USING btree (party_id);


--
-- Name: people_db_role_9f99f769; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_role_9f99f769 ON public.people_db_role USING btree (attorney_id);


--
-- Name: people_db_school_3c6ec45e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_school_3c6ec45e ON public.people_db_school USING btree (is_alias_of_id);


--
-- Name: people_db_school_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_school_5fdb3d66 ON public.people_db_school USING btree (date_modified);


--
-- Name: people_db_school_b068931c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_school_b068931c ON public.people_db_school USING btree (name);


--
-- Name: people_db_school_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_school_c69e55a4 ON public.people_db_school USING btree (date_created);


--
-- Name: people_db_school_ffef75ef; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_school_ffef75ef ON public.people_db_school USING btree (ein);


--
-- Name: people_db_school_name_55359da037ff6cd5_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_school_name_55359da037ff6cd5_like ON public.people_db_school USING btree (name varchar_pattern_ops);


--
-- Name: people_db_schoolevent_is_alias_of_id_4c4332d7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_schoolevent_is_alias_of_id_4c4332d7 ON public.people_db_schoolevent USING btree (is_alias_of_id);


--
-- Name: people_db_schoolevent_pgh_context_id_b32512bd; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_schoolevent_pgh_context_id_b32512bd ON public.people_db_schoolevent USING btree (pgh_context_id);


--
-- Name: people_db_schoolevent_pgh_obj_id_57bf2a67; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_schoolevent_pgh_obj_id_57bf2a67 ON public.people_db_schoolevent USING btree (pgh_obj_id);


--
-- Name: people_db_source_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_source_5fdb3d66 ON public.people_db_source USING btree (date_modified);


--
-- Name: people_db_source_a8452ca7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_source_a8452ca7 ON public.people_db_source USING btree (person_id);


--
-- Name: people_db_source_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_source_c69e55a4 ON public.people_db_source USING btree (date_created);


--
-- Name: people_db_sourceevent_person_id_f32cf8b3; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_sourceevent_person_id_f32cf8b3 ON public.people_db_sourceevent USING btree (person_id);


--
-- Name: people_db_sourceevent_pgh_context_id_6bf9fb8f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_sourceevent_pgh_context_id_6bf9fb8f ON public.people_db_sourceevent USING btree (pgh_context_id);


--
-- Name: people_db_sourceevent_pgh_obj_id_c37b1d95; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX people_db_sourceevent_pgh_obj_id_c37b1d95 ON public.people_db_sourceevent USING btree (pgh_obj_id);


--
-- Name: search_bankruptcyinformation_date_created_60f180b0; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_bankruptcyinformation_date_created_60f180b0 ON public.search_bankruptcyinformation USING btree (date_created);


--
-- Name: search_bankruptcyinformation_date_modified_c1b76dd9; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_bankruptcyinformation_date_modified_c1b76dd9 ON public.search_bankruptcyinformation USING btree (date_modified);


--
-- Name: search_bankruptcyinformationevent_docket_id_e6ca7d29; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_bankruptcyinformationevent_docket_id_e6ca7d29 ON public.search_bankruptcyinformationevent USING btree (docket_id);


--
-- Name: search_bankruptcyinformationevent_pgh_context_id_5e7bd505; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_bankruptcyinformationevent_pgh_context_id_5e7bd505 ON public.search_bankruptcyinformationevent USING btree (pgh_context_id);


--
-- Name: search_bankruptcyinformationevent_pgh_obj_id_73c1db25; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_bankruptcyinformationevent_pgh_obj_id_73c1db25 ON public.search_bankruptcyinformationevent USING btree (pgh_obj_id);


--
-- Name: search_cita_volume_464334_idx; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_cita_volume_464334_idx ON public.search_citation USING btree (volume, reporter);


--
-- Name: search_cita_volume_92c344_idx; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_cita_volume_92c344_idx ON public.search_citation USING btree (volume, reporter, page);


--
-- Name: search_citation_966557f0; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_citation_966557f0 ON public.search_citation USING btree (reporter);


--
-- Name: search_citation_a97b1c12; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_citation_a97b1c12 ON public.search_citation USING btree (cluster_id);


--
-- Name: search_citation_reporter_1b48f47a0886ffdd_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_citation_reporter_1b48f47a0886ffdd_like ON public.search_citation USING btree (reporter text_pattern_ops);


--
-- Name: search_citationevent_cluster_id_3cc4bdde; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_citationevent_cluster_id_3cc4bdde ON public.search_citationevent USING btree (cluster_id);


--
-- Name: search_citationevent_pgh_context_id_a721796b; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_citationevent_pgh_context_id_a721796b ON public.search_citationevent USING btree (pgh_context_id);


--
-- Name: search_citationevent_pgh_obj_id_74bef0e4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_citationevent_pgh_obj_id_74bef0e4 ON public.search_citationevent USING btree (pgh_obj_id);


--
-- Name: search_claim_claim_number_263236b3; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claim_claim_number_263236b3 ON public.search_claim USING btree (claim_number);


--
-- Name: search_claim_claim_number_263236b3_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claim_claim_number_263236b3_like ON public.search_claim USING btree (claim_number varchar_pattern_ops);


--
-- Name: search_claim_date_created_8c2e998c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claim_date_created_8c2e998c ON public.search_claim USING btree (date_created);


--
-- Name: search_claim_date_modified_f38130a2; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claim_date_modified_f38130a2 ON public.search_claim USING btree (date_modified);


--
-- Name: search_claim_docket_id_b37171a9; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claim_docket_id_b37171a9 ON public.search_claim USING btree (docket_id);


--
-- Name: search_claim_tags_claim_id_2cf554b5; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claim_tags_claim_id_2cf554b5 ON public.search_claim_tags USING btree (claim_id);


--
-- Name: search_claim_tags_tag_id_73b6bd4d; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claim_tags_tag_id_73b6bd4d ON public.search_claim_tags USING btree (tag_id);


--
-- Name: search_claimevent_docket_id_b016b91c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimevent_docket_id_b016b91c ON public.search_claimevent USING btree (docket_id);


--
-- Name: search_claimevent_pgh_context_id_421c9863; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimevent_pgh_context_id_421c9863 ON public.search_claimevent USING btree (pgh_context_id);


--
-- Name: search_claimevent_pgh_obj_id_eb8bb005; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimevent_pgh_obj_id_eb8bb005 ON public.search_claimevent USING btree (pgh_obj_id);


--
-- Name: search_claimhistory_claim_id_e130e572; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimhistory_claim_id_e130e572 ON public.search_claimhistory USING btree (claim_id);


--
-- Name: search_claimhistory_date_created_586d545e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimhistory_date_created_586d545e ON public.search_claimhistory USING btree (date_created);


--
-- Name: search_claimhistory_date_modified_5f6ec339; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimhistory_date_modified_5f6ec339 ON public.search_claimhistory USING btree (date_modified);


--
-- Name: search_claimhistory_document_number_6316c155; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimhistory_document_number_6316c155 ON public.search_claimhistory USING btree (document_number);


--
-- Name: search_claimhistory_document_number_6316c155_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimhistory_document_number_6316c155_like ON public.search_claimhistory USING btree (document_number varchar_pattern_ops);


--
-- Name: search_claimhistory_is_free_on_pacer_81332a2c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimhistory_is_free_on_pacer_81332a2c ON public.search_claimhistory USING btree (is_free_on_pacer);


--
-- Name: search_claimhistoryevent_claim_id_a256e51f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimhistoryevent_claim_id_a256e51f ON public.search_claimhistoryevent USING btree (claim_id);


--
-- Name: search_claimhistoryevent_pgh_context_id_fbccd42a; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimhistoryevent_pgh_context_id_fbccd42a ON public.search_claimhistoryevent USING btree (pgh_context_id);


--
-- Name: search_claimhistoryevent_pgh_obj_id_51dc3876; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimhistoryevent_pgh_obj_id_51dc3876 ON public.search_claimhistoryevent USING btree (pgh_obj_id);


--
-- Name: search_claimtagsevent_claim_id_34146335; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimtagsevent_claim_id_34146335 ON public.search_claimtagsevent USING btree (claim_id);


--
-- Name: search_claimtagsevent_pgh_context_id_bb236d3a; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimtagsevent_pgh_context_id_bb236d3a ON public.search_claimtagsevent USING btree (pgh_context_id);


--
-- Name: search_claimtagsevent_tag_id_fdeb7331; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_claimtagsevent_tag_id_fdeb7331 ON public.search_claimtagsevent USING btree (tag_id);


--
-- Name: search_court_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_court_5fdb3d66 ON public.search_court USING btree (date_modified);


--
-- Name: search_court_appeals_to_from_court_id_fb09cc1a; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_court_appeals_to_from_court_id_fb09cc1a ON public.search_court_appeals_to USING btree (from_court_id);


--
-- Name: search_court_appeals_to_from_court_id_fb09cc1a_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_court_appeals_to_from_court_id_fb09cc1a_like ON public.search_court_appeals_to USING btree (from_court_id varchar_pattern_ops);


--
-- Name: search_court_appeals_to_to_court_id_49ac3d9c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_court_appeals_to_to_court_id_49ac3d9c ON public.search_court_appeals_to USING btree (to_court_id);


--
-- Name: search_court_appeals_to_to_court_id_49ac3d9c_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_court_appeals_to_to_court_id_49ac3d9c_like ON public.search_court_appeals_to USING btree (to_court_id varchar_pattern_ops);


--
-- Name: search_court_id_28e1a61bd5ca39cc_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_court_id_28e1a61bd5ca39cc_like ON public.search_court USING btree (id varchar_pattern_ops);


--
-- Name: search_court_parent_court_id_51ba1d28; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_court_parent_court_id_51ba1d28 ON public.search_court USING btree (parent_court_id);


--
-- Name: search_court_parent_court_id_51ba1d28_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_court_parent_court_id_51ba1d28_like ON public.search_court USING btree (parent_court_id varchar_pattern_ops);


--
-- Name: search_courtappealstoevent_from_court_id_75784b8f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtappealstoevent_from_court_id_75784b8f ON public.search_courtappealstoevent USING btree (from_court_id);


--
-- Name: search_courtappealstoevent_from_court_id_75784b8f_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtappealstoevent_from_court_id_75784b8f_like ON public.search_courtappealstoevent USING btree (from_court_id varchar_pattern_ops);


--
-- Name: search_courtappealstoevent_pgh_context_id_e65511b3; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtappealstoevent_pgh_context_id_e65511b3 ON public.search_courtappealstoevent USING btree (pgh_context_id);


--
-- Name: search_courtappealstoevent_to_court_id_5540ee1b; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtappealstoevent_to_court_id_5540ee1b ON public.search_courtappealstoevent USING btree (to_court_id);


--
-- Name: search_courtappealstoevent_to_court_id_5540ee1b_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtappealstoevent_to_court_id_5540ee1b_like ON public.search_courtappealstoevent USING btree (to_court_id varchar_pattern_ops);


--
-- Name: search_courtevent_parent_court_id_342036cc; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtevent_parent_court_id_342036cc ON public.search_courtevent USING btree (parent_court_id);


--
-- Name: search_courtevent_parent_court_id_342036cc_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtevent_parent_court_id_342036cc_like ON public.search_courtevent USING btree (parent_court_id varchar_pattern_ops);


--
-- Name: search_courtevent_pgh_context_id_7a93b57e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtevent_pgh_context_id_7a93b57e ON public.search_courtevent USING btree (pgh_context_id);


--
-- Name: search_courtevent_pgh_obj_id_a86c8348; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtevent_pgh_obj_id_a86c8348 ON public.search_courtevent USING btree (pgh_obj_id);


--
-- Name: search_courtevent_pgh_obj_id_a86c8348_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courtevent_pgh_obj_id_a86c8348_like ON public.search_courtevent USING btree (pgh_obj_id varchar_pattern_ops);


--
-- Name: search_courthouse_court_id_6528f572; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courthouse_court_id_6528f572 ON public.search_courthouse USING btree (court_id);


--
-- Name: search_courthouse_court_id_6528f572_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courthouse_court_id_6528f572_like ON public.search_courthouse USING btree (court_id varchar_pattern_ops);


--
-- Name: search_courthouseevent_court_id_ecdd5b8a; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courthouseevent_court_id_ecdd5b8a ON public.search_courthouseevent USING btree (court_id);


--
-- Name: search_courthouseevent_court_id_ecdd5b8a_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courthouseevent_court_id_ecdd5b8a_like ON public.search_courthouseevent USING btree (court_id varchar_pattern_ops);


--
-- Name: search_courthouseevent_pgh_context_id_affccfe3; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courthouseevent_pgh_context_id_affccfe3 ON public.search_courthouseevent USING btree (pgh_context_id);


--
-- Name: search_courthouseevent_pgh_obj_id_2bdd6824; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_courthouseevent_pgh_obj_id_2bdd6824 ON public.search_courthouseevent USING btree (pgh_obj_id);


--
-- Name: search_dock_court_i_a043ae_idx; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_dock_court_i_a043ae_idx ON public.search_docket USING btree (court_id, id);


--
-- Name: search_dock_recap_s_306ab9_idx; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_dock_recap_s_306ab9_idx ON public.search_docketentry USING btree (recap_sequence_number, entry_number);


--
-- Name: search_docket_02c1725c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_02c1725c ON public.search_docket USING btree (assigned_to_id);


--
-- Name: search_docket_0b869b2f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_0b869b2f ON public.search_docket USING btree (date_blocked);


--
-- Name: search_docket_34894a03; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_34894a03 ON public.search_docket USING btree (pacer_case_id);


--
-- Name: search_docket_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_5fdb3d66 ON public.search_docket USING btree (date_modified);


--
-- Name: search_docket_64cdae4d; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_64cdae4d ON public.search_docket USING btree (referred_to_id);


--
-- Name: search_docket_695b63bb; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_695b63bb ON public.search_docket USING btree (appeal_from_id);


--
-- Name: search_docket_6c91ba55; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_6c91ba55 ON public.search_docket USING btree (docket_number_core);


--
-- Name: search_docket_7a46e69c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_7a46e69c ON public.search_docket USING btree (court_id);


--
-- Name: search_docket_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_c69e55a4 ON public.search_docket USING btree (date_created);


--
-- Name: search_docket_court_id_2d2438b2594e74ba_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_court_id_2d2438b2594e74ba_like ON public.search_docket USING btree (court_id varchar_pattern_ops);


--
-- Name: search_docket_docket_number_4af29e98dca38326_uniq; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_docket_number_4af29e98dca38326_uniq ON public.search_docket USING btree (docket_number);


--
-- Name: search_docket_docket_number_core_713b7b04e01f11d7_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_docket_number_core_713b7b04e01f11d7_like ON public.search_docket USING btree (docket_number_core varchar_pattern_ops);


--
-- Name: search_docket_panel_1427d4ab; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_panel_1427d4ab ON public.search_docket_panel USING btree (docket_id);


--
-- Name: search_docket_panel_a8452ca7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_panel_a8452ca7 ON public.search_docket_panel USING btree (person_id);


--
-- Name: search_docket_tags_1427d4ab; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_tags_1427d4ab ON public.search_docket_tags USING btree (docket_id);


--
-- Name: search_docket_tags_76f094bc; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docket_tags_76f094bc ON public.search_docket_tags USING btree (tag_id);


--
-- Name: search_docketentry_1427d4ab; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentry_1427d4ab ON public.search_docketentry USING btree (docket_id);


--
-- Name: search_docketentry_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentry_5fdb3d66 ON public.search_docketentry USING btree (date_modified);


--
-- Name: search_docketentry_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentry_c69e55a4 ON public.search_docketentry USING btree (date_created);


--
-- Name: search_docketentry_tags_76f094bc; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentry_tags_76f094bc ON public.search_docketentry_tags USING btree (tag_id);


--
-- Name: search_docketentry_tags_b02d089e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentry_tags_b02d089e ON public.search_docketentry_tags USING btree (docketentry_id);


--
-- Name: search_docketentryevent_docket_id_469ad4c0; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentryevent_docket_id_469ad4c0 ON public.search_docketentryevent USING btree (docket_id);


--
-- Name: search_docketentryevent_pgh_context_id_1bd9c36d; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentryevent_pgh_context_id_1bd9c36d ON public.search_docketentryevent USING btree (pgh_context_id);


--
-- Name: search_docketentryevent_pgh_obj_id_584ac554; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentryevent_pgh_obj_id_584ac554 ON public.search_docketentryevent USING btree (pgh_obj_id);


--
-- Name: search_docketentrytagsevent_docketentry_id_1aa64197; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentrytagsevent_docketentry_id_1aa64197 ON public.search_docketentrytagsevent USING btree (docketentry_id);


--
-- Name: search_docketentrytagsevent_pgh_context_id_f91c4367; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentrytagsevent_pgh_context_id_f91c4367 ON public.search_docketentrytagsevent USING btree (pgh_context_id);


--
-- Name: search_docketentrytagsevent_tag_id_9d769fa5; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketentrytagsevent_tag_id_9d769fa5 ON public.search_docketentrytagsevent USING btree (tag_id);


--
-- Name: search_docketevent_appeal_from_id_388367c7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_appeal_from_id_388367c7 ON public.search_docketevent USING btree (appeal_from_id);


--
-- Name: search_docketevent_appeal_from_id_388367c7_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_appeal_from_id_388367c7_like ON public.search_docketevent USING btree (appeal_from_id varchar_pattern_ops);


--
-- Name: search_docketevent_assigned_to_id_13bac477; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_assigned_to_id_13bac477 ON public.search_docketevent USING btree (assigned_to_id);


--
-- Name: search_docketevent_court_id_c6baeb82; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_court_id_c6baeb82 ON public.search_docketevent USING btree (court_id);


--
-- Name: search_docketevent_court_id_c6baeb82_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_court_id_c6baeb82_like ON public.search_docketevent USING btree (court_id varchar_pattern_ops);


--
-- Name: search_docketevent_idb_data_id_62179a0f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_idb_data_id_62179a0f ON public.search_docketevent USING btree (idb_data_id);


--
-- Name: search_docketevent_originating_court_information_id_47acc418; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_originating_court_information_id_47acc418 ON public.search_docketevent USING btree (originating_court_information_id);


--
-- Name: search_docketevent_pgh_context_id_72300038; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_pgh_context_id_72300038 ON public.search_docketevent USING btree (pgh_context_id);


--
-- Name: search_docketevent_pgh_obj_id_5d06013e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_pgh_obj_id_5d06013e ON public.search_docketevent USING btree (pgh_obj_id);


--
-- Name: search_docketevent_referred_to_id_ba58a272; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketevent_referred_to_id_ba58a272 ON public.search_docketevent USING btree (referred_to_id);


--
-- Name: search_docketpanelevent_docket_id_1a9e206c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketpanelevent_docket_id_1a9e206c ON public.search_docketpanelevent USING btree (docket_id);


--
-- Name: search_docketpanelevent_person_id_97094b3d; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketpanelevent_person_id_97094b3d ON public.search_docketpanelevent USING btree (person_id);


--
-- Name: search_docketpanelevent_pgh_context_id_03019aa7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_docketpanelevent_pgh_context_id_03019aa7 ON public.search_docketpanelevent USING btree (pgh_context_id);


--
-- Name: search_dockettagsevent_docket_id_b1874f82; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_dockettagsevent_docket_id_b1874f82 ON public.search_dockettagsevent USING btree (docket_id);


--
-- Name: search_dockettagsevent_pgh_context_id_69b62450; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_dockettagsevent_pgh_context_id_69b62450 ON public.search_dockettagsevent USING btree (pgh_context_id);


--
-- Name: search_dockettagsevent_tag_id_728990f4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_dockettagsevent_tag_id_728990f4 ON public.search_dockettagsevent USING btree (tag_id);


--
-- Name: search_opin_depth_3307bd_idx; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opin_depth_3307bd_idx ON public.search_opinionscitedbyrecapdocument USING btree (depth);


--
-- Name: search_opinion_1cbcfc0f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_1cbcfc0f ON public.search_opinion USING btree (download_url);


--
-- Name: search_opinion_4f331e2f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_4f331e2f ON public.search_opinion USING btree (author_id);


--
-- Name: search_opinion_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_5fdb3d66 ON public.search_opinion USING btree (date_modified);


--
-- Name: search_opinion_71485e76; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_71485e76 ON public.search_opinion USING btree (local_path);


--
-- Name: search_opinion_74a89174; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_74a89174 ON public.search_opinion USING btree (sha1);


--
-- Name: search_opinion_a97b1c12; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_a97b1c12 ON public.search_opinion USING btree (cluster_id);


--
-- Name: search_opinion_bded6737; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_bded6737 ON public.search_opinion USING btree (extracted_by_ocr);


--
-- Name: search_opinion_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_c69e55a4 ON public.search_opinion USING btree (date_created);


--
-- Name: search_opinion_download_url_3b11b165f23bc568_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_download_url_3b11b165f23bc568_like ON public.search_opinion USING btree (download_url varchar_pattern_ops);


--
-- Name: search_opinion_joined_by_8a09c46f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_joined_by_8a09c46f ON public.search_opinion_joined_by USING btree (opinion_id);


--
-- Name: search_opinion_joined_by_e7c5d788; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_joined_by_e7c5d788 ON public.search_opinion_joined_by USING btree (person_id);


--
-- Name: search_opinion_local_path_63290b39b28ef927_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_local_path_63290b39b28ef927_like ON public.search_opinion USING btree (local_path varchar_pattern_ops);


--
-- Name: search_opinion_sha1_5887dd5d3475ad17_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinion_sha1_5887dd5d3475ad17_like ON public.search_opinion USING btree (sha1 varchar_pattern_ops);


--
-- Name: search_opinioncluster_0b869b2f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_0b869b2f ON public.search_opinioncluster USING btree (date_blocked);


--
-- Name: search_opinioncluster_1427d4ab; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_1427d4ab ON public.search_opinioncluster USING btree (docket_id);


--
-- Name: search_opinioncluster_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_5fdb3d66 ON public.search_opinioncluster USING btree (date_modified);


--
-- Name: search_opinioncluster_61326117; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_61326117 ON public.search_opinioncluster USING btree (blocked);


--
-- Name: search_opinioncluster_98cc5f59; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_98cc5f59 ON public.search_opinioncluster USING btree (date_filed);


--
-- Name: search_opinioncluster_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_c69e55a4 ON public.search_opinioncluster USING btree (date_created);


--
-- Name: search_opinioncluster_d91c83eb; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_d91c83eb ON public.search_opinioncluster USING btree (citation_count);


--
-- Name: search_opinioncluster_e0fd3ccf; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_e0fd3ccf ON public.search_opinioncluster USING btree (scdb_id);


--
-- Name: search_opinioncluster_f796c05b; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_f796c05b ON public.search_opinioncluster USING btree (precedential_status);


--
-- Name: search_opinioncluster_filepath_json_harvard_4b8057d0; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_filepath_json_harvard_4b8057d0 ON public.search_opinioncluster USING btree (filepath_json_harvard);


--
-- Name: search_opinioncluster_filepath_json_harvard_4b8057d0_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_filepath_json_harvard_4b8057d0_like ON public.search_opinioncluster USING btree (filepath_json_harvard varchar_pattern_ops);


--
-- Name: search_opinioncluster_non_participating_judges_49bb60ae; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_non_participating_judges_49bb60ae ON public.search_opinioncluster_non_participating_judges USING btree (opinioncluster_id);


--
-- Name: search_opinioncluster_non_participating_judges_e7c5d788; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_non_participating_judges_e7c5d788 ON public.search_opinioncluster_non_participating_judges USING btree (person_id);


--
-- Name: search_opinioncluster_panel_49bb60ae; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_panel_49bb60ae ON public.search_opinioncluster_panel USING btree (opinioncluster_id);


--
-- Name: search_opinioncluster_panel_e7c5d788; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_panel_e7c5d788 ON public.search_opinioncluster_panel USING btree (person_id);


--
-- Name: search_opinioncluster_precedential_status_2bdec6e2dedba28b_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_precedential_status_2bdec6e2dedba28b_like ON public.search_opinioncluster USING btree (precedential_status varchar_pattern_ops);


--
-- Name: search_opinioncluster_supreme_court_db_id_4297061ed6ba336_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinioncluster_supreme_court_db_id_4297061ed6ba336_like ON public.search_opinioncluster USING btree (scdb_id varchar_pattern_ops);


--
-- Name: search_opinionclusterevent_docket_id_165932da; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionclusterevent_docket_id_165932da ON public.search_opinionclusterevent USING btree (docket_id);


--
-- Name: search_opinionclusterevent_pgh_context_id_273003da; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionclusterevent_pgh_context_id_273003da ON public.search_opinionclusterevent USING btree (pgh_context_id);


--
-- Name: search_opinionclusterevent_pgh_obj_id_f1ea380d; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionclusterevent_pgh_obj_id_f1ea380d ON public.search_opinionclusterevent USING btree (pgh_obj_id);


--
-- Name: search_opinionclusternonpa_opinioncluster_id_cc505710; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionclusternonpa_opinioncluster_id_cc505710 ON public.search_opinionclusternonparticipatingjudgesevent USING btree (opinioncluster_id);


--
-- Name: search_opinionclusternonpa_person_id_7bf4f773; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionclusternonpa_person_id_7bf4f773 ON public.search_opinionclusternonparticipatingjudgesevent USING btree (person_id);


--
-- Name: search_opinionclusternonpa_pgh_context_id_aef74bea; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionclusternonpa_pgh_context_id_aef74bea ON public.search_opinionclusternonparticipatingjudgesevent USING btree (pgh_context_id);


--
-- Name: search_opinionclusterpanelevent_opinioncluster_id_7128c9e4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionclusterpanelevent_opinioncluster_id_7128c9e4 ON public.search_opinionclusterpanelevent USING btree (opinioncluster_id);


--
-- Name: search_opinionclusterpanelevent_person_id_b1c6a4a7; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionclusterpanelevent_person_id_b1c6a4a7 ON public.search_opinionclusterpanelevent USING btree (person_id);


--
-- Name: search_opinionclusterpanelevent_pgh_context_id_8dcb8078; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionclusterpanelevent_pgh_context_id_8dcb8078 ON public.search_opinionclusterpanelevent USING btree (pgh_context_id);


--
-- Name: search_opinionevent_author_id_43b0c67a; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionevent_author_id_43b0c67a ON public.search_opinionevent USING btree (author_id);


--
-- Name: search_opinionevent_cluster_id_1205465b; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionevent_cluster_id_1205465b ON public.search_opinionevent USING btree (cluster_id);


--
-- Name: search_opinionevent_pgh_context_id_723082e0; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionevent_pgh_context_id_723082e0 ON public.search_opinionevent USING btree (pgh_context_id);


--
-- Name: search_opinionevent_pgh_obj_id_63a2bc5f; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionevent_pgh_obj_id_63a2bc5f ON public.search_opinionevent USING btree (pgh_obj_id);


--
-- Name: search_opinionjoinedbyevent_opinion_id_9271b281; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionjoinedbyevent_opinion_id_9271b281 ON public.search_opinionjoinedbyevent USING btree (opinion_id);


--
-- Name: search_opinionjoinedbyevent_person_id_dffa9dcb; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionjoinedbyevent_person_id_dffa9dcb ON public.search_opinionjoinedbyevent USING btree (person_id);


--
-- Name: search_opinionjoinedbyevent_pgh_context_id_48acc9ad; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionjoinedbyevent_pgh_context_id_48acc9ad ON public.search_opinionjoinedbyevent USING btree (pgh_context_id);


--
-- Name: search_opinionscited_5b8b69a0; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionscited_5b8b69a0 ON public.search_opinionscited USING btree (citing_opinion_id);


--
-- Name: search_opinionscited_740050e6; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionscited_740050e6 ON public.search_opinionscited USING btree (cited_opinion_id);


--
-- Name: search_opinionscited_depth_46bacaef; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionscited_depth_46bacaef ON public.search_opinionscited USING btree (depth);


--
-- Name: search_opinionscitedbyrecapdocument_cited_opinion_id_5f0347bb; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionscitedbyrecapdocument_cited_opinion_id_5f0347bb ON public.search_opinionscitedbyrecapdocument USING btree (cited_opinion_id);


--
-- Name: search_opinionscitedbyrecapdocument_citing_document_id_c64b751b; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_opinionscitedbyrecapdocument_citing_document_id_c64b751b ON public.search_opinionscitedbyrecapdocument USING btree (citing_document_id);


--
-- Name: search_originatingcourtinf_ordering_judge_id_5aa931cb; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_originatingcourtinf_ordering_judge_id_5aa931cb ON public.search_originatingcourtinformationevent USING btree (ordering_judge_id);


--
-- Name: search_originatingcourtinformation_02c1725c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_originatingcourtinformation_02c1725c ON public.search_originatingcourtinformation USING btree (assigned_to_id);


--
-- Name: search_originatingcourtinformation_09a6c128; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_originatingcourtinformation_09a6c128 ON public.search_originatingcourtinformation USING btree (ordering_judge_id);


--
-- Name: search_originatingcourtinformation_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_originatingcourtinformation_5fdb3d66 ON public.search_originatingcourtinformation USING btree (date_modified);


--
-- Name: search_originatingcourtinformation_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_originatingcourtinformation_c69e55a4 ON public.search_originatingcourtinformation USING btree (date_created);


--
-- Name: search_originatingcourtinformationevent_assigned_to_id_fcce9094; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_originatingcourtinformationevent_assigned_to_id_fcce9094 ON public.search_originatingcourtinformationevent USING btree (assigned_to_id);


--
-- Name: search_originatingcourtinformationevent_pgh_context_id_d8ffc4c8; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_originatingcourtinformationevent_pgh_context_id_d8ffc4c8 ON public.search_originatingcourtinformationevent USING btree (pgh_context_id);


--
-- Name: search_originatingcourtinformationevent_pgh_obj_id_32490a9c; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_originatingcourtinformationevent_pgh_obj_id_32490a9c ON public.search_originatingcourtinformationevent USING btree (pgh_obj_id);


--
-- Name: search_pare_score_16f118_idx; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_pare_score_16f118_idx ON public.search_parentheticalgroup USING btree (score);


--
-- Name: search_parenthetical_described_opinion_id_ddd408db; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_parenthetical_described_opinion_id_ddd408db ON public.search_parenthetical USING btree (described_opinion_id);


--
-- Name: search_parenthetical_describing_opinion_id_07864494; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_parenthetical_describing_opinion_id_07864494 ON public.search_parenthetical USING btree (describing_opinion_id);


--
-- Name: search_parenthetical_group_id_00a7def3; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_parenthetical_group_id_00a7def3 ON public.search_parenthetical USING btree (group_id);


--
-- Name: search_parenthetical_score_cab0b2a1; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_parenthetical_score_cab0b2a1 ON public.search_parenthetical USING btree (score);


--
-- Name: search_parentheticalgroup_opinion_id_fd6bb935; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_parentheticalgroup_opinion_id_fd6bb935 ON public.search_parentheticalgroup USING btree (opinion_id);


--
-- Name: search_parentheticalgroup_representative_id_00e5a857; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_parentheticalgroup_representative_id_00e5a857 ON public.search_parentheticalgroup USING btree (representative_id);


--
-- Name: search_reca_documen_cc5acd_idx; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_reca_documen_cc5acd_idx ON public.search_recapdocument USING btree (document_type, document_number, attachment_number);


--
-- Name: search_recapdocument_1dec38a6; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocument_1dec38a6 ON public.search_recapdocument USING btree (is_free_on_pacer);


--
-- Name: search_recapdocument_40d913b2; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocument_40d913b2 ON public.search_recapdocument USING btree (docket_entry_id);


--
-- Name: search_recapdocument_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocument_5fdb3d66 ON public.search_recapdocument USING btree (date_modified);


--
-- Name: search_recapdocument_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocument_c69e55a4 ON public.search_recapdocument USING btree (date_created);


--
-- Name: search_recapdocument_document_number_6f825e81ddd11fde_uniq; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocument_document_number_6f825e81ddd11fde_uniq ON public.search_recapdocument USING btree (document_number);


--
-- Name: search_recapdocument_filepath_local_7dc6b0e53ccf753_uniq; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocument_filepath_local_7dc6b0e53ccf753_uniq ON public.search_recapdocument USING btree (filepath_local);


--
-- Name: search_recapdocument_pacer_doc_id_12ec9c122839e6aa_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocument_pacer_doc_id_12ec9c122839e6aa_like ON public.search_recapdocument USING btree (pacer_doc_id varchar_pattern_ops);


--
-- Name: search_recapdocument_tags_76f094bc; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocument_tags_76f094bc ON public.search_recapdocument_tags USING btree (tag_id);


--
-- Name: search_recapdocument_tags_fae26ff6; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocument_tags_fae26ff6 ON public.search_recapdocument_tags USING btree (recapdocument_id);


--
-- Name: search_recapdocumentevent_docket_entry_id_055ee57b; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocumentevent_docket_entry_id_055ee57b ON public.search_recapdocumentevent USING btree (docket_entry_id);


--
-- Name: search_recapdocumentevent_pgh_context_id_37bf47c3; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocumentevent_pgh_context_id_37bf47c3 ON public.search_recapdocumentevent USING btree (pgh_context_id);


--
-- Name: search_recapdocumentevent_pgh_obj_id_aa9c8d6e; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocumentevent_pgh_obj_id_aa9c8d6e ON public.search_recapdocumentevent USING btree (pgh_obj_id);


--
-- Name: search_recapdocumenttagsevent_pgh_context_id_ff9be284; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocumenttagsevent_pgh_context_id_ff9be284 ON public.search_recapdocumenttagsevent USING btree (pgh_context_id);


--
-- Name: search_recapdocumenttagsevent_recapdocument_id_c6f0a858; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocumenttagsevent_recapdocument_id_c6f0a858 ON public.search_recapdocumenttagsevent USING btree (recapdocument_id);


--
-- Name: search_recapdocumenttagsevent_tag_id_9fa96f02; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_recapdocumenttagsevent_tag_id_9fa96f02 ON public.search_recapdocumenttagsevent USING btree (tag_id);


--
-- Name: search_tag_5fdb3d66; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_tag_5fdb3d66 ON public.search_tag USING btree (date_modified);


--
-- Name: search_tag_c69e55a4; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_tag_c69e55a4 ON public.search_tag USING btree (date_created);


--
-- Name: search_tag_name_30c16b352387258b_like; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_tag_name_30c16b352387258b_like ON public.search_tag USING btree (name varchar_pattern_ops);


--
-- Name: search_tagevent_pgh_context_id_03f699de; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_tagevent_pgh_context_id_03f699de ON public.search_tagevent USING btree (pgh_context_id);


--
-- Name: search_tagevent_pgh_obj_id_af8c9817; Type: INDEX; Schema: public; Owner: david
--

CREATE INDEX search_tagevent_pgh_obj_id_af8c9817 ON public.search_tagevent USING btree (pgh_obj_id);


--
-- Name: search_court_appeals_to pgtrigger_update_or_delete_snapshot_delete_01d31; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_01d31 AFTER DELETE ON public.search_court_appeals_to FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_01d31();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_01d31 ON search_court_appeals_to; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_01d31 ON public.search_court_appeals_to IS '60c71e3e490f9be107654bc74bf4149d448b4842';


--
-- Name: search_claim_tags pgtrigger_update_or_delete_snapshot_delete_02000; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_02000 AFTER DELETE ON public.search_claim_tags FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_02000();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_02000 ON search_claim_tags; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_02000 ON public.search_claim_tags IS '42aba7d956af67e6ec65baaaffc2ace2b65f6e32';


--
-- Name: search_opinioncluster_non_participating_judges pgtrigger_update_or_delete_snapshot_delete_0cf1a; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_0cf1a AFTER DELETE ON public.search_opinioncluster_non_participating_judges FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_0cf1a();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_0cf1a ON search_opinioncluster_non_participating_judges; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_0cf1a ON public.search_opinioncluster_non_participating_judges IS '766b364dec501c586aa483949d7a4d963ce4b9dd';


--
-- Name: search_bankruptcyinformation pgtrigger_update_or_delete_snapshot_delete_0d356; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_0d356 AFTER DELETE ON public.search_bankruptcyinformation FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_0d356();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_0d356 ON search_bankruptcyinformation; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_0d356 ON public.search_bankruptcyinformation IS '0af1d52bc1ed98574095fe25182a3f75bad86da6';


--
-- Name: people_db_source pgtrigger_update_or_delete_snapshot_delete_1db27; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_1db27 AFTER DELETE ON public.people_db_source FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_1db27();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_1db27 ON people_db_source; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_1db27 ON public.people_db_source IS 'af8df2f3c5785a341684b95deac86682455ca38a';


--
-- Name: search_opinion pgtrigger_update_or_delete_snapshot_delete_1f4fd; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_1f4fd AFTER DELETE ON public.search_opinion FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_1f4fd();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_1f4fd ON search_opinion; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_1f4fd ON public.search_opinion IS '889b6c94d8bc62c35c3c2a043e0a0b8495274d7a';


--
-- Name: search_docket_tags pgtrigger_update_or_delete_snapshot_delete_2e377; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_2e377 AFTER DELETE ON public.search_docket_tags FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_2e377();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_2e377 ON search_docket_tags; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_2e377 ON public.search_docket_tags IS '721b4078948f8c33197c1ff4b2b39b92ff7ec18c';


--
-- Name: search_claim pgtrigger_update_or_delete_snapshot_delete_304ff; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_304ff AFTER DELETE ON public.search_claim FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_304ff();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_304ff ON search_claim; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_304ff ON public.search_claim IS '494bd9b70efb5f53bd7adc4154ca7544a5744430';


--
-- Name: search_opinioncluster_panel pgtrigger_update_or_delete_snapshot_delete_36569; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_36569 AFTER DELETE ON public.search_opinioncluster_panel FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_36569();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_36569 ON search_opinioncluster_panel; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_36569 ON public.search_opinioncluster_panel IS '678011e2794bfe51cd706f39ca3579d1951751e8';


--
-- Name: people_db_school pgtrigger_update_or_delete_snapshot_delete_40dc2; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_40dc2 AFTER DELETE ON public.people_db_school FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_40dc2();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_40dc2 ON people_db_school; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_40dc2 ON public.people_db_school IS '58acc759771efced22d98781d51e16b70e962b12';


--
-- Name: search_opinioncluster pgtrigger_update_or_delete_snapshot_delete_58fe8; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_58fe8 AFTER DELETE ON public.search_opinioncluster FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_58fe8();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_58fe8 ON search_opinioncluster; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_58fe8 ON public.search_opinioncluster IS 'efad05406fc64c608bbade46146fd2dbfd61692f';


--
-- Name: search_claimhistory pgtrigger_update_or_delete_snapshot_delete_5ec04; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_5ec04 AFTER DELETE ON public.search_claimhistory FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_5ec04();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_5ec04 ON search_claimhistory; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_5ec04 ON public.search_claimhistory IS '597f99a7be8f981d0663d87313f9e563996d8340';


--
-- Name: search_opinion_joined_by pgtrigger_update_or_delete_snapshot_delete_61f2c; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_61f2c AFTER DELETE ON public.search_opinion_joined_by FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_61f2c();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_61f2c ON search_opinion_joined_by; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_61f2c ON public.search_opinion_joined_by IS '00b5edde224bc032c6c14658e102bcc65cd6ab66';


--
-- Name: audio_audio pgtrigger_update_or_delete_snapshot_delete_63666; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_63666 AFTER DELETE ON public.audio_audio FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_63666();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_63666 ON audio_audio; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_63666 ON public.audio_audio IS '3f15b50d6ff720dceeaf2b1cff5606bf76e31fba';


--
-- Name: people_db_person pgtrigger_update_or_delete_snapshot_delete_649cf; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_649cf AFTER DELETE ON public.people_db_person FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_649cf();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_649cf ON people_db_person; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_649cf ON public.people_db_person IS '0124a496982c3c63f186d9d8af372dbb97b476ea';


--
-- Name: search_docketentry_tags pgtrigger_update_or_delete_snapshot_delete_70d5c; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_70d5c AFTER DELETE ON public.search_docketentry_tags FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_70d5c();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_70d5c ON search_docketentry_tags; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_70d5c ON public.search_docketentry_tags IS 'b666eb4d11fb27a59a986a33049b8c91bfa9bac4';


--
-- Name: search_docket pgtrigger_update_or_delete_snapshot_delete_7294f; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_7294f AFTER DELETE ON public.search_docket FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_7294f();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_7294f ON search_docket; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_7294f ON public.search_docket IS '8e6c1664ec07a73902036cd5e1db11e48d26c59d';


--
-- Name: search_recapdocument_tags pgtrigger_update_or_delete_snapshot_delete_7889e; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_7889e AFTER DELETE ON public.search_recapdocument_tags FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_7889e();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_7889e ON search_recapdocument_tags; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_7889e ON public.search_recapdocument_tags IS 'dc0319ae6f78c8fd85e6f9bb0530eda57946b625';


--
-- Name: search_court pgtrigger_update_or_delete_snapshot_delete_84ec4; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_84ec4 AFTER DELETE ON public.search_court FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_84ec4();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_84ec4 ON search_court; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_84ec4 ON public.search_court IS 'd72fa3660f1c1d7de0feadd1ba92c2e70f48da07';


--
-- Name: search_citation pgtrigger_update_or_delete_snapshot_delete_9631d; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_9631d AFTER DELETE ON public.search_citation FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_9631d();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_9631d ON search_citation; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_9631d ON public.search_citation IS 'a555a4f1ca71feb7d3527c7cbc7b4d80fabc39ca';


--
-- Name: people_db_abarating pgtrigger_update_or_delete_snapshot_delete_9f6fd; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_9f6fd AFTER DELETE ON public.people_db_abarating FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_9f6fd();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_9f6fd ON people_db_abarating; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_9f6fd ON public.people_db_abarating IS 'f865183e7573427d166286d2aeb0c0e1fcf16d01';


--
-- Name: search_docketentry pgtrigger_update_or_delete_snapshot_delete_a9490; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_a9490 AFTER DELETE ON public.search_docketentry FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_a9490();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_a9490 ON search_docketentry; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_a9490 ON public.search_docketentry IS 'ee9abd37a698de74f812f03f41b4fb2ec70d5427';


--
-- Name: search_docket_panel pgtrigger_update_or_delete_snapshot_delete_a94e0; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_a94e0 AFTER DELETE ON public.search_docket_panel FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_a94e0();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_a94e0 ON search_docket_panel; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_a94e0 ON public.search_docket_panel IS '8ecb6e5f925731eefb56ba2745d6698fd9a289a6';


--
-- Name: search_courthouse pgtrigger_update_or_delete_snapshot_delete_aabf8; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_aabf8 AFTER DELETE ON public.search_courthouse FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_aabf8();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_aabf8 ON search_courthouse; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_aabf8 ON public.search_courthouse IS '52ca038a3b52ba39ca02facbb87977a5cd1f59a3';


--
-- Name: people_db_education pgtrigger_update_or_delete_snapshot_delete_bf937; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_bf937 AFTER DELETE ON public.people_db_education FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_bf937();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_bf937 ON people_db_education; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_bf937 ON public.people_db_education IS '9a6f99da78762bcbe0545a84ea405ac1d971e2fc';


--
-- Name: people_db_person_race pgtrigger_update_or_delete_snapshot_delete_c73dc; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_c73dc AFTER DELETE ON public.people_db_person_race FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_c73dc();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_c73dc ON people_db_person_race; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_c73dc ON public.people_db_person_race IS '150298646b18b3d85f58e33b42e493b23fe6f646';


--
-- Name: search_recapdocument pgtrigger_update_or_delete_snapshot_delete_c80e6; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_c80e6 AFTER DELETE ON public.search_recapdocument FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_c80e6();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_c80e6 ON search_recapdocument; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_c80e6 ON public.search_recapdocument IS 'd14b8419ea347c312cd092b1bd157efa6542094e';


--
-- Name: people_db_position pgtrigger_update_or_delete_snapshot_delete_ca371; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_ca371 AFTER DELETE ON public.people_db_position FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_ca371();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_ca371 ON people_db_position; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_ca371 ON public.people_db_position IS '37c3937046469b37e52aac1a4ddebd56e42a5a4f';


--
-- Name: people_db_politicalaffiliation pgtrigger_update_or_delete_snapshot_delete_d036d; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_d036d AFTER DELETE ON public.people_db_politicalaffiliation FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_d036d();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_d036d ON people_db_politicalaffiliation; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_d036d ON public.people_db_politicalaffiliation IS 'c192b5c62cfcf07e04e6a49ae97aaeb5ffd0d424';


--
-- Name: search_originatingcourtinformation pgtrigger_update_or_delete_snapshot_delete_eac12; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_eac12 AFTER DELETE ON public.search_originatingcourtinformation FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_eac12();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_eac12 ON search_originatingcourtinformation; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_eac12 ON public.search_originatingcourtinformation IS '06b286ee7c515ed6f516bcd20dd98aac86dd6a37';


--
-- Name: people_db_retentionevent pgtrigger_update_or_delete_snapshot_delete_f0c63; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_f0c63 AFTER DELETE ON public.people_db_retentionevent FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_f0c63();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_f0c63 ON people_db_retentionevent; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_f0c63 ON public.people_db_retentionevent IS 'ffbb1483333a4f0661e087cd2c5a915c1ec73d62';


--
-- Name: audio_audio_panel pgtrigger_update_or_delete_snapshot_delete_f5717; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_f5717 AFTER DELETE ON public.audio_audio_panel FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_f5717();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_f5717 ON audio_audio_panel; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_f5717 ON public.audio_audio_panel IS '8281b6cb81fc9e9dcce8dff7fe60a40dc051cd7f';


--
-- Name: people_db_race pgtrigger_update_or_delete_snapshot_delete_f6fcc; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_f6fcc AFTER DELETE ON public.people_db_race FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_f6fcc();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_f6fcc ON people_db_race; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_f6fcc ON public.people_db_race IS '04b6ad1015070427b423239f7f7dc486e8453c75';


--
-- Name: search_tag pgtrigger_update_or_delete_snapshot_delete_f9b8e; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_delete_f9b8e AFTER DELETE ON public.search_tag FOR EACH ROW EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_delete_f9b8e();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_delete_f9b8e ON search_tag; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_delete_f9b8e ON public.search_tag IS '5b506e8962af3d28654705eacd859080cc526298';


--
-- Name: people_db_position pgtrigger_update_or_delete_snapshot_update_0586a; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_0586a AFTER UPDATE ON public.people_db_position FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR ((old.position_type)::text IS DISTINCT FROM (new.position_type)::text) OR ((old.job_title)::text IS DISTINCT FROM (new.job_title)::text) OR (old.sector IS DISTINCT FROM new.sector) OR (old.person_id IS DISTINCT FROM new.person_id) OR ((old.court_id)::text IS DISTINCT FROM (new.court_id)::text) OR (old.school_id IS DISTINCT FROM new.school_id) OR ((old.organization_name)::text IS DISTINCT FROM (new.organization_name)::text) OR ((old.location_city)::text IS DISTINCT FROM (new.location_city)::text) OR ((old.location_state)::text IS DISTINCT FROM (new.location_state)::text) OR (old.appointer_id IS DISTINCT FROM new.appointer_id) OR (old.supervisor_id IS DISTINCT FROM new.supervisor_id) OR (old.predecessor_id IS DISTINCT FROM new.predecessor_id) OR (old.date_nominated IS DISTINCT FROM new.date_nominated) OR (old.date_elected IS DISTINCT FROM new.date_elected) OR (old.date_recess_appointment IS DISTINCT FROM new.date_recess_appointment) OR (old.date_referred_to_judicial_committee IS DISTINCT FROM new.date_referred_to_judicial_committee) OR (old.date_judicial_committee_action IS DISTINCT FROM new.date_judicial_committee_action) OR ((old.judicial_committee_action)::text IS DISTINCT FROM (new.judicial_committee_action)::text) OR (old.date_hearing IS DISTINCT FROM new.date_hearing) OR (old.date_confirmation IS DISTINCT FROM new.date_confirmation) OR (old.date_start IS DISTINCT FROM new.date_start) OR ((old.date_granularity_start)::text IS DISTINCT FROM (new.date_granularity_start)::text) OR (old.date_termination IS DISTINCT FROM new.date_termination) OR ((old.termination_reason)::text IS DISTINCT FROM (new.termination_reason)::text) OR ((old.date_granularity_termination)::text IS DISTINCT FROM (new.date_granularity_termination)::text) OR (old.date_retirement IS DISTINCT FROM new.date_retirement) OR ((old.nomination_process)::text IS DISTINCT FROM (new.nomination_process)::text) OR ((old.vote_type)::text IS DISTINCT FROM (new.vote_type)::text) OR (old.voice_vote IS DISTINCT FROM new.voice_vote) OR (old.votes_yes IS DISTINCT FROM new.votes_yes) OR (old.votes_no IS DISTINCT FROM new.votes_no) OR (old.votes_yes_percent IS DISTINCT FROM new.votes_yes_percent) OR (old.votes_no_percent IS DISTINCT FROM new.votes_no_percent) OR ((old.how_selected)::text IS DISTINCT FROM (new.how_selected)::text) OR (old.has_inferred_values IS DISTINCT FROM new.has_inferred_values))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_0586a();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_0586a ON people_db_position; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_0586a ON public.people_db_position IS '0a03fa6888352997aeba8315cf01e6fa6735ba95';


--
-- Name: people_db_person pgtrigger_update_or_delete_snapshot_update_0f619; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_0f619 AFTER UPDATE ON public.people_db_person FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.is_alias_of_id IS DISTINCT FROM new.is_alias_of_id) OR (old.date_completed IS DISTINCT FROM new.date_completed) OR (old.fjc_id IS DISTINCT FROM new.fjc_id) OR ((old.slug)::text IS DISTINCT FROM (new.slug)::text) OR ((old.name_first)::text IS DISTINCT FROM (new.name_first)::text) OR ((old.name_middle)::text IS DISTINCT FROM (new.name_middle)::text) OR ((old.name_last)::text IS DISTINCT FROM (new.name_last)::text) OR ((old.name_suffix)::text IS DISTINCT FROM (new.name_suffix)::text) OR (old.date_dob IS DISTINCT FROM new.date_dob) OR ((old.date_granularity_dob)::text IS DISTINCT FROM (new.date_granularity_dob)::text) OR (old.date_dod IS DISTINCT FROM new.date_dod) OR ((old.date_granularity_dod)::text IS DISTINCT FROM (new.date_granularity_dod)::text) OR ((old.dob_city)::text IS DISTINCT FROM (new.dob_city)::text) OR ((old.dob_state)::text IS DISTINCT FROM (new.dob_state)::text) OR ((old.dob_country)::text IS DISTINCT FROM (new.dob_country)::text) OR ((old.dod_city)::text IS DISTINCT FROM (new.dod_city)::text) OR ((old.dod_state)::text IS DISTINCT FROM (new.dod_state)::text) OR ((old.dod_country)::text IS DISTINCT FROM (new.dod_country)::text) OR ((old.gender)::text IS DISTINCT FROM (new.gender)::text) OR ((old.religion)::text IS DISTINCT FROM (new.religion)::text) OR (old.ftm_total_received IS DISTINCT FROM new.ftm_total_received) OR ((old.ftm_eid)::text IS DISTINCT FROM (new.ftm_eid)::text) OR (old.has_photo IS DISTINCT FROM new.has_photo))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_0f619();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_0f619 ON people_db_person; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_0f619 ON public.people_db_person IS '08ac51839dafb5c0605bd71dcf96c6a08ec56db5';


--
-- Name: search_claimhistory pgtrigger_update_or_delete_snapshot_update_137a5; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_137a5 AFTER UPDATE ON public.search_claimhistory FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR ((old.sha1)::text IS DISTINCT FROM (new.sha1)::text) OR (old.page_count IS DISTINCT FROM new.page_count) OR (old.file_size IS DISTINCT FROM new.file_size) OR ((old.filepath_local)::text IS DISTINCT FROM (new.filepath_local)::text) OR ((old.filepath_ia)::text IS DISTINCT FROM (new.filepath_ia)::text) OR (old.ia_upload_failure_count IS DISTINCT FROM new.ia_upload_failure_count) OR ((old.thumbnail)::text IS DISTINCT FROM (new.thumbnail)::text) OR (old.thumbnail_status IS DISTINCT FROM new.thumbnail_status) OR (old.plain_text IS DISTINCT FROM new.plain_text) OR (old.ocr_status IS DISTINCT FROM new.ocr_status) OR (old.date_upload IS DISTINCT FROM new.date_upload) OR ((old.document_number)::text IS DISTINCT FROM (new.document_number)::text) OR (old.attachment_number IS DISTINCT FROM new.attachment_number) OR ((old.pacer_doc_id)::text IS DISTINCT FROM (new.pacer_doc_id)::text) OR (old.is_available IS DISTINCT FROM new.is_available) OR (old.is_free_on_pacer IS DISTINCT FROM new.is_free_on_pacer) OR (old.is_sealed IS DISTINCT FROM new.is_sealed) OR (old.claim_id IS DISTINCT FROM new.claim_id) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.claim_document_type IS DISTINCT FROM new.claim_document_type) OR (old.description IS DISTINCT FROM new.description) OR ((old.claim_doc_id)::text IS DISTINCT FROM (new.claim_doc_id)::text) OR (old.pacer_dm_id IS DISTINCT FROM new.pacer_dm_id) OR ((old.pacer_case_id)::text IS DISTINCT FROM (new.pacer_case_id)::text))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_137a5();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_137a5 ON search_claimhistory; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_137a5 ON public.search_claimhistory IS 'c4f2a33aa09534f0db6c38a62b0c4e2d656d1db0';


--
-- Name: search_bankruptcyinformation pgtrigger_update_or_delete_snapshot_update_17e86; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_17e86 AFTER UPDATE ON public.search_bankruptcyinformation FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR (old.date_converted IS DISTINCT FROM new.date_converted) OR (old.date_last_to_file_claims IS DISTINCT FROM new.date_last_to_file_claims) OR (old.date_last_to_file_govt IS DISTINCT FROM new.date_last_to_file_govt) OR (old.date_debtor_dismissed IS DISTINCT FROM new.date_debtor_dismissed) OR ((old.chapter)::text IS DISTINCT FROM (new.chapter)::text) OR (old.trustee_str IS DISTINCT FROM new.trustee_str))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_17e86();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_17e86 ON search_bankruptcyinformation; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_17e86 ON public.search_bankruptcyinformation IS '85d1a7878d466326c90c68b401f107b1158c2796';


--
-- Name: search_claim_tags pgtrigger_update_or_delete_snapshot_update_22c0b; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_22c0b AFTER UPDATE ON public.search_claim_tags FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_22c0b();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_22c0b ON search_claim_tags; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_22c0b ON public.search_claim_tags IS '885105aa8b20d2722401b2e8abdf09482a9daaab';


--
-- Name: search_docketentry pgtrigger_update_or_delete_snapshot_update_46e1e; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_46e1e AFTER UPDATE ON public.search_docketentry FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.time_filed IS DISTINCT FROM new.time_filed) OR (old.entry_number IS DISTINCT FROM new.entry_number) OR ((old.recap_sequence_number)::text IS DISTINCT FROM (new.recap_sequence_number)::text) OR (old.pacer_sequence_number IS DISTINCT FROM new.pacer_sequence_number) OR (old.description IS DISTINCT FROM new.description))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_46e1e();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_46e1e ON search_docketentry; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_46e1e ON public.search_docketentry IS '2330fe784864bcc2d76ebe1d4a07e7819fa8de38';


--
-- Name: people_db_school pgtrigger_update_or_delete_snapshot_update_471f3; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_471f3 AFTER UPDATE ON public.people_db_school FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.is_alias_of_id IS DISTINCT FROM new.is_alias_of_id) OR ((old.name)::text IS DISTINCT FROM (new.name)::text) OR (old.ein IS DISTINCT FROM new.ein))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_471f3();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_471f3 ON people_db_school; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_471f3 ON public.people_db_school IS 'fcb9b90cd9230495908dec047c6d260c1ead3dd5';


--
-- Name: search_opinioncluster_non_participating_judges pgtrigger_update_or_delete_snapshot_update_477cb; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_477cb AFTER UPDATE ON public.search_opinioncluster_non_participating_judges FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_477cb();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_477cb ON search_opinioncluster_non_participating_judges; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_477cb ON public.search_opinioncluster_non_participating_judges IS '670999bc5589f6b494f23649d7b439b0d5fa0738';


--
-- Name: search_originatingcourtinformation pgtrigger_update_or_delete_snapshot_update_49538; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_49538 AFTER UPDATE ON public.search_originatingcourtinformation FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_number IS DISTINCT FROM new.docket_number) OR (old.assigned_to_id IS DISTINCT FROM new.assigned_to_id) OR (old.assigned_to_str IS DISTINCT FROM new.assigned_to_str) OR (old.ordering_judge_id IS DISTINCT FROM new.ordering_judge_id) OR (old.ordering_judge_str IS DISTINCT FROM new.ordering_judge_str) OR (old.court_reporter IS DISTINCT FROM new.court_reporter) OR (old.date_disposed IS DISTINCT FROM new.date_disposed) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.date_judgment IS DISTINCT FROM new.date_judgment) OR (old.date_judgment_eod IS DISTINCT FROM new.date_judgment_eod) OR (old.date_filed_noa IS DISTINCT FROM new.date_filed_noa) OR (old.date_received_coa IS DISTINCT FROM new.date_received_coa))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_49538();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_49538 ON search_originatingcourtinformation; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_49538 ON public.search_originatingcourtinformation IS '5d249a18e8be51afa8c54132770efcdde2b47a61';


--
-- Name: people_db_education pgtrigger_update_or_delete_snapshot_update_4e1c4; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_4e1c4 AFTER UPDATE ON public.people_db_education FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.person_id IS DISTINCT FROM new.person_id) OR (old.school_id IS DISTINCT FROM new.school_id) OR ((old.degree_level)::text IS DISTINCT FROM (new.degree_level)::text) OR ((old.degree_detail)::text IS DISTINCT FROM (new.degree_detail)::text) OR (old.degree_year IS DISTINCT FROM new.degree_year))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_4e1c4();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_4e1c4 ON people_db_education; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_4e1c4 ON public.people_db_education IS 'c0837209f26fcd9f74a4b0032277e97122c8a369';


--
-- Name: audio_audio_panel pgtrigger_update_or_delete_snapshot_update_4e441; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_4e441 AFTER UPDATE ON public.audio_audio_panel FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_4e441();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_4e441 ON audio_audio_panel; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_4e441 ON public.audio_audio_panel IS '9cadb65943a3d38e84beba67c55089ef7955f87e';


--
-- Name: people_db_politicalaffiliation pgtrigger_update_or_delete_snapshot_update_54863; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_54863 AFTER UPDATE ON public.people_db_politicalaffiliation FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.person_id IS DISTINCT FROM new.person_id) OR ((old.political_party)::text IS DISTINCT FROM (new.political_party)::text) OR ((old.source)::text IS DISTINCT FROM (new.source)::text) OR (old.date_start IS DISTINCT FROM new.date_start) OR ((old.date_granularity_start)::text IS DISTINCT FROM (new.date_granularity_start)::text) OR (old.date_end IS DISTINCT FROM new.date_end) OR ((old.date_granularity_end)::text IS DISTINCT FROM (new.date_granularity_end)::text))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_54863();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_54863 ON people_db_politicalaffiliation; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_54863 ON public.people_db_politicalaffiliation IS '0690cb3e0c0915ec679829351fc663db56d56b81';


--
-- Name: search_opinioncluster_panel pgtrigger_update_or_delete_snapshot_update_565f2; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_565f2 AFTER UPDATE ON public.search_opinioncluster_panel FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_565f2();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_565f2 ON search_opinioncluster_panel; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_565f2 ON public.search_opinioncluster_panel IS '57d19471902fa2b87020b44766bdd63104a4b737';


--
-- Name: people_db_abarating pgtrigger_update_or_delete_snapshot_update_5d5cb; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_5d5cb AFTER UPDATE ON public.people_db_abarating FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.person_id IS DISTINCT FROM new.person_id) OR (old.year_rated IS DISTINCT FROM new.year_rated) OR ((old.rating)::text IS DISTINCT FROM (new.rating)::text))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_5d5cb();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_5d5cb ON people_db_abarating; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_5d5cb ON public.people_db_abarating IS '13f74349ae81148bf7b34818895d2e9894c93b7e';


--
-- Name: audio_audio pgtrigger_update_or_delete_snapshot_update_63362; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_63362 AFTER UPDATE ON public.audio_audio FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR ((old.source)::text IS DISTINCT FROM (new.source)::text) OR (old.case_name_short IS DISTINCT FROM new.case_name_short) OR (old.case_name IS DISTINCT FROM new.case_name) OR (old.case_name_full IS DISTINCT FROM new.case_name_full) OR (old.judges IS DISTINCT FROM new.judges) OR ((old.sha1)::text IS DISTINCT FROM (new.sha1)::text) OR ((old.download_url)::text IS DISTINCT FROM (new.download_url)::text) OR ((old.local_path_mp3)::text IS DISTINCT FROM (new.local_path_mp3)::text) OR ((old.local_path_original_file)::text IS DISTINCT FROM (new.local_path_original_file)::text) OR ((old.filepath_ia)::text IS DISTINCT FROM (new.filepath_ia)::text) OR (old.ia_upload_failure_count IS DISTINCT FROM new.ia_upload_failure_count) OR (old.duration IS DISTINCT FROM new.duration) OR (old.processing_complete IS DISTINCT FROM new.processing_complete) OR (old.date_blocked IS DISTINCT FROM new.date_blocked) OR (old.blocked IS DISTINCT FROM new.blocked) OR (old.stt_status IS DISTINCT FROM new.stt_status) OR (old.stt_google_response IS DISTINCT FROM new.stt_google_response))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_63362();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_63362 ON audio_audio; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_63362 ON public.audio_audio IS '64184a9d143b2a4e59fd385994e9971e5ea4cbbc';


--
-- Name: search_opinion pgtrigger_update_or_delete_snapshot_update_67ecd; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_67ecd AFTER UPDATE ON public.search_opinion FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.cluster_id IS DISTINCT FROM new.cluster_id) OR (old.author_id IS DISTINCT FROM new.author_id) OR (old.author_str IS DISTINCT FROM new.author_str) OR (old.per_curiam IS DISTINCT FROM new.per_curiam) OR (old.joined_by_str IS DISTINCT FROM new.joined_by_str) OR ((old.type)::text IS DISTINCT FROM (new.type)::text) OR ((old.sha1)::text IS DISTINCT FROM (new.sha1)::text) OR (old.page_count IS DISTINCT FROM new.page_count) OR ((old.download_url)::text IS DISTINCT FROM (new.download_url)::text) OR ((old.local_path)::text IS DISTINCT FROM (new.local_path)::text) OR (old.plain_text IS DISTINCT FROM new.plain_text) OR (old.html IS DISTINCT FROM new.html) OR (old.html_lawbox IS DISTINCT FROM new.html_lawbox) OR (old.html_columbia IS DISTINCT FROM new.html_columbia) OR (old.html_anon_2020 IS DISTINCT FROM new.html_anon_2020) OR (old.xml_harvard IS DISTINCT FROM new.xml_harvard) OR (old.html_with_citations IS DISTINCT FROM new.html_with_citations) OR (old.extracted_by_ocr IS DISTINCT FROM new.extracted_by_ocr))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_67ecd();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_67ecd ON search_opinion; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_67ecd ON public.search_opinion IS '4a3d82790ac0cbd840d6a7f6c136d4cc65419e5e';


--
-- Name: search_opinioncluster pgtrigger_update_or_delete_snapshot_update_6a181; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_6a181 AFTER UPDATE ON public.search_opinioncluster FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR (old.judges IS DISTINCT FROM new.judges) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.date_filed_is_approximate IS DISTINCT FROM new.date_filed_is_approximate) OR ((old.slug)::text IS DISTINCT FROM (new.slug)::text) OR (old.case_name_short IS DISTINCT FROM new.case_name_short) OR (old.case_name IS DISTINCT FROM new.case_name) OR (old.case_name_full IS DISTINCT FROM new.case_name_full) OR ((old.scdb_id)::text IS DISTINCT FROM (new.scdb_id)::text) OR (old.scdb_decision_direction IS DISTINCT FROM new.scdb_decision_direction) OR (old.scdb_votes_majority IS DISTINCT FROM new.scdb_votes_majority) OR (old.scdb_votes_minority IS DISTINCT FROM new.scdb_votes_minority) OR ((old.source)::text IS DISTINCT FROM (new.source)::text) OR (old.procedural_history IS DISTINCT FROM new.procedural_history) OR (old.attorneys IS DISTINCT FROM new.attorneys) OR (old.nature_of_suit IS DISTINCT FROM new.nature_of_suit) OR (old.posture IS DISTINCT FROM new.posture) OR (old.syllabus IS DISTINCT FROM new.syllabus) OR (old.headnotes IS DISTINCT FROM new.headnotes) OR (old.summary IS DISTINCT FROM new.summary) OR (old.disposition IS DISTINCT FROM new.disposition) OR (old.history IS DISTINCT FROM new.history) OR (old.other_dates IS DISTINCT FROM new.other_dates) OR (old.cross_reference IS DISTINCT FROM new.cross_reference) OR (old.correction IS DISTINCT FROM new.correction) OR (old.citation_count IS DISTINCT FROM new.citation_count) OR ((old.precedential_status)::text IS DISTINCT FROM (new.precedential_status)::text) OR (old.date_blocked IS DISTINCT FROM new.date_blocked) OR (old.blocked IS DISTINCT FROM new.blocked) OR ((old.filepath_json_harvard)::text IS DISTINCT FROM (new.filepath_json_harvard)::text) OR (old.arguments IS DISTINCT FROM new.arguments) OR (old.headmatter IS DISTINCT FROM new.headmatter))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_6a181();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_6a181 ON search_opinioncluster; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_6a181 ON public.search_opinioncluster IS 'a186ab65e2b0b6da774524ca6948808bf68a4f93';


--
-- Name: search_opinion_joined_by pgtrigger_update_or_delete_snapshot_update_6be54; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_6be54 AFTER UPDATE ON public.search_opinion_joined_by FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_6be54();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_6be54 ON search_opinion_joined_by; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_6be54 ON public.search_opinion_joined_by IS '492f94ff83c291215ae07c18c238b2c71e843e04';


--
-- Name: search_docket pgtrigger_update_or_delete_snapshot_update_7e039; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_7e039 AFTER UPDATE ON public.search_docket FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.source IS DISTINCT FROM new.source) OR ((old.court_id)::text IS DISTINCT FROM (new.court_id)::text) OR ((old.appeal_from_id)::text IS DISTINCT FROM (new.appeal_from_id)::text) OR (old.appeal_from_str IS DISTINCT FROM new.appeal_from_str) OR (old.originating_court_information_id IS DISTINCT FROM new.originating_court_information_id) OR (old.idb_data_id IS DISTINCT FROM new.idb_data_id) OR (old.assigned_to_id IS DISTINCT FROM new.assigned_to_id) OR (old.assigned_to_str IS DISTINCT FROM new.assigned_to_str) OR (old.referred_to_id IS DISTINCT FROM new.referred_to_id) OR (old.referred_to_str IS DISTINCT FROM new.referred_to_str) OR (old.panel_str IS DISTINCT FROM new.panel_str) OR (old.date_last_index IS DISTINCT FROM new.date_last_index) OR (old.date_cert_granted IS DISTINCT FROM new.date_cert_granted) OR (old.date_cert_denied IS DISTINCT FROM new.date_cert_denied) OR (old.date_argued IS DISTINCT FROM new.date_argued) OR (old.date_reargued IS DISTINCT FROM new.date_reargued) OR (old.date_reargument_denied IS DISTINCT FROM new.date_reargument_denied) OR (old.date_filed IS DISTINCT FROM new.date_filed) OR (old.date_terminated IS DISTINCT FROM new.date_terminated) OR (old.date_last_filing IS DISTINCT FROM new.date_last_filing) OR (old.case_name_short IS DISTINCT FROM new.case_name_short) OR (old.case_name IS DISTINCT FROM new.case_name) OR (old.case_name_full IS DISTINCT FROM new.case_name_full) OR ((old.slug)::text IS DISTINCT FROM (new.slug)::text) OR (old.docket_number IS DISTINCT FROM new.docket_number) OR ((old.docket_number_core)::text IS DISTINCT FROM (new.docket_number_core)::text) OR ((old.pacer_case_id)::text IS DISTINCT FROM (new.pacer_case_id)::text) OR ((old.cause)::text IS DISTINCT FROM (new.cause)::text) OR ((old.nature_of_suit)::text IS DISTINCT FROM (new.nature_of_suit)::text) OR ((old.jury_demand)::text IS DISTINCT FROM (new.jury_demand)::text) OR ((old.jurisdiction_type)::text IS DISTINCT FROM (new.jurisdiction_type)::text) OR (old.appellate_fee_status IS DISTINCT FROM new.appellate_fee_status) OR (old.appellate_case_type_information IS DISTINCT FROM new.appellate_case_type_information) OR ((old.mdl_status)::text IS DISTINCT FROM (new.mdl_status)::text) OR ((old.filepath_local)::text IS DISTINCT FROM (new.filepath_local)::text) OR ((old.filepath_ia)::text IS DISTINCT FROM (new.filepath_ia)::text) OR ((old.filepath_ia_json)::text IS DISTINCT FROM (new.filepath_ia_json)::text) OR (old.ia_upload_failure_count IS DISTINCT FROM new.ia_upload_failure_count) OR (old.ia_needs_upload IS DISTINCT FROM new.ia_needs_upload) OR (old.ia_date_first_change IS DISTINCT FROM new.ia_date_first_change) OR (old.date_blocked IS DISTINCT FROM new.date_blocked) OR (old.blocked IS DISTINCT FROM new.blocked))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_7e039();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_7e039 ON search_docket; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_7e039 ON public.search_docket IS 'cab7d35a7309b21c85f837b8a6c4759febe46fd8';


--
-- Name: people_db_source pgtrigger_update_or_delete_snapshot_update_88fe4; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_88fe4 AFTER UPDATE ON public.people_db_source FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.person_id IS DISTINCT FROM new.person_id) OR ((old.url)::text IS DISTINCT FROM (new.url)::text) OR (old.date_accessed IS DISTINCT FROM new.date_accessed) OR (old.notes IS DISTINCT FROM new.notes))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_88fe4();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_88fe4 ON people_db_source; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_88fe4 ON public.people_db_source IS '7d04b1b7898b11902defc3b43ccbcff539cf174c';


--
-- Name: search_recapdocument pgtrigger_update_or_delete_snapshot_update_8a108; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_8a108 AFTER UPDATE ON public.search_recapdocument FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR ((old.sha1)::text IS DISTINCT FROM (new.sha1)::text) OR (old.page_count IS DISTINCT FROM new.page_count) OR (old.file_size IS DISTINCT FROM new.file_size) OR ((old.filepath_local)::text IS DISTINCT FROM (new.filepath_local)::text) OR ((old.filepath_ia)::text IS DISTINCT FROM (new.filepath_ia)::text) OR (old.ia_upload_failure_count IS DISTINCT FROM new.ia_upload_failure_count) OR ((old.thumbnail)::text IS DISTINCT FROM (new.thumbnail)::text) OR (old.thumbnail_status IS DISTINCT FROM new.thumbnail_status) OR (old.plain_text IS DISTINCT FROM new.plain_text) OR (old.ocr_status IS DISTINCT FROM new.ocr_status) OR (old.date_upload IS DISTINCT FROM new.date_upload) OR ((old.document_number)::text IS DISTINCT FROM (new.document_number)::text) OR (old.attachment_number IS DISTINCT FROM new.attachment_number) OR ((old.pacer_doc_id)::text IS DISTINCT FROM (new.pacer_doc_id)::text) OR (old.is_available IS DISTINCT FROM new.is_available) OR (old.is_free_on_pacer IS DISTINCT FROM new.is_free_on_pacer) OR (old.is_sealed IS DISTINCT FROM new.is_sealed) OR (old.docket_entry_id IS DISTINCT FROM new.docket_entry_id) OR (old.document_type IS DISTINCT FROM new.document_type) OR (old.description IS DISTINCT FROM new.description))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_8a108();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_8a108 ON search_recapdocument; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_8a108 ON public.search_recapdocument IS 'a3e0c759d8c03f380dd3eddfcff551091fcee1d1';


--
-- Name: search_citation pgtrigger_update_or_delete_snapshot_update_8f120; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_8f120 AFTER UPDATE ON public.search_citation FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_8f120();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_8f120 ON search_citation; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_8f120 ON public.search_citation IS '65de02f1d9d58195dfe662ebc3be0a695327e61f';


--
-- Name: people_db_race pgtrigger_update_or_delete_snapshot_update_a4b83; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_a4b83 AFTER UPDATE ON public.people_db_race FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_a4b83();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_a4b83 ON people_db_race; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_a4b83 ON public.people_db_race IS '8d9f6a71b0465ca997d273d204aafa2c10689c6f';


--
-- Name: search_claim pgtrigger_update_or_delete_snapshot_update_bb32f; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_bb32f AFTER UPDATE ON public.search_claim FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.docket_id IS DISTINCT FROM new.docket_id) OR (old.date_claim_modified IS DISTINCT FROM new.date_claim_modified) OR (old.date_original_entered IS DISTINCT FROM new.date_original_entered) OR (old.date_original_filed IS DISTINCT FROM new.date_original_filed) OR (old.date_last_amendment_entered IS DISTINCT FROM new.date_last_amendment_entered) OR (old.date_last_amendment_filed IS DISTINCT FROM new.date_last_amendment_filed) OR ((old.claim_number)::text IS DISTINCT FROM (new.claim_number)::text) OR (old.creditor_details IS DISTINCT FROM new.creditor_details) OR ((old.creditor_id)::text IS DISTINCT FROM (new.creditor_id)::text) OR ((old.status)::text IS DISTINCT FROM (new.status)::text) OR ((old.entered_by)::text IS DISTINCT FROM (new.entered_by)::text) OR ((old.filed_by)::text IS DISTINCT FROM (new.filed_by)::text) OR ((old.amount_claimed)::text IS DISTINCT FROM (new.amount_claimed)::text) OR ((old.unsecured_claimed)::text IS DISTINCT FROM (new.unsecured_claimed)::text) OR ((old.secured_claimed)::text IS DISTINCT FROM (new.secured_claimed)::text) OR ((old.priority_claimed)::text IS DISTINCT FROM (new.priority_claimed)::text) OR (old.description IS DISTINCT FROM new.description) OR (old.remarks IS DISTINCT FROM new.remarks))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_bb32f();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_bb32f ON search_claim; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_bb32f ON public.search_claim IS '5a3fde0d49f7f04afe30f9151a8b3535710ec1a0';


--
-- Name: search_court pgtrigger_update_or_delete_snapshot_update_c94ab; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_c94ab AFTER UPDATE ON public.search_court FOR EACH ROW WHEN ((((old.id)::text IS DISTINCT FROM (new.id)::text) OR ((old.parent_court_id)::text IS DISTINCT FROM (new.parent_court_id)::text) OR (old.pacer_court_id IS DISTINCT FROM new.pacer_court_id) OR (old.pacer_has_rss_feed IS DISTINCT FROM new.pacer_has_rss_feed) OR (old.pacer_rss_entry_types IS DISTINCT FROM new.pacer_rss_entry_types) OR (old.date_last_pacer_contact IS DISTINCT FROM new.date_last_pacer_contact) OR ((old.fjc_court_id)::text IS DISTINCT FROM (new.fjc_court_id)::text) OR (old.in_use IS DISTINCT FROM new.in_use) OR (old.has_opinion_scraper IS DISTINCT FROM new.has_opinion_scraper) OR (old.has_oral_argument_scraper IS DISTINCT FROM new.has_oral_argument_scraper) OR (old."position" IS DISTINCT FROM new."position") OR ((old.citation_string)::text IS DISTINCT FROM (new.citation_string)::text) OR ((old.short_name)::text IS DISTINCT FROM (new.short_name)::text) OR ((old.full_name)::text IS DISTINCT FROM (new.full_name)::text) OR ((old.url)::text IS DISTINCT FROM (new.url)::text) OR (old.start_date IS DISTINCT FROM new.start_date) OR (old.end_date IS DISTINCT FROM new.end_date) OR ((old.jurisdiction)::text IS DISTINCT FROM (new.jurisdiction)::text) OR (old.notes IS DISTINCT FROM new.notes))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_c94ab();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_c94ab ON search_court; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_c94ab ON public.search_court IS 'd886ec89d1364a03c4f04630b4a0e1363d97fcc1';


--
-- Name: search_tag pgtrigger_update_or_delete_snapshot_update_c9dd9; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_c9dd9 AFTER UPDATE ON public.search_tag FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR ((old.name)::text IS DISTINCT FROM (new.name)::text))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_c9dd9();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_c9dd9 ON search_tag; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_c9dd9 ON public.search_tag IS '4071657dcfe71811e9e7a5c24dd77c22f81d7377';


--
-- Name: search_court_appeals_to pgtrigger_update_or_delete_snapshot_update_cc38c; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_cc38c AFTER UPDATE ON public.search_court_appeals_to FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_cc38c();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_cc38c ON search_court_appeals_to; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_cc38c ON public.search_court_appeals_to IS '5224e4a3e58a56dba44b76077e4915f981134af3';


--
-- Name: search_docket_tags pgtrigger_update_or_delete_snapshot_update_cccf1; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_cccf1 AFTER UPDATE ON public.search_docket_tags FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_cccf1();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_cccf1 ON search_docket_tags; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_cccf1 ON public.search_docket_tags IS 'd8a33a2b78a2decf28890b2026a4682a18447cc9';


--
-- Name: search_docket_panel pgtrigger_update_or_delete_snapshot_update_cde02; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_cde02 AFTER UPDATE ON public.search_docket_panel FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_cde02();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_cde02 ON search_docket_panel; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_cde02 ON public.search_docket_panel IS '35a29a72e85fa323509c07252f31be407f36d53b';


--
-- Name: people_db_person_race pgtrigger_update_or_delete_snapshot_update_d9c4d; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_d9c4d AFTER UPDATE ON public.people_db_person_race FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_d9c4d();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_d9c4d ON people_db_person_race; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_d9c4d ON public.people_db_person_race IS 'e9b396c2a7e0eba486ceb421c26e54f6fe9e55ae';


--
-- Name: search_docketentry_tags pgtrigger_update_or_delete_snapshot_update_e280b; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_e280b AFTER UPDATE ON public.search_docketentry_tags FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_e280b();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_e280b ON search_docketentry_tags; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_e280b ON public.search_docketentry_tags IS '1deb034e15b750033fcb98063dc7909f397a8a1c';


--
-- Name: search_courthouse pgtrigger_update_or_delete_snapshot_update_e394a; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_e394a AFTER UPDATE ON public.search_courthouse FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_e394a();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_e394a ON search_courthouse; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_e394a ON public.search_courthouse IS 'b3a38d787937fd3591951860f2bf9fc980f8f87f';


--
-- Name: search_recapdocument_tags pgtrigger_update_or_delete_snapshot_update_e5a2f; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_e5a2f AFTER UPDATE ON public.search_recapdocument_tags FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_e5a2f();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_e5a2f ON search_recapdocument_tags; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_e5a2f ON public.search_recapdocument_tags IS '35c12ee6109930e9bc66a39a51aee8a5f8ffcdf7';


--
-- Name: people_db_retentionevent pgtrigger_update_or_delete_snapshot_update_ef1b8; Type: TRIGGER; Schema: public; Owner: david
--

CREATE TRIGGER pgtrigger_update_or_delete_snapshot_update_ef1b8 AFTER UPDATE ON public.people_db_retentionevent FOR EACH ROW WHEN (((old.id IS DISTINCT FROM new.id) OR (old.date_created IS DISTINCT FROM new.date_created) OR (old.position_id IS DISTINCT FROM new.position_id) OR ((old.retention_type)::text IS DISTINCT FROM (new.retention_type)::text) OR (old.date_retention IS DISTINCT FROM new.date_retention) OR (old.votes_yes IS DISTINCT FROM new.votes_yes) OR (old.votes_no IS DISTINCT FROM new.votes_no) OR (old.votes_yes_percent IS DISTINCT FROM new.votes_yes_percent) OR (old.votes_no_percent IS DISTINCT FROM new.votes_no_percent) OR (old.unopposed IS DISTINCT FROM new.unopposed) OR (old.won IS DISTINCT FROM new.won))) EXECUTE FUNCTION public.pgtrigger_update_or_delete_snapshot_update_ef1b8();


--
-- Name: TRIGGER pgtrigger_update_or_delete_snapshot_update_ef1b8 ON people_db_retentionevent; Type: COMMENT; Schema: public; Owner: david
--

COMMENT ON TRIGGER pgtrigger_update_or_delete_snapshot_update_ef1b8 ON public.people_db_retentionevent IS '52253b9ece6ddd4e044b41b5f840d2e46791fb7a';


--
-- Name: search_docket a2a62b7d002101ae4c4663cdd1dfc075; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT a2a62b7d002101ae4c4663cdd1dfc075 FOREIGN KEY (originating_court_information_id) REFERENCES public.search_originatingcourtinformation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audio_audio audio_audio_docket_id_625f3642919f8934_fk_search_docket_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audio
    ADD CONSTRAINT audio_audio_docket_id_625f3642919f8934_fk_search_docket_id FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audio_audio_panel audio_audio_pa_person_id_afbf0404cefafcc_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audio_panel
    ADD CONSTRAINT audio_audio_pa_person_id_afbf0404cefafcc_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audio_audio_panel audio_audio_panel_audio_id_536de9ffa9ea04fa_fk_audio_audio_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.audio_audio_panel
    ADD CONSTRAINT audio_audio_panel_audio_id_536de9ffa9ea04fa_fk_audio_audio_id FOREIGN KEY (audio_id) REFERENCES public.audio_audio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_attorneyorganizationassociation ef7a9c8bc08ab662925cfaa332ca9777; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganizationassociation
    ADD CONSTRAINT ef7a9c8bc08ab662925cfaa332ca9777 FOREIGN KEY (attorney_organization_id) REFERENCES public.people_db_attorneyorganization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinioncluster_non_participating_judges opinioncluster_id_3d4a71240680b64c_fk_search_opinioncluster_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_non_participating_judges
    ADD CONSTRAINT opinioncluster_id_3d4a71240680b64c_fk_search_opinioncluster_id FOREIGN KEY (opinioncluster_id) REFERENCES public.search_opinioncluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinioncluster_panel opinioncluster_id_7cdb36cb8a6ff7a7_fk_search_opinioncluster_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_panel
    ADD CONSTRAINT opinioncluster_id_7cdb36cb8a6ff7a7_fk_search_opinioncluster_id FOREIGN KEY (opinioncluster_id) REFERENCES public.search_opinioncluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_position people_d_appointer_id_7c550f3cea4ba6cd_fk_people_db_position_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_position
    ADD CONSTRAINT people_d_appointer_id_7c550f3cea4ba6cd_fk_people_db_position_id FOREIGN KEY (appointer_id) REFERENCES public.people_db_position(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_school people_d_is_alias_of_id_331b4e3cdac3b6f9_fk_people_db_school_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_school
    ADD CONSTRAINT people_d_is_alias_of_id_331b4e3cdac3b6f9_fk_people_db_school_id FOREIGN KEY (is_alias_of_id) REFERENCES public.people_db_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_person people_d_is_alias_of_id_53a6eb8a5fb97b64_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_person
    ADD CONSTRAINT people_d_is_alias_of_id_53a6eb8a5fb97b64_fk_people_db_person_id FOREIGN KEY (is_alias_of_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_position people_d_predecessor_id_36032dfa6a12d44c_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_position
    ADD CONSTRAINT people_d_predecessor_id_36032dfa6a12d44c_fk_people_db_person_id FOREIGN KEY (predecessor_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_attorneyorganizationassociation people_db__attorney_id_1f7b59b220e86ae_fk_people_db_attorney_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganizationassociation
    ADD CONSTRAINT people_db__attorney_id_1f7b59b220e86ae_fk_people_db_attorney_id FOREIGN KEY (attorney_id) REFERENCES public.people_db_attorney(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_role people_db__attorney_id_1fd94ceb4f0ff93_fk_people_db_attorney_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_role
    ADD CONSTRAINT people_db__attorney_id_1fd94ceb4f0ff93_fk_people_db_attorney_id FOREIGN KEY (attorney_id) REFERENCES public.people_db_attorney(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_abarating people_db_aba_person_id_79eb41c300a4a376_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_abarating
    ADD CONSTRAINT people_db_aba_person_id_79eb41c300a4a376_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_attorneyorganizationassociation people_db_attorn_docket_id_50e2b6b752e16618_fk_search_docket_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_attorneyorganizationassociation
    ADD CONSTRAINT people_db_attorn_docket_id_50e2b6b752e16618_fk_search_docket_id FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_education people_db_edu_person_id_688c3a0acdae53a1_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_education
    ADD CONSTRAINT people_db_edu_person_id_688c3a0acdae53a1_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_education people_db_edu_school_id_33cc463e2249bc4a_fk_people_db_school_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_education
    ADD CONSTRAINT people_db_edu_school_id_33cc463e2249bc4a_fk_people_db_school_id FOREIGN KEY (school_id) REFERENCES public.people_db_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_partytype people_db_party_party_id_1a614faa135be115_fk_people_db_party_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_partytype
    ADD CONSTRAINT people_db_party_party_id_1a614faa135be115_fk_people_db_party_id FOREIGN KEY (party_id) REFERENCES public.people_db_party(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_partytype people_db_partyt_docket_id_30c09cafa20f361a_fk_search_docket_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_partytype
    ADD CONSTRAINT people_db_partyt_docket_id_30c09cafa20f361a_fk_search_docket_id FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_person_race people_db_per_person_id_2483201f22b91c44_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_person_race
    ADD CONSTRAINT people_db_per_person_id_2483201f22b91c44_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_person_race people_db_person__race_id_12bc59b989c779ea_fk_people_db_race_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_person_race
    ADD CONSTRAINT people_db_person__race_id_12bc59b989c779ea_fk_people_db_race_id FOREIGN KEY (race_id) REFERENCES public.people_db_race(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_politicalaffiliation people_db_pol_person_id_7bca4351a3adeccb_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_politicalaffiliation
    ADD CONSTRAINT people_db_pol_person_id_7bca4351a3adeccb_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_position people_db_pos_person_id_796c042ecbe82b71_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_position
    ADD CONSTRAINT people_db_pos_person_id_796c042ecbe82b71_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_position people_db_pos_school_id_3cd91cb4ec26941a_fk_people_db_school_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_position
    ADD CONSTRAINT people_db_pos_school_id_3cd91cb4ec26941a_fk_people_db_school_id FOREIGN KEY (school_id) REFERENCES public.people_db_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_position people_db_position_court_id_7141eee9b516a894_fk_search_court_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_position
    ADD CONSTRAINT people_db_position_court_id_7141eee9b516a894_fk_search_court_id FOREIGN KEY (court_id) REFERENCES public.search_court(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_retentionevent people_db_position_id_7aa450ceb6309890_fk_people_db_position_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_retentionevent
    ADD CONSTRAINT people_db_position_id_7aa450ceb6309890_fk_people_db_position_id FOREIGN KEY (position_id) REFERENCES public.people_db_position(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_role people_db_role_docket_id_43aa88e5be806103_fk_search_docket_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_role
    ADD CONSTRAINT people_db_role_docket_id_43aa88e5be806103_fk_search_docket_id FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_role people_db_role_party_id_cc149ce69f8a224_fk_people_db_party_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_role
    ADD CONSTRAINT people_db_role_party_id_cc149ce69f8a224_fk_people_db_party_id FOREIGN KEY (party_id) REFERENCES public.people_db_party(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_source people_db_sou_person_id_547e18a17ea79ec1_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_source
    ADD CONSTRAINT people_db_sou_person_id_547e18a17ea79ec1_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_position people_db_supervisor_id_5e670092b0c8d684_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_position
    ADD CONSTRAINT people_db_supervisor_id_5e670092b0c8d684_fk_people_db_person_id FOREIGN KEY (supervisor_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_criminalcount people_party_type_id_3cd2208b7ab7f97f_fk_people_db_partytype_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_criminalcount
    ADD CONSTRAINT people_party_type_id_3cd2208b7ab7f97f_fk_people_db_partytype_id FOREIGN KEY (party_type_id) REFERENCES public.people_db_partytype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people_db_criminalcomplaint people_party_type_id_54695b07d9d95d41_fk_people_db_partytype_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.people_db_criminalcomplaint
    ADD CONSTRAINT people_party_type_id_54695b07d9d95d41_fk_people_db_partytype_id FOREIGN KEY (party_type_id) REFERENCES public.people_db_partytype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docket s_idb_data_id_7696e442c56d310_fk_recap_fjcintegrateddatabase_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT s_idb_data_id_7696e442c56d310_fk_recap_fjcintegrateddatabase_id FOREIGN KEY (idb_data_id) REFERENCES public.recap_fjcintegrateddatabase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_recapdocument_tags se_recapdocument_id_3a0831353b326f45_fk_search_recapdocument_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocument_tags
    ADD CONSTRAINT se_recapdocument_id_3a0831353b326f45_fk_search_recapdocument_id FOREIGN KEY (recapdocument_id) REFERENCES public.search_recapdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_recapdocument searc_docket_entry_id_186f592b9e384e1e_fk_search_docketentry_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocument
    ADD CONSTRAINT searc_docket_entry_id_186f592b9e384e1e_fk_search_docketentry_id FOREIGN KEY (docket_entry_id) REFERENCES public.search_docketentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_originatingcourtinformation searc_ordering_judge_id_143dbe040e3c8895_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_originatingcourtinformation
    ADD CONSTRAINT searc_ordering_judge_id_143dbe040e3c8895_fk_people_db_person_id FOREIGN KEY (ordering_judge_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinionscited search__citing_opinion_id_3b336c39ca8491ca_fk_search_opinion_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscited
    ADD CONSTRAINT search__citing_opinion_id_3b336c39ca8491ca_fk_search_opinion_id FOREIGN KEY (citing_opinion_id) REFERENCES public.search_opinion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinion search__cluster_id_48646dd68699f5d6_fk_search_opinioncluster_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinion
    ADD CONSTRAINT search__cluster_id_48646dd68699f5d6_fk_search_opinioncluster_id FOREIGN KEY (cluster_id) REFERENCES public.search_opinioncluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_bankruptcyinformation search_bankruptcyinf_docket_id_91fa3275_fk_search_do; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_bankruptcyinformation
    ADD CONSTRAINT search_bankruptcyinf_docket_id_91fa3275_fk_search_do FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_citation search_c_cluster_id_c4f8720fbbbd050_fk_search_opinioncluster_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_citation
    ADD CONSTRAINT search_c_cluster_id_c4f8720fbbbd050_fk_search_opinioncluster_id FOREIGN KEY (cluster_id) REFERENCES public.search_opinioncluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_claim search_claim_docket_id_b37171a9_fk_search_docket_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claim
    ADD CONSTRAINT search_claim_docket_id_b37171a9_fk_search_docket_id FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_claim_tags search_claim_tags_claim_id_2cf554b5_fk_search_claim_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claim_tags
    ADD CONSTRAINT search_claim_tags_claim_id_2cf554b5_fk_search_claim_id FOREIGN KEY (claim_id) REFERENCES public.search_claim(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_claim_tags search_claim_tags_tag_id_73b6bd4d_fk_search_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claim_tags
    ADD CONSTRAINT search_claim_tags_tag_id_73b6bd4d_fk_search_tag_id FOREIGN KEY (tag_id) REFERENCES public.search_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_claimhistory search_claimhistory_claim_id_e130e572_fk_search_claim_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_claimhistory
    ADD CONSTRAINT search_claimhistory_claim_id_e130e572_fk_search_claim_id FOREIGN KEY (claim_id) REFERENCES public.search_claim(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_court_appeals_to search_court_appeals_from_court_id_fb09cc1a_fk_search_co; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_court_appeals_to
    ADD CONSTRAINT search_court_appeals_from_court_id_fb09cc1a_fk_search_co FOREIGN KEY (from_court_id) REFERENCES public.search_court(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_court_appeals_to search_court_appeals_to_to_court_id_49ac3d9c_fk_search_court_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_court_appeals_to
    ADD CONSTRAINT search_court_appeals_to_to_court_id_49ac3d9c_fk_search_court_id FOREIGN KEY (to_court_id) REFERENCES public.search_court(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_court search_court_parent_court_id_51ba1d28_fk_search_court_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_court
    ADD CONSTRAINT search_court_parent_court_id_51ba1d28_fk_search_court_id FOREIGN KEY (parent_court_id) REFERENCES public.search_court(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_courthouse search_courthouse_court_id_6528f572_fk_search_court_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_courthouse
    ADD CONSTRAINT search_courthouse_court_id_6528f572_fk_search_court_id FOREIGN KEY (court_id) REFERENCES public.search_court(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docket search_d_referred_to_id_7dfd6952e8d18b8c_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_d_referred_to_id_7dfd6952e8d18b8c_fk_people_db_person_id FOREIGN KEY (referred_to_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docket search_do_assigned_to_id_185a002e3102ceb_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_do_assigned_to_id_185a002e3102ceb_fk_people_db_person_id FOREIGN KEY (assigned_to_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docket search_docke_appeal_from_id_71fecce427985eaf_fk_search_court_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docke_appeal_from_id_71fecce427985eaf_fk_search_court_id FOREIGN KEY (appeal_from_id) REFERENCES public.search_court(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docket_panel search_docket__person_id_a216895387ce4ca_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_panel
    ADD CONSTRAINT search_docket__person_id_a216895387ce4ca_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docket search_docket_court_id_2d2438b2594e74ba_fk_search_court_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket
    ADD CONSTRAINT search_docket_court_id_2d2438b2594e74ba_fk_search_court_id FOREIGN KEY (court_id) REFERENCES public.search_court(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docket_panel search_docket_pa_docket_id_6c92125a7941d19b_fk_search_docket_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_panel
    ADD CONSTRAINT search_docket_pa_docket_id_6c92125a7941d19b_fk_search_docket_id FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docket_tags search_docket_ta_docket_id_22afc0b36b1bbca3_fk_search_docket_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_tags
    ADD CONSTRAINT search_docket_ta_docket_id_22afc0b36b1bbca3_fk_search_docket_id FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docket_tags search_docket_tags_tag_id_2f90416e21d2a5cc_fk_search_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docket_tags
    ADD CONSTRAINT search_docket_tags_tag_id_2f90416e21d2a5cc_fk_search_tag_id FOREIGN KEY (tag_id) REFERENCES public.search_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docketentry search_docketentr_docket_id_77c155ebbf826b3_fk_search_docket_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentry
    ADD CONSTRAINT search_docketentr_docket_id_77c155ebbf826b3_fk_search_docket_id FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docketentry_tags search_docketentry_id_48bcebf60f001801_fk_search_docketentry_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentry_tags
    ADD CONSTRAINT search_docketentry_id_48bcebf60f001801_fk_search_docketentry_id FOREIGN KEY (docketentry_id) REFERENCES public.search_docketentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_docketentry_tags search_docketentry_tag_tag_id_6d9cf14285cf89c9_fk_search_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_docketentry_tags
    ADD CONSTRAINT search_docketentry_tag_tag_id_6d9cf14285cf89c9_fk_search_tag_id FOREIGN KEY (tag_id) REFERENCES public.search_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_originatingcourtinformation search_o_assigned_to_id_1cc909cf580febcc_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_originatingcourtinformation
    ADD CONSTRAINT search_o_assigned_to_id_1cc909cf580febcc_fk_people_db_person_id FOREIGN KEY (assigned_to_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinionscited search_op_cited_opinion_id_69ef5d07ce27b76_fk_search_opinion_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscited
    ADD CONSTRAINT search_op_cited_opinion_id_69ef5d07ce27b76_fk_search_opinion_id FOREIGN KEY (cited_opinion_id) REFERENCES public.search_opinion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinioncluster_non_participating_judges search_opinio_person_id_5b0da1008e3e4e3b_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_non_participating_judges
    ADD CONSTRAINT search_opinio_person_id_5b0da1008e3e4e3b_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinion_joined_by search_opinio_person_id_5e482e9ee34284bc_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinion_joined_by
    ADD CONSTRAINT search_opinio_person_id_5e482e9ee34284bc_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinioncluster_panel search_opinio_person_id_70c55c02599cc568_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster_panel
    ADD CONSTRAINT search_opinio_person_id_70c55c02599cc568_fk_people_db_person_id FOREIGN KEY (person_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinion_joined_by search_opinion__opinion_id_d92788377db9348_fk_search_opinion_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinion_joined_by
    ADD CONSTRAINT search_opinion__opinion_id_d92788377db9348_fk_search_opinion_id FOREIGN KEY (opinion_id) REFERENCES public.search_opinion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinion search_opinion_author_id_a44f4b76b64d99c_fk_people_db_person_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinion
    ADD CONSTRAINT search_opinion_author_id_a44f4b76b64d99c_fk_people_db_person_id FOREIGN KEY (author_id) REFERENCES public.people_db_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinioncluster search_opinioncl_docket_id_14b37923614c0da0_fk_search_docket_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinioncluster
    ADD CONSTRAINT search_opinioncl_docket_id_14b37923614c0da0_fk_search_docket_id FOREIGN KEY (docket_id) REFERENCES public.search_docket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinionscitedbyrecapdocument search_opinionscited_cited_opinion_id_5f0347bb_fk_search_op; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscitedbyrecapdocument
    ADD CONSTRAINT search_opinionscited_cited_opinion_id_5f0347bb_fk_search_op FOREIGN KEY (cited_opinion_id) REFERENCES public.search_opinion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_opinionscitedbyrecapdocument search_opinionscited_citing_document_id_c64b751b_fk_search_re; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_opinionscitedbyrecapdocument
    ADD CONSTRAINT search_opinionscited_citing_document_id_c64b751b_fk_search_re FOREIGN KEY (citing_document_id) REFERENCES public.search_recapdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_parenthetical search_parenthetical_described_opinion_id_ddd408db_fk_search_op; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_parenthetical
    ADD CONSTRAINT search_parenthetical_described_opinion_id_ddd408db_fk_search_op FOREIGN KEY (described_opinion_id) REFERENCES public.search_opinion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_parenthetical search_parenthetical_describing_opinion_i_07864494_fk_search_op; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_parenthetical
    ADD CONSTRAINT search_parenthetical_describing_opinion_i_07864494_fk_search_op FOREIGN KEY (describing_opinion_id) REFERENCES public.search_opinion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_parenthetical search_parenthetical_group_id_00a7def3_fk_search_pa; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_parenthetical
    ADD CONSTRAINT search_parenthetical_group_id_00a7def3_fk_search_pa FOREIGN KEY (group_id) REFERENCES public.search_parentheticalgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_parentheticalgroup search_parenthetical_opinion_id_fd6bb935_fk_search_op; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_parentheticalgroup
    ADD CONSTRAINT search_parenthetical_opinion_id_fd6bb935_fk_search_op FOREIGN KEY (opinion_id) REFERENCES public.search_opinion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_parentheticalgroup search_parenthetical_representative_id_00e5a857_fk_search_pa; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_parentheticalgroup
    ADD CONSTRAINT search_parenthetical_representative_id_00e5a857_fk_search_pa FOREIGN KEY (representative_id) REFERENCES public.search_parenthetical(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_recapdocument_tags search_recapdocument_t_tag_id_1a152aa24561fa85_fk_search_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY public.search_recapdocument_tags
    ADD CONSTRAINT search_recapdocument_t_tag_id_1a152aa24561fa85_fk_search_tag_id FOREIGN KEY (tag_id) REFERENCES public.search_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

