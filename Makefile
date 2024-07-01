default: start

init:
	pg_ctl -D /Volumes/aspen_cove/postgres initdb

### initdb output
#The files belonging to this database system will be owned by user "david".
#This user must also own the server process.
# i.e., david is the superuser

#The database cluster will be initialized with locale "en_US.UTF-8".
#The default database encoding has accordingly been set to "UTF8".
#The default text search configuration will be set to "english".
#initdb: warning: enabling "trust" authentication for local connections

#Start postgres server manually

start:
	pg_ctl -D /Volumes/aspen_cove/postgres -l /Volumes/aspen_cove/logfile start

#From homebrew, create user postgres as superuser
createuser:
	createuser -s postgres

##Login as user postgres
login:
	psql -U postgres -h localhost

## sql commands below
#psql -U postgres -c "CREATE ROLE django WITH LOGIN PASSWORD 'django';"
#psql -U postgres -c "CREATE DATABASE courtlistener WITH TEMPLATE = template0;"
#psql -U postgres -c "ALTER USER postgres password 'postgres';"
