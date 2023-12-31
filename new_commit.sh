#!/bin/bash

# Fetch the latest changes from the remote repository
git fetch

# Get the latest commit hash on the remote branch
old_commit_hash=$(git rev-parse origin/HEAD~1)


# Get the latest commit hash on the remote branch
new_commit_hash=$(git rev-parse origin/HEAD)

if [ "$old_commit_hash" != "$new_commit_hash" ]; then
    echo "New commit detected. "
    #logic for building and packaging the code
fi