#!/bin/bash
set -e

export BULK_DIR=/Volumes/aspen_cove/data/courtlistener/opinion-clusters
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
	psql --command "COPY public.search_opinioncluster (
		id, date_created, date_modified, judges, date_filed,
		date_filed_is_approximate, slug, case_name_short, case_name,
		case_name_full, scdb_id, scdb_decision_direction, scdb_votes_majority,
		scdb_votes_minority, source, procedural_history, attorneys,
		nature_of_suit, posture, syllabus, headnotes, summary, disposition,
		history, other_dates, cross_reference, correction, citation_count,
		precedential_status, date_blocked, blocked, filepath_json_harvard, docket_id,
		arguments, headmatter
	) FROM '$BULK_DIR/$filename' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"
}


## looping doesn't work over opinioncluster
## Splitting across lines breaks quoted material here
load_file_into_sql opinion-clusters-2023-12-04.csv

# Loop over a sequence of numbers
# Original loop: 00 to 10

## create start and end values
#start_value=0
#end_value=10
#
#for i in $(seq -f "%02g" $start_value $end_value); do
#	# create the filename
#	filename="opinion-clusters-$i"
#	# call the function
#	load_file_into_sql $filename
#done 
