#!/bin/bash

read -p "type name of folder you would like to copy: " foldername

#if the name is a valid directory

if [ -d "$foldername" ]; then
    # copy it to new location
    read -p "type the name of the destination folder: " newFolderName
    cp -r "$foldername" "$newFolderName"
else
    # otherwise, print an error
    echo "I couldn't find that folder"
fi