#!/bin/bash
set -e

export BULK_DIR=/Volumes/aspen_cove/data/courtlistener 
export BULK_DB_HOST=127.0.0.1
export BULK_DB_USER=postgres
export BULK_DB_PASSWORD=postgres

# Default from schema is 'courtlistener'
export BULK_DB_NAME=courtlistener
export PGPASSWORD=$BULK_DB_PASSWORD

echo "Loading originating-court-information-2023-12-04.csv to database"
psql --command "COPY public.search_originatingcourtinformation (
	       id, date_created, date_modified, docket_number, assigned_to_str,
	       ordering_judge_str, court_reporter, date_disposed, date_filed, date_judgment,
	       date_judgment_eod, date_filed_noa, date_received_coa, assigned_to_id,
	       ordering_judge_id
	       ) FROM '$BULK_DIR/originating-court-information-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"

## Doesn't work

#echo "Loading fjc-integrated-database-2023-12-04.csv to database"
#psql --command "COPY public.recap_fjcintegrateddatabase (
#	       id, date_created, date_modified, dataset_source, office,
#	       docket_number, origin, date_filed, jurisdiction, nature_of_suit,
#	       title, section, subsection, diversity_of_residence, class_action,
#	       monetary_demand, county_of_residence, arbitration_at_filing,
#	       arbitration_at_termination, multidistrict_litigation_docket_number,
#	       plaintiff, defendant, date_transfer, transfer_office,
#	       transfer_docket_number, transfer_origin, date_terminated,
#	       termination_class_action_status, procedural_progress, disposition,
#	       nature_of_judgement, amount_received, judgment, pro_se,
#	       year_of_tape, nature_of_offense, version, circuit_id, district_id
#	   ) FROM '$BULK_DIR/fjc-integrated-database-2023-12-04.csv' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"
