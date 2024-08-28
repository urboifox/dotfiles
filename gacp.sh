#!/usr/bin/env bash

git add .

default_message="minor adjustments"
default_branch=$(git rev-parse --abbrev-ref HEAD)

if [ $? -ne 0 ]; then
    echo "Please make sure you are in a git repository."
    exit 1
fi

read -p "commit message [$default_message]: " message
read -p "branch [$default_branch]: " branch

[ ! -z $branch ] && git branch | grep $branch && echo "branch $branch does not exist." && exit 1

git commit -m "${message:-$default_message}"

git push origin "${branch:-$default_branch}"

echo "Done"

