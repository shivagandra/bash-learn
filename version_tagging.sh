#!/bin/sh

# Fetch the latest information from the remote repository
git fetch

# Get the SHA1 hash of the latest commit in the local branch
LOCAL=$(git rev-parse HEAD)

# Get the SHA1 hash of the latest commit in the remote branch that the current branch is tracking
REMOTE=$(git rev-parse @{u})

# Compare the two hashes
if [ $LOCAL != $REMOTE ]; then
    echo "A new commit has been detected in the remote branch."

    # Pull the latest changes
    git pull

    # Get the version number from the latest tag
    VERSION=$(git describe --tags $(git rev-list --tags --max-count=1))

    # Increment the version number
    NEW_VERSION="V$(($(echo $VERSION | cut -c2-)+1)).0"

    # Tag the new commit with the new version number
    git tag $NEW_VERSION

    # Push the new tag to the remote repository
    git push --tags
else
    echo "No new commits detected."
fi