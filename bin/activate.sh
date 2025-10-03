#!/bin/bash

# Fathom Platform Utils - Activate Script
# This script adds the platform-utils/bin directory to your PATH

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Load configuration
source "$SCRIPT_DIR/common/config.sh"
load_config "$SCRIPT_DIR"

# Add the bin directory to PATH if it's not already there
if [[ ":$PATH:" != *":$SCRIPT_DIR:"* ]]; then
    export PATH="$SCRIPT_DIR:$PATH"
    echo "Added $SCRIPT_DIR to PATH"
else
    echo "$SCRIPT_DIR is already in PATH"
fi

# Make scripts executable
find "$SCRIPT_DIR" -type f -name "*.sh" -exec chmod +x {} \;

echo "Fathom platform utilities activated"
echo ""

# Show current configuration
show_config

echo ""
echo "Available commands:"
find "$SCRIPT_DIR" -type f -executable -not -name "activate.sh" | while read script; do
    rel_path=$(realpath --relative-to="$SCRIPT_DIR" "$script" 2>/dev/null || echo "$script")
    echo "  - $rel_path"
done

echo ""
echo "To customize settings:"
echo "  1. Copy config/default.conf to config/user.conf"
echo "  2. Edit config/user.conf with your preferences"
echo "  3. Re-run 'source bin/activate.sh' to apply changes"
