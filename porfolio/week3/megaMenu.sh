#!/bin/bash
# check password
./passwordCheck.sh

# retreive exit code of passwordCheck.sh
case $? in
    # sucess
    0 )
        echo "1.Create a folder"
        echo "2.Copy a folder"
        echo "3.Set a password"

        read -p "option : " option

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
            *)  
                # default
                echo "Invalid Option"
            ;;
        
        esac
    ;;
    # fail
    1 )
        echo "Incorrect Password"
    ;;

esac