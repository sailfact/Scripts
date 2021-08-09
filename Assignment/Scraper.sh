#!/bin/bash

# FUNCTIONS
printError ()
{
    echo -e "\033[31mError:\033[0m $1"
}

# SCRIPT

if [ $# -eq 0 ]; then
    printError "No inputs supplied"
    exit 0
fi

file=$1

# test get csv search terms
while IFS=, read p; do
    echo "$p"
done < <(grep "" $1)
