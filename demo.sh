#!/bin/bash
git pull
git diff --quiet
if [ $? -eq 1 ]; then
    git tag -a v1.0 -m "Version 1.0"
fi
git push origin master