#!/bin/bash
set -e

export BULK_DIR=/Volumes/aspen_cove/data/courtlistener 
export BULK_DB_HOST=127.0.0.1
export BULK_DB_USER=postgres
export BULK_DB_PASSWORD=postgres

# Default from schema is 'courtlistener'
export BULK_DB_NAME=courtlistener
export PGPASSWORD=$BULK_DB_PASSWORD

echo "Loading citation-map-2023-12-04.csv to database"
psql --command "COPY public.search_opinionscited (
	       id, depth, cited_opinion_id, citing_opinion_id
	   ) FROM '$BULK_DIR/citation-map-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading citations-2023-12-04.csv to database"
psql --command "COPY public.search_citation (
	       id, volume, reporter, page, type, cluster_id
	   ) FROM '$BULK_DIR/citations-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading parentheticals-2023-12-04.csv to database"
psql --command "COPY public.search_parenthetical (
	       id, text, score, described_opinion_id, describing_opinion_id, group_id
	   ) FROM '$BULK_DIR/parentheticals-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading oral-arguments-2023-12-04.csv to database"
psql --command "COPY public.audio_audio (
	       id, date_created, date_modified, source, case_name_short,
	       case_name, case_name_full, judges, sha1, download_url, local_path_mp3,
	       local_path_original_file, filepath_ia, ia_upload_failure_count, duration,
	       processing_complete, date_blocked, blocked, stt_status, stt_google_response,
	       docket_id
	   ) FROM '$BULK_DIR/oral-arguments-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading people-db-people-2023-12-04.csv to database"
psql --command "COPY public.people_db_person (
	       id, date_created, date_modified, date_completed, fjc_id, slug, name_first,
	       name_middle, name_last, name_suffix, date_dob, date_granularity_dob,
	       date_dod, date_granularity_dod, dob_city, dob_state, dob_country,
	       dod_city, dod_state, dod_country, gender, religion, ftm_total_received,
	       ftm_eid, has_photo, is_alias_of_id
	   ) FROM '$BULK_DIR/people-db-people-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading people-db-schools-2023-12-04.csv to database"
psql --command "COPY public.people_db_school (
	       id, date_created, date_modified, name, ein, is_alias_of_id
	   ) FROM '$BULK_DIR/people-db-schools-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading people-db-positions-2023-12-04.csv to database"
psql --command "COPY public.people_db_position (
	       id, date_created, date_modified, position_type, job_title,
	       sector, organization_name, location_city, location_state,
	       date_nominated, date_elected, date_recess_appointment,
	       date_referred_to_judicial_committee, date_judicial_committee_action,
	       judicial_committee_action, date_hearing, date_confirmation, date_start,
	       date_granularity_start, date_termination, termination_reason,
	       date_granularity_termination, date_retirement, nomination_process, vote_type,
	       voice_vote, votes_yes, votes_no, votes_yes_percent, votes_no_percent, how_selected,
	       has_inferred_values, appointer_id, court_id, person_id, predecessor_id, school_id,
	       supervisor_id
	   ) FROM '$BULK_DIR/people-db-positions-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading people-db-retention-events-2023-12-04.csv to database"
psql --command "COPY public.people_db_retentionevent (
	       id, date_created, date_modified, retention_type, date_retention,
	       votes_yes, votes_no, votes_yes_percent, votes_no_percent, unopposed,
	       won, position_id
	   ) FROM '$BULK_DIR/people-db-retention-events-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading people-db-educations-2023-12-04.csv to database"
psql --command "COPY public.people_db_education (
	       id, date_created, date_modified, degree_level, degree_detail,
	       degree_year, person_id, school_id
	   ) FROM '$BULK_DIR/people-db-educations-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading people-db-political-affiliations-2023-12-04.csv to database"
psql --command "COPY public.people_db_politicalaffiliation (
	       id, date_created, date_modified, political_party, source,
	       date_start, date_granularity_start, date_end,
	       date_granularity_end, person_id
	   ) FROM '$BULK_DIR/people-db-political-affiliations-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading people-db-races-2023-12-04.csv to database"
psql --command "COPY public.people_db_person_race (
	       id, person_id, race_id
	   ) FROM '$BULK_DIR/people-db-races-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading financial-disclosures-2023-12-04.csv to database"
psql --command "COPY public.disclosures_financialdisclosure (
	       id, date_created, date_modified, year, download_filepath, filepath, thumbnail,
	       thumbnail_status, page_count, sha1, report_type, is_amended, addendum_content_raw,
	       addendum_redacted, has_been_extracted, person_id
	   ) FROM '$BULK_DIR/financial-disclosures-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading financial-disclosure-investments-2023-12-04.csv to database"
psql --command "COPY public.disclosures_investment (
	       id, date_created, date_modified, page_number, description, redacted,
	       income_during_reporting_period_code, income_during_reporting_period_type,
	       gross_value_code, gross_value_method,
	       transaction_during_reporting_period, transaction_date_raw,
	       transaction_date, transaction_value_code, transaction_gain_code,
	       transaction_partner, has_inferred_values, financial_disclosure_id
	   ) FROM '$BULK_DIR/financial-disclosure-investments-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading financial-disclosures-positions-2023-12-04.csv to database"
psql --command "COPY public.disclosures_position (
	       id, date_created, date_modified, position, organization_name,
	       redacted, financial_disclosure_id
	   ) FROM '$BULK_DIR/financial-disclosures-positions-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading financial-disclosures-agreements-2023-12-04.csv to database"
psql --command "COPY public.disclosures_agreement (
	       id, date_created, date_modified, date_raw, parties_and_terms,
	       redacted, financial_disclosure_id
	   ) FROM '$BULK_DIR/financial-disclosures-agreements-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading financial-disclosures-non-investment-income-2023-12-04.csv to database"
psql --command "COPY public.disclosures_noninvestmentincome (
	       id, date_created, date_modified, date_raw, source_type,
	       income_amount, redacted, financial_disclosure_id
	   ) FROM '$BULK_DIR/financial-disclosures-non-investment-income-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading financial-disclosures-spousal-income-2023-12-04.csv to database"
psql --command "COPY public.disclosures_spouseincome (
	       id, date_created, date_modified, source_type, date_raw, redacted,
	       financial_disclosure_id
	   ) FROM '$BULK_DIR/financial-disclosures-spousal-income-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading financial-disclosures-reimbursements-2023-12-04.csv to database"
psql --command "COPY public.disclosures_reimbursement (
	       id, date_created, date_modified, source, date_raw, location,
	       purpose, items_paid_or_provided, redacted, financial_disclosure_id
	   ) FROM '$BULK_DIR/financial-disclosures-reimbursements-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading financial-disclosures-gifts-2023-12-04.csv to database"
psql --command "COPY public.disclosures_gift (
	       id, date_created, date_modified, source, description, value,
	       redacted, financial_disclosure_id
	   ) FROM '$BULK_DIR/financial-disclosures-gifts-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading financial-disclosures-debts-2023-12-04.csv to database"
psql --command "COPY public.disclosures_debt (
	       id, date_created, date_modified, creditor_name, description,
	       value_code, redacted, financial_disclosure_id
	   ) FROM '$BULK_DIR/financial-disclosures-debts-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"
