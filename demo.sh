# #!/bin/bash

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

#!/bin/bash

version=0
old_commit_hash=$(git rev-parse HEAD)

while true; do
    git fetch
    new_commit_hash=$(git rev-parse HEAD)

    if [ "$old_commit_hash" != "$new_commit_hash" ]; then
        version=$((version + 1))
        branch_name="V1.0.$version"
        git branch $branch_name
        git checkout $branch_name
        git tag -a $branch_name -m "Auto-generated version at $(date)"
        git push origin $branch_name
        old_commit_hash=$new_commit_hash
    fi

    sleep 60
done