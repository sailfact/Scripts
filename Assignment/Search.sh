#!/bin/bash

findPhrase()
{
    echo "Results for {$1}"
    echo
    echo
    # Find all lines with the searched word
    grep -r --color "$1" Alerts/
    echo 
    echo
}

alertCount()
{
    echo "LOW : "
    grep -r -c "LOW" Alerts/
    echo "MEDIUM : "
    grep -r -c "MEDIUM" Alerts/
    echo "HIGH : "
    grep -r -c "HIGH" Alerts/
    echo "CRITICAL : "
    grep -r -c "CRITICAL" Alerts/
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