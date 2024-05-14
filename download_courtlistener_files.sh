#!/bin/bash

# List of URLs
urls=(
https://storage.courtlistener.com/bulk-data/citation-map-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/citations-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/court-appeals-to-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/courthouses-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/courts-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/dockets-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/financial-disclosure-investments-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/financial-disclosures-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/financial-disclosures-agreements-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/financial-disclosures-debts-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/financial-disclosures-gifts-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/financial-disclosures-non-investment-income-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/financial-disclosures-positions-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/financial-disclosures-reimbursements-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/financial-disclosures-spousal-income-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/fjc-integrated-database-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/load-bulk-data-2023-12-05.sh
https://storage.courtlistener.com/bulk-data/opinion-clusters-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/opinions-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/oral-arguments-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/originating-court-information-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/parentheticals-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/people-db-educations-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/people-db-people-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/people-db-political-affiliations-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/people-db-positions-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/people-db-races-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/people-db-retention-events-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/people-db-schools-2023-12-04.csv.bz2
https://storage.courtlistener.com/bulk-data/schema-2023-12-05.sql
)

# Target directory
target_dir="./courtlistener"

# Loop over the URLs
for url in ${urls[@]}; do
    # Extract the filename from the URL
    filename=$(basename $url)
    # Check if the file or its uncompressed version exists in the target directory
    if [[ ! -f "$target_dir/$filename" && ! -f "${target_dir}/${filename%.bz2}" ]]; then
        # If it does not exist, download it with wget
        wget -P $target_dir $url
    fi
done

