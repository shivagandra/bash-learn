#!/bin/bash
git pull
git diff --quiet
if [ $? -eq 1 ]; then
    git tag -a v1.2 -m "Version 1.0"
fi
git push origin main

# this is to check
# while true; do
#     git fetch
#     changes=$(git diff HEAD FETCH_HEAD)

#     if [ -n "$changes" ]; then
#         branch_name="version-$(date +%Y%m%d%H%M%S)"
#         git branch $branch_name
#         git checkout $branch_name
#         git tag -a $branch_name -m "Auto-generated version at $(date)"
#         git push origin $branch_name
#     fi

#     sleep 60
# done
# #!/bin/bash
# version=0

# while true; do
#     git fetch
#     changes=$(git diff HEAD FETCH_HEAD)

#     if [ -n "$changes" ]; then
#         branch_name="version-$(version + 1)"
#         version=$((version + 1))
#         git branch $branch_name
#         git checkout $branch_name
#         git tag -a $branch_name -m "Auto-generated version at $(date)"
#         git push origin $branch_name
#     fi

#     sleep 60
# done

# #!/bin/bash

# version=0
# old_commit_hash=$(git rev-parse HEAD)

# while true; do
#     git fetch
#     new_commit_hash=$(git rev-parse HEAD)

#     if [ "$old_commit_hash" != "$new_commit_hash" ]; then
#         version=$((version + 1))
#         branch_name="V1.0.$version"
#         git branch $branch_name
#         git checkout $branch_name
#         git tag -a $branch_name -m "Auto-generated version at $(date)"
#         git push origin $branch_name
#         old_commit_hash=$new_commit_hash
#     fi

#     sleep 60
# done
