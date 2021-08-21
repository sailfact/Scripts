#!/bin/bash

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
    echo "Results for $1"
    echo
    # Find all lines with the searched word
    grep --color " $1 " alerts.csv
    echo 
}

filterStatus()
{
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
                echo "LOW : "
                grep --color "LOW" alerts.csv
            ;;
            2)
                echo "MEDIUM : "
                grep --color "MEDIUM" alerts.csv
            ;;
            3)
                echo "HIGH : "
                grep --color "HIGH" alerts.csv
            ;;
            4)
                echo "CRITICAL : "
                grep --color "CRITICAL" alerts.csv
            ;;
            5)
                echo "Exiting"
            ;;
            *)
                echo "Invalid Option"
            ;;
        esac
    done
}

option=0
while [[ $option -ne 5 ]]; do
    echo "---1. Search Key Phrase"
    echo "---2. Show Alert Count"
    echo "---3. Search Keyword"
    echo "---4. Filter Alert Status"
    echo "---5. Exit"

    read -p "---Option > " option

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
            read -p "---Enter Keyword: " word
            findWord $word
        ;;
        4)
            filterStatus
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