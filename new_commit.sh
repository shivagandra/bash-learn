#!/bin/bash

old_commit_hash=$(git rev-parse HEAD)

while true; do
    git fetch
    new_commit_hash=$(git rev-parse HEAD)

    if [ "$old_commit_hash" != "$new_commit_hash" ]; then
        echo "New commit detected"
        old_commit_hash=$new_commit_hash
    fi

    sleep 60
done