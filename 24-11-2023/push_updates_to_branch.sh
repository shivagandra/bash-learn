#!/bin/bash

# Create a new branch (optional)
git checkout -b deploy

# Stage changes
git add .

# Commit changes
git commit -m "Branch for Deployment"

# Push changes
git push origin HEAD~1:branch_name
