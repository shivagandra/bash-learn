#!/bin/bash

#to check for changes in repository based on commit hash values

# Fetch the latest information from the remote repository
git fetch

# Get the SHA1 hash of the latest commit in the local branch
LOCAL=$(git rev-parse HEAD)

# Get the SHA1 hash of the latest commit in the remote branch that the current branch is tracking
REMOTE=$(git rev-parse @{u})

# Compare the two hashes
if [ $LOCAL = $REMOTE ]; then
    echo "The local branch is up-to-date with the remote branch."
else
    echo "The local branch is behind the remote branch. Please pull the latest changes."
    #pull the latest code from git
    git pull

    #check if the pull was successful
    if [ $? -eq 0 ]; then
        echo "Git pull successful"
    else
        echo "Git pull failed"
    fi
    
fi