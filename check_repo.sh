#!/bin/bash

# Define your GitHub username and repository name
username="shivagandra"
repo_name="bash-learn"

# Define the branch you want to check
branch="main"

# Get the current commit ID
current_commit=$(git rev-parse HEAD)

# Fetch information about the latest commit from the GitHub API
latest_commit=$(curl -s "https://api.github.com/repos/$username/$repo_name/commits/$branch" | grep -o '"sha": "[^"]*' | cut -d'"' -f4)

# Compare the commit IDs
if [ "$current_commit" != "$latest_commit" ]; then
    echo "A new commit detected!"
    git pull
    # You can add additional actions here if a new commit is detected
else
    echo "No new commits."
fi
