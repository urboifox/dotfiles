#!/usr/bin/env bash

# Add all changes to staging
git add .

# Default values
default_message="minor adjustments"
default_branch=$(git rev-parse --abbrev-ref HEAD)

# Check if we are in a Git repository
if [ $? -ne 0 ]; then
    echo "Please make sure you are in a git repository."
    exit 1
fi

# Prompt for commit message
read -p "Commit message [$default_message]: " message
# Use default message if no input is provided
message=${message:-$default_message}

# Prompt for branch
read -p "Branch [$default_branch]: " branch
# Use default branch if no input is provided
branch=${branch:-$default_branch}

# Validate the branch
if ! git rev-parse --verify "$branch" >/dev/null 2>&1; then
    echo "Branch $branch does not exist."
    exit 1
fi

# Commit changes
git commit -m "$message"

# Push changes
git push origin "$branch"

echo "Done"

