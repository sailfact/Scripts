#!/bin/bash

# prompt user

while [ "$prompt" != "exit" ]; do
    echo "type 'exit' to quit"
    read -p "enter URL for download > " prompt
    if [ "$prompt" != "exit" ]; then 
        url=$prompt
        read -p "enter download location > " dl_location
        wget $url -P $dl_location --quiet
        # check if successful
        echo #space
        case $? in
        0 )
            echo "Download Successful"
        ;;
        1 )
            echo "Download Failed"
        ;;
        2)
            echo "Download Failed"
            echo "Parse error—for instance, when parsing command-line options, the ‘.wgetrc’ or ‘.netrc’..."
        ;;
        3)  
            echo "Download Failed"
            echo "File I/O error"
        ;;
        4)
            echo "Download Failed"
            echo "Network failure"
        ;;
        5)
            echo "Download Failed"
            echo "SL verification failure"
        ;;
        6)
            echo "Download Failed"
            echo "Username/password authentication failure"
        ;;
        7)
            echo "Download Failed"\
            echo "Protocol errors"
        ;;
        8)
            echo "Download Failed"
            echo "Server issued an error response"
        ;;
        esac
    fi
done