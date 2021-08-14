#!/bin/bash

# all sed statements
grep -r "sed " ~/Scripts/portfolio

echo
echo
echo 

# all lines that start with the letter m
grep -r "^m" ~/Scripts/portfolio

echo 
echo 
echo

# all lines that contain three digit numbers
grep -r ".*\d{3}.*" ~/Scripts/portfolio

echo 
echo
echo

# all echo statements with at least three words
grep -r "echo .*([a-zA-Z]+ ){2,}" ~/Scripts/portfolio 

echo
echo
echo

# all lines that would make a good password