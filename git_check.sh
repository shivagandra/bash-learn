#!/bin/bash

#pull the latest code from git
git pull

#check if the pull was successful
if [ $? -eq 0 ]; then
    echo "Git pull successful"
else
    echo "Git pull failed"
fi

#to check for changes in repository based on commit hash values
git fetch
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
else
    echo "Needs a pull"
fi