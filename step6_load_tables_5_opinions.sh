#!/bin/bash
set -e

export BULK_DIR=/Volumes/aspen_cove/data/courtlistener/opinions
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
	psql --command "COPY public.search_opinion (
		id, date_created, date_modified, author_str, per_curiam, joined_by_str,
		type, sha1, page_count, download_url, local_path, plain_text, html,
		html_lawbox, html_columbia, html_anon_2020, xml_harvard,
		html_with_citations, extracted_by_ocr, author_id, cluster_id
		) FROM '$BULK_DIR/$filename' WITH (FORMAT csv, ENCODING utf8, HEADER)" --host "$BULK_DB_HOST" --username "$BULK_DB_USER" --dbname "$BULK_DB_NAME"
}

## looping doesn't work over opinions
## Splitting across lines breaks quoted material here
load_file_into_sql opinions-2023-12-04.csv

## Loop over a sequence of numbers
## Original loop: 000 to 224
#
## create start and end values
#start_value=0
#end_value=1
#
#for i in $(seq -f "%03g" $start_value $end_value); do
#	# create the filename
#	filename="opinions-$i"
#	# call the function
#	load_file_into_sql $filename
#done 
