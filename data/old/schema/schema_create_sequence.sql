--
-- CREATE SEQUENCE statements
--

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'audio_audio_id_seq'
    )
    THEN
        CREATE SEQUENCE public.audio_audio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'audio_audio_panel_id_seq'
    )
    THEN
        CREATE SEQUENCE public.audio_audio_panel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'audio_audioevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.audio_audioevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'audio_audiopanelevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.audio_audiopanelevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_abarating_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_abarating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_abaratingevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_abaratingevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_attorney_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_attorney_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_attorneyorganization_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_attorneyorganization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_attorneyorganizationassociation_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_attorneyorganizationassociation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_criminalcomplaint_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_criminalcomplaint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_criminalcount_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_criminalcount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_education_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_educationevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_educationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_party_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_party_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_partytype_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_partytype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_person_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_person_race_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_person_race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_personraceevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_personraceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_politicalaffiliation_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_politicalaffiliation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_politicalaffiliationevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_politicalaffiliationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_position_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_positionevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_positionevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_race_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_raceevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_raceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_retentionevent_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_retentionevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_retentioneventevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_retentioneventevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_role_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_school_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_schoolevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_schoolevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_source_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'people_db_sourceevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.people_db_sourceevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_bankruptcyinformation_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_bankruptcyinformation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_bankruptcyinformationevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_bankruptcyinformationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_citation_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_citation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_citationevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_citationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_claim_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_claim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_claim_tags_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_claim_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_claimevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_claimevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_claimhistory_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_claimhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_claimhistoryevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_claimhistoryevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_claimtagsevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_claimtagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_courtevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_courtevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_docket_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_docket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_docket_panel_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_docket_panel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_docket_tags_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_docket_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_docketentry_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_docketentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_docketentry_tags_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_docketentry_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_docketentryevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_docketentryevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_docketentrytagsevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_docketentrytagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_docketevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_docketevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_docketpanelevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_docketpanelevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_dockettagsevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_dockettagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinion_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinion_joined_by_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinion_joined_by_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinioncluster_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinioncluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinioncluster_non_participating_judges_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinioncluster_non_participating_judges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinioncluster_panel_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinioncluster_panel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinionclusterevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinionclusterevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinionclusternonparticipatingjudgesevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinionclusternonparticipatingjudgesevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinionclusterpanelevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinionclusterpanelevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinionevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinionevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinionjoinedbyevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinionjoinedbyevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinionscited_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinionscited_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_opinionscitedbyrecapdocument_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_opinionscitedbyrecapdocument_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_originatingcourtinformation_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_originatingcourtinformation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_originatingcourtinformationevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_originatingcourtinformationevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_parenthetical_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_parenthetical_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_parentheticalgroup_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_parentheticalgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_recapdocument_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_recapdocument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_recapdocument_tags_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_recapdocument_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_recapdocumentevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_recapdocumentevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_recapdocumenttagsevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_recapdocumenttagsevent_pgh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_tag_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_sequences
        WHERE  schemaname = 'public'
        AND    sequencename = 'search_tagevent_pgh_id_seq'
    )
    THEN
        CREATE SEQUENCE public.search_tagevent_pgh_id_seq
            AS integer
            START WITH 1
            INCREMENT BY 1
            NO MINVALUE
            NO MAXVALUE
            CACHE 1;
    END IF;
END $$;


ALTER TABLE public.search_courthouse ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_courthouse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );
ALTER TABLE public.search_courthouseevent ALTER COLUMN pgh_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.search_courthouseevent_pgh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    );
