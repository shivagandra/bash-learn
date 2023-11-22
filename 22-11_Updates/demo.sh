#!/bin/bash

# Fetch the latest information from the remote repository
git fetch

new_branch="branch_${latest_tag}"
git checkout -b "$new_branch"

git merge origin/main


echo "New branch $new_branch created based on tag $latest_tag"