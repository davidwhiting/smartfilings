#!/bin/bash

###################################################
## INITIALIZATION AND SETUP                      ##
## This implementation assumes homebrew on a mac ##
###################################################

# sql commands below
#psql -U postgres -c "CREATE ROLE django WITH LOGIN PASSWORD 'django';"
psql -U postgres -c "CREATE DATABASE courtlistener WITH TEMPLATE = template0;"