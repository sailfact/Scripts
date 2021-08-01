#!/bin/bash

declare -a fruit=("APPLE"  "MANGO" "STRAWBERRY" "ORANGE" "BANANA")

for i in "${fruit[@]}"
do
    echo "FRUIT: $i"
done