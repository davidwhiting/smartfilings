default: run

run: 
	docker run --name law-postgres -p 5432:5432 -v .//pgdata://var/lib/postgresql/data -v .//rawdata://var/lib/postgresql/rawdata -e POSTGRES_PASSWORD=legalfilings -d postgres:16.2

alpine: 
	docker run --name law-postgres -p 5432:5432 -v .//pgdata://var/lib/postgresql/data -v .//rawdata://var/lib/postgresql/rawdata -e POSTGRES_PASSWORD=legalfilings -d postgres:16.2-alpine3.19

