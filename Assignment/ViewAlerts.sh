#!/bin/bash

# Loop through alerts files in the the Alerts directory

for f in Alerts/*; do 
    echo "$f"
    cat $f
    echo "---"
done

exit 0