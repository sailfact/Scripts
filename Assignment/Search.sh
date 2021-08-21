#!/bin/bash

# Search.sh
# Author: Ross Curley
# Script runs search and analysis options for the user

# Functions

findPhrase()
{
    echo "Results for $1"
    echo
    echo
    # Find all lines with the searched word
    grep --color "$1" alerts.csv
    echo 
    echo
}

alertCount()
{
    # Print the number of times each alert status appears
    echo "LOW : "
    grep -c "LOW" alerts.csv
    echo "MEDIUM : "
    grep -c "MEDIUM" alerts.csv
    echo "HIGH : "
    grep -c "HIGH" alerts.csv
    echo "CRITICAL : "
    grep -c "CRITICAL" alerts.csv
}

findWord()
{
    # Find and print lines contanning specific words
    echo "Results for $1"
    echo
    # Find all lines with the searched word
    grep --color " $1 " alerts.csv
    echo 
}

filterStatus()
{
    # Present menu to choice option for each status
    local option=0 
    while [[ $option -ne 5 ]]; do
        echo "------1.LOW"
        echo "------2.MEDIUM"
        echo "------3.HIGH"
        echo "------4.CRITICAL"
        echo "------5.EXIT"

        read -p "------Option > " option

        case $option in 
            1)
                # Show low alerts
                echo "LOW : "
                grep --color "LOW" alerts.csv
            ;;
            2)
                # Show medium alerts
                echo "MEDIUM : "
                grep --color "MEDIUM" alerts.csv
            ;;
            3)
                # Show High alerts
                echo "HIGH : "
                grep --color "HIGH" alerts.csv
            ;;
            4)
                # Show Critical alerts
                echo "CRITICAL : "
                grep --color "CRITICAL" alerts.csv
            ;;
            5)
                # Exit Menu
                echo "Exiting"
            ;;
            *)
                echo "Invalid Option"
            ;;
        esac
    done
}

# Script
# Display menu to user for search options
option=0
while [[ $option -ne 6 ]]; do
    echo "---1. Search Key Phrase"
    echo "---2. Show Alert Count"
    echo "---3. Search Keyword"
    echo "---4. Filter Alert Status"
    echo "---5. Regex"
    echo "---6. Exit"

    read -p "---Option > " option

    case $option in

        1) 
            # Search Key phrase
            read -p "---Enter Key Phrase: " phrase
            findPhrase $phrase
        ;;
        2)
            # Show Alert Count
            alertCount
        ;;
        3)
            # Search specific words
            read -p "---Enter Keyword: " word
            findWord $word
        ;;
        4)
            # Filter Specific Status
            filterStatus
        ;;
        5)
            # Enter Custom REGEX
            read -p "Enter REGEX: " regex
            grep --color "$regex" alerts.csv
        ;;
        6)
            echo "Exiting"
        ;;
        *)  
            # default
            echo "Invalid Option"
        ;;
    esac
done

exit 0