#!/bin/bash

#This function prints a given error"

printError()
{
    echo -e "\033[31mError:\033[0m $1"
}

# This function will get a value between the 2nd and 3rd arguments

getNumber()
{
    while read -p "$1:" number; do
        if [ $number -lt $2 ] || [ $number -gt $3 ]; then
            printError "Input must be between $2 and $3"
        elif [ $number -eq 42 ]; then
            echo "correct"
            exit 0
        elif [ $number -lt 42 ]; then
            echo "too low"
        elif [ $number -gt 42 ]; then
            echo "too high"
        fi
    done
}

getNumber "Enter a number between 1 and 100" 1 100