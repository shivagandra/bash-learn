#!/bin/bash

# Fetch the latest information from the remote repository
git fetch

# Get the latest tag in the repository
latest_tag=$(git describe --tags --abbrev=0)

# Create a new branch based on the latest tag or checkout if it already exists
new_branch="branch_${latest_tag}"
git checkout "$new_branch" 2>/dev/null || git checkout -b "$new_branch"

# Reset the branch to the commit pointed by the latest tag
git reset --hard "$latest_tag"

# Push the updated branch to the remote repository with the -f option to force the push
git push -f origin "$new_branch"

echo "Branch $new_branch updated based on tag $latest_tag"

git checkout main