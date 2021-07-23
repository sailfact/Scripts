#!/bin/bash

# check password
./passwordCheck.sh

case $? in

    0 )
        echo "1.Create a folder"
        echo "2.Copy a folder"
        echo "3.Set a password"

        read -p "option : " option

        case $option in

            1)
                ./folderMaker.sh
            ;;
            2)
                ./folderCopier.sh
            ;;
            3)
                ./setPassword.sh
            ;;
            *)
                echo "Invalid Option"
            ;;
        
        esac
        ;;
    1 )
        echo "Incorrect Password"
        ;;

esac