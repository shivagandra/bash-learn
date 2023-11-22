#!/bin/bash

# Get the latest tag in the repository
latest_tag=$(git describe --tags --abbrev=0)

# Create a new branch based on the latest tag
new_branch="branch_${latest_tag}"
git checkout -b "$new_branch"

# Push the new branch to the remote repository
git push origin "$new_branch"

echo "New branch $new_branch created based on tag $latest_tag"

git checkout main
