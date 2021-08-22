#!/bin/bash

# Scraper.sh
# Author: Ross Curley
# Runs the scraper 

# FUNCTIONS
printError ()
{
    echo -e "\033[31mError:\033[0m $1"
}

# SCRIPT

if [ $# -eq 0 ]; then
    # Scrape www.cyber.gov.au/acsc/view-all-content/alerts
    python3 Scraper.py
    # check if Scraper was Succesfull
    if [ $? -ne 0 ]; then
        printError "Scraper failed to scrape"
    fi
else
    # Scrape www.cyber.gov.au/acsc/view-all-content/alerts
    # with search params supplied from csv file
    file=$1
    i=0
    # test get csv search terms
    read -r line<$file
    python3 Scraper.py $line 
    if [ $? -ne 0 ]; then
        printError "Scraper failed for line : {$line}"
    fi
fi

exit 0
