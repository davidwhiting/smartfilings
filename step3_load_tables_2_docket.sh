#!/bin/bash
set -e

export BULK_DIR=/Volumes/aspen_cove/data/courtlistener/dockets 
export BULK_DB_HOST=127.0.0.1
export BULK_DB_USER=postgres
export BULK_DB_PASSWORD=postgres

# D efault from schema is 'courtlistener'
export BULK_DB_NAME=courtlistener
export PGPASSWORD=$BULK_DB_PASSWORD

# Function to load file in postgresql

load_file_into_sql() {
	filename=$1
	echo "Loading $filename into SQL..."
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
		       ) FROM '$BULK_DIR/$filename' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"
}

# Loop over a sequence of numbers
# Original loop: 00 to 23

# create start and end values
start_value=0
end_value=23

for i in $(seq -f "%02g" $start_value $end_value); do
	# replaced dockets-2023-12-04.csv with dockets-00 ... dockets-23
	# create the filename
	filename="dockets-$i"
	# call the function
	load_file_into_sql $filename
done 
