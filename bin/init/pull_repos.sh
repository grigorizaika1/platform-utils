#!/bin/bash

# Fathom Platform Utils - Pull Repos Script
# This script clones the required fathom-io repositories to platform-repos

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Navigate to the platform-repos directory (relative to script location)
PLATFORM_REPOS_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")/platform-repos"

echo -e "${YELLOW}Pulling Fathom platform repositories...${NC}"
echo "Target directory: $PLATFORM_REPOS_DIR"

# Create platform-repos directory if it doesn't exist
if [ ! -d "$PLATFORM_REPOS_DIR" ]; then
    echo -e "${YELLOW}Creating platform-repos directory...${NC}"
    mkdir -p "$PLATFORM_REPOS_DIR"
fi

# Change to platform-repos directory
cd "$PLATFORM_REPOS_DIR"

# List of repositories to clone
repos=(
    "fathom-io/data-ingestion"
    "fathom-io/platform-backend"
)

# Clone each repository
for repo in "${repos[@]}"; do
    repo_name=$(basename "$repo")
    
    if [ -d "$repo_name" ]; then
        echo -e "${YELLOW}Repository $repo_name already exists, pulling latest changes...${NC}"
        cd "$repo_name"
        git pull origin main || git pull origin master || echo -e "${RED}Failed to pull $repo_name${NC}"
        cd ..
    else
        echo -e "${GREEN}Cloning $repo...${NC}"
        if git clone "https://github.com/$repo.git"; then
            echo -e "${GREEN}Successfully cloned $repo${NC}"
        else
            echo -e "${RED}Failed to clone $repo${NC}"
            echo "Please check if the repository exists and you have access to it"
        fi
    fi
done

echo -e "${GREEN}Platform repository pull complete!${NC}"
echo "Repositories are located in: $PLATFORM_REPOS_DIR"
