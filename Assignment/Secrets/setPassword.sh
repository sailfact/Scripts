#!/bin/bash

# Enter folder name
read -p "Enter folder name : " foldername

# Enter password
read -s -p "Enter password : " password

# Create the folder
mkdir -p "$foldername"

echo $password | sha256sum > $foldername/secret.txt