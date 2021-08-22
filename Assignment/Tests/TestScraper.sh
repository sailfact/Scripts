#!/bin/bash

# TestScraper.sh
# Isolates and tests all options for Python Script

TESTS=0
PASS=0
FAIL=0

#test default scraper
TESTS=$(( TESTS + 1 ))
python ../Scraper.py

if [ $? -eq 0 ]; then
    echo "Scraper Passed"
    PASS=$(( PASS + 1 ))
else
    echo "Scraper Failed"
    FAIL=$(( FAIL +1 ))
fi

#test custom Scraper
TESTS=$(( TESTS + 1))
# all alerts for the government containing DDOS in title
python ../Scraper.py G,W,DDoS,,,,DESC

if [ $? -eq 0 ]; then
    echo "Scraper Passed"
    PASS=$(( PASS + 1 ))
else
    echo "Scraper Failed"
    FAIL=$(( FAIL +1 ))
fi
cat alerts.csv

#test custom Scraper with blank search
TESTS=$(( TESTS + 1))

python ../Scraper.py ,,,,,,

if [ $? -eq 0 ]; then
    echo "Scraper Passed"
    PASS=$(( PASS + 1 ))
else
    echo "Scraper Failed"
    FAIL=$(( FAIL +1 ))
fi
head alerts.csv

#test custom Scraper with invalid search options
TESTS=$(( TESTS + 1))

python ../Scraper.py 4,5,"""",*,4,},{}

if [ $? -eq 0 ]; then
    echo "Scraper Passed"
    PASS=$(( PASS + 1 ))
else
    echo "Scraper Failed"
    FAIL=$(( FAIL +1 ))
fi

#test custom Scraper with not enough Options
TESTS=$(( TESTS + 1))

python ../Scraper.py G,W,

if [ $? -eq 1 ]; then
    echo "Scraper Succefully Failed"
    PASS=$(( PASS + 1 ))
else
    echo "Scraper Unsuccessfully Failed"
    FAIL=$(( FAIL +1 ))
fi

#test custom Scraper with too many Options
TESTS=$(( TESTS + 1))
python ../Scraper.py G,W,DDoS,,,,DESC,e,a

if [ $? -eq 0 ]; then
    echo "Scraper Passed"
    PASS=$(( PASS + 1 ))
else
    echo "Scraper Failed"
    FAIL=$(( FAIL +1 ))
fi

echo "Test : $TESTS"
echo "Passes : $PASS"
echo "Fails: $FAIL"

exit 0 