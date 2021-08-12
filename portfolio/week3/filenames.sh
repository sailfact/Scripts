#!/bin/bash

# check if file was provided
if [ $# -eq 0 ]; then
    echo "please give filename"
    echo "./filename.sh [filename]"
    # exit successfully
    exit 0
fi

file=$1
if [ -e $file ]; then
    # file exists
    while IFS="" read -r line; do
        # read file line by line
        if [ -d $line ]; then
            echo "${line} - That's a directory"
        elif [ -e $line ]; then
            echo "${line} - That file exists"
        else
            echo "${line} - I don't know what that is"
        fi
    done < $file
    exit 0  # exist success
else
    echo "${file} does not exist"
    exit 1 # exit fail
fi
