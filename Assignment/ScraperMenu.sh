#!/bin/bash
# check password
./Secrets/passwordCheck.sh

# retreive exit code of passwordCheck.sh
case $? in
    # success
    0 )
        option=0
        while [ $option -ne 8 ]; do
            echo "1. Create a folder"
            echo "2. Copy a folder"
            echo "3. Set a password"
            echo "8. Exit"

            read -p "option > " option

            case $option in

                1) 
                    # create folder
                    ./folderMaker.sh
                ;;
                2)
                    # copy folder
                    ./folderCopier.sh
                ;;
                3)
                    # set passwrod
                    ./setPassword.sh
                ;;
                4)  
                    # calculator
                    ./simplecalc.sh
                ;;
                5)
                    # create week folders
                    ./megafoldermaker
                ;;
                6)
                    #check files
                    ./filenames.sh filenames.txt
                ;;
                7)
                    #Download file
                    ./internet_downloader.sh
                ;;
                8)
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