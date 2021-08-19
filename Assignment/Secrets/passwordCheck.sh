#!/bin/bash

# type password
read -sp "enter secret password :" password

# check password against hash
echo $password | sha256sum -c --quiet --status "Secrets/secret.txt"

if [ $? -eq 0 ]; then
    # set exit code
    code=0
    echo "Access Granted"
elif [ $? -eq 1 ]; then
    # set exitr code
    code=1
    echo "Access Denied"
fi

exit $code