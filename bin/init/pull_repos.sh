#!/bin/bash

# Fathom Platform Utils - Pull Repos Script
# This script clones the required fathom-io repositories to the configured directory

set -e  # Exit on any error

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Load configuration
source "$(dirname "$SCRIPT_DIR")/common/config.sh"
load_config "$SCRIPT_DIR"

echo "Pulling Fathom platform repositories"
echo "Target directory: $FATHOM_REPOS_DIR"

# Create repositories directory if it doesn't exist
if [ ! -d "$FATHOM_REPOS_DIR" ]; then
    echo "Creating repositories directory"
    mkdir -p "$FATHOM_REPOS_DIR"
fi

# Change to repositories directory
cd "$FATHOM_REPOS_DIR"

# Convert repositories string to array
repos_array=($FATHOM_REPOSITORIES)

# Clone each repository
for repo_name in "${repos_array[@]}"; do
    if [ -d "$repo_name" ]; then
        echo "Repository $repo_name already exists, pulling latest changes"
        cd "$repo_name"
        git pull origin main || git pull origin master || echo "Failed to pull $repo_name"
        cd ..
    else
        echo "Cloning $FATHOM_GITHUB_ORG/$repo_name"
        if git clone "https://github.com/$FATHOM_GITHUB_ORG/$repo_name.git"; then
            echo "Successfully cloned $repo_name"
        else
            echo "Failed to clone $repo_name"
            echo "Please check if the repository exists and you have access to it"
        fi
    fi
done

echo "Repository pull complete"
echo "Repositories are located in: $FATHOM_REPOS_DIR"
