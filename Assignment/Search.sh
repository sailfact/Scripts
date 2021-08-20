#!/bin/bash

findPhrase()
{
    echo "Results for $1"
    echo
    echo
    # Find all lines with the searched word
    grep -r --color "$1" alerts.csv
    echo 
    echo
}

alertCount()
{
    echo "LOW : "
    grep -c "LOW" alerts.csv
    echo "MEDIUM : "
    grep -c "MEDIUM" alerts.csv
    echo "HIGH : "
    grep -c "HIGH" alerts.csv
    echo "CRITICAL : "
    grep -c "CRITICAL" alerts.csv
}

option=0
while [[ $option -ne 5 ]]; do
    echo "---1. Search Key Phrase"
    echo "---2. Show Alert Count"
    echo "---3."
    echo "---4. "
    echo "---5. Exit"

    read -p "---option > " option

    case $option in

        1) 
            # Search Keyword
            read -p "---Enter Key Phrase: " phrase
            findPhrase $phrase
        ;;
        2)
            # Show Alert Count
            alertCount
        ;;
        3)
            
        ;;
        4)

        ;;
        5)
            echo "Exiting"
        ;;
        *)  
            # default
            echo "Invalid Option"
        ;;
    esac
done

exit 0