# #!/bin/bash

# # Fetch the latest information from the remote repository
# git fetch

# # Check if there are any commits in the repository
# if [ -z "$(git log -1 2>/dev/null)" ]; then
#     echo "No commits found in the repository."
#     exit 1
# fi

# # Get the latest tag in the repository
# latest_tag=$(git describe --tags --abbrev=0 2>/dev/null)

# # If there are no tags, exit the script
# if [ -z "$latest_tag" ]; then
#     echo "No tags found in the repository."
#     exit 1
# fi

# # Get all branches except main
# branches=$(git branch | grep -v "main")

# # Create a new branch based on the latest tag or checkout if it already exists
# new_branch="branch_${latest_tag}"

# if [ -z "$branches" ]; then
#     # If there are no branches other than main, create a new branch
#     git checkout -b "$new_branch"
# else
#     # If there is an existing branch, checkout and reset it
#     git checkout "$new_branch"
#     git reset --hard "$latest_tag"
# fi

# # Push the updated branch to the remote repository with the -f option to force the push
# git push -f origin "$new_branch"

# echo "Branch $new_branch updated based on tag $latest_tag"

# git checkout main

#!/bin/bash

# Fetch the latest information from the remote repository
git fetch

# Check if there are any commits in the repository
if [ -z "$(git log -1 2>/dev/null)" ]; then
    echo "No commits found in the repository."
    exit 1
fi

# Get the latest tag in the repository
latest_tag=$(git describe --tags --abbrev=0 2>/dev/null)

# If there are no tags, exit the script
if [ -z "$latest_tag" ]; then
    echo "No tags found in the repository."
    exit 1
fi

# Create a new branch based on the latest tag or checkout if it already exists
echo "New Branch Name: "
read new_branch

# Check if the branch exists
if git show-ref --verify --quiet refs/heads/"$new_branch"; then
    # If the branch exists, checkout and reset it
    git checkout "$new_branch"
    git reset --hard "$latest_tag"
else
    # If the branch does not exist, create a new branch
    git checkout -b "$new_branch"
    if [ $? -eq 0 ]; then
        # Push the updated branch to the remote repository with the -f option to force the push
        git push -f origin "$new_branch"

        echo "Branch $new_branch updated based on tag $latest_tag"

        # Delete the tag locally and in the remote repository
        git tag -d "$latest_tag"
        git push origin :refs/tags/"$latest_tag"

        echo "Tag $latest_tag deleted"
    else
        echo "Failed to create branch - $new_branch"
        exit 1
    fi
fi

git checkout main