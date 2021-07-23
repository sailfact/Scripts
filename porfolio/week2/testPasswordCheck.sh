#!/bin/bash

test1="hello"

test2="goodbye"

echo "test1 matching pasword"
echo $test1 | ./passwordCheck.sh

if [ $? -eq 0 ]; then
    echo "success"
else
    echo "fail"
fi

echo "test2 non-matchin password"

echo $test2 | ./passwordCheck.sh

if [ $? -eq 1 ]; then
    echo "success"
else
    echo "fail"
fi