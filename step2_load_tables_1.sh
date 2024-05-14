#!/bin/bash
set -e

export BULK_DIR=/Volumes/aspen_cove/data/courtlistener 
export BULK_DB_HOST=127.0.0.1
export BULK_DB_USER=postgres
export BULK_DB_PASSWORD=postgres

# Default from schema is 'courtlistener'
export BULK_DB_NAME=courtlistener
export PGPASSWORD=$BULK_DB_PASSWORD

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
