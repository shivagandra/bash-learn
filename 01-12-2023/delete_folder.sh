#!/bin/bash

#to delte a specific version folder of the website

# Specify the Apache document root and the version folder to delete
DOCUMENT_ROOT="/var/www/html"

#here the version folder name should be read from the user
VERSION_FOLDER="your_version_folder"

# Check if the version folder exists
if [ -d "$DOCUMENT_ROOT/$VERSION_FOLDER" ]; then
    # Remove the version folder and its contents forcefully
    rm -rf "$DOCUMENT_ROOT/$VERSION_FOLDER"
    echo "Version folder '$VERSION_FOLDER' deleted successfully."
else
    echo "Version folder '$VERSION_FOLDER' not found."
fi
