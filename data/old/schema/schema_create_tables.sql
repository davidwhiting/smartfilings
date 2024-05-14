DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'audio_audio'
    )
    THEN
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
    END IF;
END $$;

--
-- CREATE TABLE statements
--


DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'audio_audio_panel'
    )
    THEN
        CREATE TABLE public.audio_audio_panel (
            id integer NOT NULL,
            audio_id integer NOT NULL,
            person_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'audio_audioevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'audio_audiopanelevent'
    )
    THEN
        CREATE TABLE public.audio_audiopanelevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            audio_id integer NOT NULL,
            person_id integer NOT NULL,
            pgh_context_id uuid
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_abarating'
    )
    THEN
        CREATE TABLE public.people_db_abarating (
            id integer NOT NULL,
            date_created timestamp with time zone NOT NULL,
            date_modified timestamp with time zone NOT NULL,
            rating character varying(5) NOT NULL,
            person_id integer,
            year_rated smallint,
            CONSTRAINT people_db_abarating_year_rated_check CHECK ((year_rated >= 0))
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_abaratingevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_attorney'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_attorneyorganization'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_attorneyorganizationassociation'
    )
    THEN
        CREATE TABLE public.people_db_attorneyorganizationassociation (
            id integer NOT NULL,
            attorney_id integer NOT NULL,
            attorney_organization_id integer NOT NULL,
            docket_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_criminalcomplaint'
    )
    THEN
        CREATE TABLE public.people_db_criminalcomplaint (
            id integer NOT NULL,
            name text NOT NULL,
            disposition text NOT NULL,
            party_type_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_criminalcount'
    )
    THEN
        CREATE TABLE public.people_db_criminalcount (
            id integer NOT NULL,
            name text NOT NULL,
            disposition text NOT NULL,
            status smallint NOT NULL,
            party_type_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_education'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_educationevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_party'
    )
    THEN
        CREATE TABLE public.people_db_party (
            id integer NOT NULL,
            date_created timestamp with time zone NOT NULL,
            date_modified timestamp with time zone NOT NULL,
            name text NOT NULL,
            extra_info text NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_partytype'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_person'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_person_race'
    )
    THEN
        CREATE TABLE public.people_db_person_race (
            id integer NOT NULL,
            person_id integer NOT NULL,
            race_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_personevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_personraceevent'
    )
    THEN
        CREATE TABLE public.people_db_personraceevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            person_id integer NOT NULL,
            pgh_context_id uuid,
            race_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_politicalaffiliation'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_politicalaffiliationevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_position'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_positionevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_race'
    )
    THEN
        CREATE TABLE public.people_db_race (
            id integer NOT NULL,
            race character varying(5) NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_raceevent'
    )
    THEN
        CREATE TABLE public.people_db_raceevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            race character varying(5) NOT NULL,
            pgh_context_id uuid,
            pgh_obj_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_retentionevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_retentioneventevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_role'
    )
    THEN
        CREATE TABLE public.people_db_role (
            id integer NOT NULL,
            role smallint,
            date_action date,
            attorney_id integer NOT NULL,
            docket_id integer NOT NULL,
            party_id integer NOT NULL,
            role_raw text NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_school'
    )
    THEN
        CREATE TABLE public.people_db_school (
            id integer NOT NULL,
            date_created timestamp with time zone NOT NULL,
            date_modified timestamp with time zone NOT NULL,
            name character varying(120) NOT NULL,
            ein integer,
            is_alias_of_id integer
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_schoolevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_source'
    )
    THEN
        CREATE TABLE public.people_db_source (
            id integer NOT NULL,
            date_modified timestamp with time zone NOT NULL,
            url character varying(2000) NOT NULL,
            date_accessed date,
            notes text NOT NULL,
            person_id integer,
            date_created timestamp with time zone NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'people_db_sourceevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_bankruptcyinformation'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_bankruptcyinformationevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_citation'
    )
    THEN
        CREATE TABLE public.search_citation (
            id integer NOT NULL,
            volume smallint NOT NULL,
            reporter text NOT NULL,
            page text NOT NULL,
            type smallint NOT NULL,
            cluster_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_citationevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_claim'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_claim_tags'
    )
    THEN
        CREATE TABLE public.search_claim_tags (
            id integer NOT NULL,
            claim_id integer NOT NULL,
            tag_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_claimevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_claimhistory'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_claimhistoryevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_claimtagsevent'
    )
    THEN
        CREATE TABLE public.search_claimtagsevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            claim_id integer NOT NULL,
            pgh_context_id uuid,
            tag_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_court'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_court_appeals_to'
    )
    THEN
        CREATE TABLE public.search_court_appeals_to (
            id integer NOT NULL,
            from_court_id character varying(15) NOT NULL,
            to_court_id character varying(15) NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_courtappealstoevent'
    )
    THEN
        CREATE TABLE public.search_courtappealstoevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            from_court_id character varying(15) NOT NULL,
            pgh_context_id uuid,
            to_court_id character varying(15) NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_courtevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_courthouse'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_courthouseevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_docket'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_docket_panel'
    )
    THEN
        CREATE TABLE public.search_docket_panel (
            id integer NOT NULL,
            docket_id integer NOT NULL,
            person_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_docket_tags'
    )
    THEN
        CREATE TABLE public.search_docket_tags (
            id integer NOT NULL,
            docket_id integer NOT NULL,
            tag_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_docketentry'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_docketentry_tags'
    )
    THEN
        CREATE TABLE public.search_docketentry_tags (
            id integer NOT NULL,
            docketentry_id integer NOT NULL,
            tag_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_docketentryevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_docketentrytagsevent'
    )
    THEN
        CREATE TABLE public.search_docketentrytagsevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            docketentry_id integer NOT NULL,
            pgh_context_id uuid,
            tag_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_docketevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_docketpanelevent'
    )
    THEN
        CREATE TABLE public.search_docketpanelevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            docket_id integer NOT NULL,
            person_id integer NOT NULL,
            pgh_context_id uuid
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_dockettagsevent'
    )
    THEN
        CREATE TABLE public.search_dockettagsevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            docket_id integer NOT NULL,
            pgh_context_id uuid,
            tag_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinion'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinion_joined_by'
    )
    THEN
        CREATE TABLE public.search_opinion_joined_by (
            id integer NOT NULL,
            opinion_id integer NOT NULL,
            person_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinioncluster'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinioncluster_non_participating_judges'
    )
    THEN
        CREATE TABLE public.search_opinioncluster_non_participating_judges (
            id integer NOT NULL,
            opinioncluster_id integer NOT NULL,
            person_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinioncluster_panel'
    )
    THEN
        CREATE TABLE public.search_opinioncluster_panel (
            id integer NOT NULL,
            opinioncluster_id integer NOT NULL,
            person_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinionclusterevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinionclusternonparticipatingjudgesevent'
    )
    THEN
        CREATE TABLE public.search_opinionclusternonparticipatingjudgesevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            opinioncluster_id integer NOT NULL,
            person_id integer NOT NULL,
            pgh_context_id uuid
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinionclusterpanelevent'
    )
    THEN
        CREATE TABLE public.search_opinionclusterpanelevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            opinioncluster_id integer NOT NULL,
            person_id integer NOT NULL,
            pgh_context_id uuid
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinionevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinionjoinedbyevent'
    )
    THEN
        CREATE TABLE public.search_opinionjoinedbyevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            opinion_id integer NOT NULL,
            person_id integer NOT NULL,
            pgh_context_id uuid
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinionscited'
    )
    THEN
        CREATE TABLE public.search_opinionscited (
            id integer NOT NULL,
            cited_opinion_id integer NOT NULL,
            citing_opinion_id integer NOT NULL,
            depth integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_opinionscitedbyrecapdocument'
    )
    THEN
        CREATE TABLE public.search_opinionscitedbyrecapdocument (
            id integer NOT NULL,
            depth integer NOT NULL,
            cited_opinion_id integer NOT NULL,
            citing_document_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_originatingcourtinformation'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_originatingcourtinformationevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_parenthetical'
    )
    THEN
        CREATE TABLE public.search_parenthetical (
            id integer NOT NULL,
            text text NOT NULL,
            score double precision NOT NULL,
            described_opinion_id integer NOT NULL,
            describing_opinion_id integer NOT NULL,
            group_id integer
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_parentheticalgroup'
    )
    THEN
        CREATE TABLE public.search_parentheticalgroup (
            id integer NOT NULL,
            score double precision NOT NULL,
            size integer NOT NULL,
            opinion_id integer NOT NULL,
            representative_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_recapdocument'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_recapdocument_tags'
    )
    THEN
        CREATE TABLE public.search_recapdocument_tags (
            id integer NOT NULL,
            recapdocument_id integer NOT NULL,
            tag_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_recapdocumentevent'
    )
    THEN
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
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_recapdocumenttagsevent'
    )
    THEN
        CREATE TABLE public.search_recapdocumenttagsevent (
            pgh_id integer NOT NULL,
            pgh_created_at timestamp with time zone NOT NULL,
            pgh_label text NOT NULL,
            id integer NOT NULL,
            pgh_context_id uuid,
            recapdocument_id integer NOT NULL,
            tag_id integer NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_tag'
    )
    THEN
        CREATE TABLE public.search_tag (
            id integer NOT NULL,
            date_created timestamp with time zone NOT NULL,
            date_modified timestamp with time zone NOT NULL,
            name character varying(50) NOT NULL
            );
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_tables
        WHERE  schemaname = 'public'
        AND    tablename = 'search_tagevent'
    )
    THEN
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
    END IF;
END $$;


