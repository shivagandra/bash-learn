#!/bin/bash

# Fetch the latest changes from the remote repository
git fetch

# Get the latest commit hash on the remote branch
old_commit_hash=$(git rev-parse origin/HEAD)

while true; do
    # Fetch the latest changes from the remote repository
    git fetch

    # Get the latest commit hash on the remote branch
    new_commit_hash=$(git rev-parse origin/HEAD)

    if [ "$old_commit_hash" != "$new_commit_hash" ]; then
        echo "New commit detected. Pulling changes..."
        git pull
        old_commit_hash=$new_commit_hash
    fi

    # Wait for a while before the next check
    sleep 60
done