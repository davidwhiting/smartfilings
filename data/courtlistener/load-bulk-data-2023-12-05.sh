#!/bin/bash
set -e
# You must place all uncompressed bulk files in the same directory and set
# environment variable BULK_DIR, BULK_DB_HOST, BULK_DB_USER, BULK_DB_PASSWORD
# NOTES:
# 1. If you have your postgresql instance on a docker service, you need to mount
# the directory where the bulk files are, otherwise you will get this error:
# ERROR:  could not open file No such file or directory
# 2. You may need to grant execute permissions to this file

if [[ -z ${BULK_DIR} ]];
then
echo "Variable having name 'BULK_DIR' is not set. BULK_DIR is where all the unzipped files are."
exit
fi

if [[ -z ${BULK_DB_HOST} ]];
then
echo "Variable having name 'BULK_DB_HOST' is not set."
exit
fi

if [[ -z ${BULK_DB_USER} ]];
then
echo "Variable having name 'BULK_DB_USER' is not set."
exit
fi

if [[ -z ${BULK_DB_PASSWORD} ]];
then
echo "Variable having name 'BULK_DB_PASSWORD' is not set."
exit
fi

# Default from schema is 'courtlistener'
export BULK_DB_NAME=courtlistener
export PGPASSWORD=$BULK_DB_PASSWORD

echo "Loading schema to database: schema-2023-12-05.sql"
psql -f "$BULK_DIR"/schema-2023-12-05.sql --host "$BULK_DB_HOST" --username "$BULK_DB_USER"

echo "Loading courts-2023-12-04.csv to database"
psql --command "COPY public.search_court (
	       id, pacer_court_id, pacer_has_rss_feed, pacer_rss_entry_types, date_last_pacer_contact,
	       fjc_court_id, date_modified, in_use, has_opinion_scraper,
	       has_oral_argument_scraper, position, citation_string, short_name, full_name,
	       url, start_date, end_date, jurisdiction, notes, parent_court_id
	       ) FROM '$BULK_DIR/courts-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading courthouses-2023-12-04.csv to database"
psql --command "COPY public.search_courthouse (id, court_seat, building_name, address1, address2, city, county,
state, zip_code, country_code, court_id) FROM '$BULK_DIR/courthouses-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading court-appeals-to-2023-12-04.csv to database"
psql --command "COPY public.search_court_appeals_to (id, from_court_id, to_court_id) FROM '$BULK_DIR/court-appeals-to-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading dockets-2023-12-04.csv to database"
psql --command "COPY public.search_docket (id, date_created, date_modified, source, appeal_from_str,
	       assigned_to_str, referred_to_str, panel_str, date_last_index, date_cert_granted,
	       date_cert_denied, date_argued, date_reargued,
	       date_reargument_denied, date_filed, date_terminated,
	       date_last_filing, case_name_short, case_name, case_name_full, slug,
	       docket_number, docket_number_core, pacer_case_id, cause,
	       nature_of_suit, jury_demand, jurisdiction_type,
	       appellate_fee_status, appellate_case_type_information, mdl_status,
	       filepath_local, filepath_ia, filepath_ia_json, ia_upload_failure_count, ia_needs_upload,
	       ia_date_first_change, view_count, date_blocked, blocked, appeal_from_id, assigned_to_id,
	       court_id, idb_data_id, originating_court_information_id, referred_to_id
	       ) FROM '$BULK_DIR/dockets-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading originating-court-information-2023-12-04.csv to database"
psql --command "COPY public.search_originatingcourtinformation (
	       id, date_created, date_modified, docket_number, assigned_to_str,
	       ordering_judge_str, court_reporter, date_disposed, date_filed, date_judgment,
	       date_judgment_eod, date_filed_noa, date_received_coa, assigned_to_id,
	       ordering_judge_id
	       ) FROM '$BULK_DIR/originating-court-information-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading fjc-integrated-database-2023-12-04.csv to database"
psql --command "COPY public.recap_fjcintegrateddatabase (
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
	   ) FROM '$BULK_DIR/fjc-integrated-database-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading opinion-clusters-2023-12-04.csv to database"
psql --command "COPY public.search_opinioncluster (
	       id, date_created, date_modified, judges, date_filed,
	       date_filed_is_approximate, slug, case_name_short, case_name,
	       case_name_full, scdb_id, scdb_decision_direction, scdb_votes_majority,
	       scdb_votes_minority, source, procedural_history, attorneys,
	       nature_of_suit, posture, syllabus, headnotes, summary, disposition,
	       history, other_dates, cross_reference, correction, citation_count,
	       precedential_status, date_blocked, blocked, filepath_json_harvard, docket_id,
	       arguments, headmatter
	   ) FROM '$BULK_DIR/opinion-clusters-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

echo "Loading opinions-2023-12-04.csv to database"
psql --command "COPY public.search_opinion (
	       id, date_created, date_modified, author_str, per_curiam, joined_by_str,
	       type, sha1, page_count, download_url, local_path, plain_text, html,
	       html_lawbox, html_columbia, html_anon_2020, xml_harvard,
	       html_with_citations, extracted_by_ocr, author_id, cluster_id
	   ) FROM '$BULK_DIR/opinions-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

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

