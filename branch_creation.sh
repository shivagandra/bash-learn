# #!/bin/sh

# # Fetch the latest information from the remote repository
# git fetch

# # Get the SHA1 hash of the latest commit in the local branch
# LOCAL=$(git rev-parse HEAD)

# # Get the SHA1 hash of the latest commit in the remote branch that the current branch is tracking
# REMOTE=$(git rev-parse @{u})

# # Compare the two hashes
# if [ $LOCAL != $REMOTE ]; then
#     echo "A new commit has been detected in the remote branch."

#     # Pull the latest changes
#     git pull

#     # Get the version number from the latest tag
#     VERSION=$(git describe --tags $(git rev-list --tags --max-count=1))

#     # Extract the major and minor version numbers
#     MAJOR_VERSION=$(echo $VERSION | cut -c2- | cut -d. -f1)
#     MINOR_VERSION=$(echo $VERSION | cut -d. -f2)

#     # Increment the major version number
#     NEW_MAJOR_VERSION=$((MAJOR_VERSION + 1))

#     # Construct the new version string
#     NEW_VERSION="V${NEW_MAJOR_VERSION}.0"

#     # Tag the new commit with the new version number
#     git tag $NEW_VERSION

#     # Create a new branch with the same name as the version number
#     git branch $NEW_VERSION
#     git checkout $NEW_VERSION

#     # Push the new tag and the new branch to the remote repository
#     git push --tags
#     git push origin $NEW_VERSION
# else
#     echo "No new commits detected."
# fi




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
    VERSION=$(git describe --tags $(git rev-list --tags --max-count=1) | cut -c5-)

    # Extract the major and minor version numbers
    MAJOR_VERSION=$(echo $VERSION | cut -d. -f1)
    MINOR_VERSION=$(echo $VERSION | cut -d. -f2)

    # Increment the major version number
    NEW_MAJOR_VERSION=$((MAJOR_VERSION + 1))

    # Construct the new version string
    NEW_VERSION="${NEW_MAJOR_VERSION}.0"

    # Construct the new tag and branch names
    NEW_TAG_NAME="V${NEW_VERSION}"
    NEW_BRANCH_NAME="V${NEW_VERSION}"

    # Tag the new commit with the new tag name
    git tag $NEW_TAG_NAME

    # Create a new branch with the new branch name
    git branch $NEW_BRANCH_NAME
    git checkout $NEW_BRANCH_NAME

    # Push the new tag and the new branch to the remote repository
    git push origin $NEW_TAG_NAME
    git push origin $NEW_BRANCH_NAME
else
    echo "No new commits detected."
fi