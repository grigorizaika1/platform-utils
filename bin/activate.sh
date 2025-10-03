#!/bin/bash

# Fathom Platform Utils - Activate Script
# This script adds the platform-utils/bin directory to your PATH

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Add the bin directory to PATH if it's not already there
if [[ ":$PATH:" != *":$SCRIPT_DIR:"* ]]; then
    export PATH="$SCRIPT_DIR:$PATH"
    echo "Added $SCRIPT_DIR to PATH"
else
    echo "$SCRIPT_DIR is already in PATH"
fi

# Make the script executable
chmod +x "$SCRIPT_DIR"/*

echo "Fathom platform utilities activated!"
echo "Available commands:"
ls -1 "$SCRIPT_DIR" | grep -v activate.sh | while read cmd; do
    if [[ -x "$SCRIPT_DIR/$cmd" ]]; then
        echo "  - $cmd"
    fi
done
