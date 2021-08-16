#!/bin/bash

# FUNCTIONS
printError ()
{
    echo -e "\033[31mError:\033[0m $1"
}

# SCRIPT

if [ $# -eq 0 ]; then
    # Scrape www.cyber.gov.au/acsc/view-all-content/alerts
    python Scraper.py
else
    # Scrape www.cyber.gov.au/acsc/view-all-content/alerts
    # with search params supplied from csv file
    file=$1
    i=0
    # test get csv search terms
    while IFS=, read p; do
        echo "$p"
        python Scraper.py $p $i
        i++
    done < <(grep "" $1)
fi

exit 0
