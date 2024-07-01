#!/bin/bash
set -e

export BULK_DIR=/Volumes/aspen_cove/data
export BULK_DB_HOST=127.0.0.1
export BULK_DB_USER=postgres
export BULK_DB_PASSWORD=postgres
# You must place all uncompressed bulk files in the same directory and set
# environment variable BULK_DIR, BULK_DB_HOST, BULK_DB_USER, BULK_DB_PASSWORD
# NOTES:
# 1. If you have your postgresql instance on a docker service, you need to mount
# the directory where the bulk files are, otherwise you will get this error:
# ERROR:  could not open file No such file or directory
# 2. You may need to grant execute permissions to this file

# Default from schema is 'courtlistener'
export BULK_DB_NAME=courtlistener
export PGPASSWORD=$BULK_DB_PASSWORD

#export BULK_DIR=/Volumes/aspen_cove/data/courtlistener 
#echo "Loading schema to database: schema-2023-12-05.sql"
#psql -f "$BULK_DIR"/schema-2023-12-05.sql --host "$BULK_DB_HOST" --username "$BULK_DB_USER"

export BULK_DIR=/Volumes/aspen_cove/smartfilings/courtlistener

echo "Loading schema to database: schema_1_create_tables.sql"
psql -f "$BULK_DIR"/schema_1_create_tables.sql --host "$BULK_DB_HOST" --username "$BULK_DB_USER"

#echo "Loading schema to database: schema_2_set_primary_unique_keys.sql"
#psql -f "$BULK_DIR"/schema_2_set_primary_unique_keys.sql --host "$BULK_DB_HOST" --username "$BULK_DB_USER"
#
#echo "Loading schema to database: schema_3_create_index.sql"
#psql -f "$BULK_DIR"/schema_3_create_index.sql --host "$BULK_DB_HOST" --username "$BULK_DB_USER"
#
#echo "Loading schema to database: schema_4_set_default.sql"
#psql -f "$BULK_DIR"/schema_4_set_default.sql --host "$BULK_DB_HOST" --username "$BULK_DB_USER"
#
#echo "Loading schema to database: schema_5_foreign_keys.sql"
#psql -f "$BULK_DIR"/schema_5_foreign_keys.sql --host "$BULK_DB_HOST" --username "$BULK_DB_USER"
