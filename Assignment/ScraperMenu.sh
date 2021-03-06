#!/bin/bash

# SearchMenu.sh
# Author: Ross Curley
# Displays CLI menu to the user

# FUNCTIONS
printError ()
{
    echo -e "\033[31mError:\033[0m $1"
}

# SCRIPT

# check password
./Secrets/passwordCheck.sh

# retreive exit code of passwordCheck.sh
case $? in
    # success
    0 )
        option=0
        while [[ $option -ne 7 ]]; do
            echo "1. Run Default Scraper"
            echo "2. Run Custom Scraper"
            echo "3. Edit Custom Scrape"
            echo "4. View Alerts"
            echo "5. Search"
            echo "6. Set a password"
            echo "7. Exit"

            read -p "option > " option

            case $option in

                1) 
                    # Run Regular Scraper
                    ./Scraper.sh &
                ;;
                2)
                    # Run Custom Scraper
                    ./Scraper.sh threats.csv &
                ;;
                3)
                    # Edit threats.csv
                    nano threats.csv
                ;;
                4)
                    # View Alerts
                    cat alerts.csv
                ;;
                5)
                    # Search through alerts
                    ./Search.sh
                ;;
                6)
                    # set passwrod
                    ./Secrets/setPassword.sh
                ;;
                7)
                    echo "Exiting"
                ;;
                *)  
                    # default
                    printError"Invalid Option"
                ;;
            esac
        done
        exit 0
    ;;
    # fail
    1 )
        printError "Incorrect Password"
        exit 1
    ;;
esac