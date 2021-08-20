#!/bin/bash
# check password
./Secrets/passwordCheck.sh

# retreive exit code of passwordCheck.sh
case $? in
    # success
    0 )
        option=0
        while [[ $option -ne 5 ]]; do
            echo "1. Run Default Scraper"
            echo "2. Run Custom Scraper"
            echo "3. Edit Custom Scrape"
            echo "4. Set a password"
            echo "5. Exit"

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
                    nano threats.csv
                ;;
                4)
                    # set passwrod
                    ./Secrets/setPassword.sh
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
    ;;
    # fail
    1 )
        echo "Incorrect Password"
        exit 1
    ;;
esac