#!/bin/bash
docker exec -it law-postgres psql -U postgres -c "CREATE ROLE django WITH LOGIN PASSWORD 'djangopassword';"

