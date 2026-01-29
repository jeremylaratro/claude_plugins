#!/bin/bash
# Create a feature development folder with proper naming
# Usage: ./create-feature-folder.sh "Feature Description" [project-root]

FEATURE_DESC="$1"
PROJECT_ROOT="${2:-.}"

if [ -z "$FEATURE_DESC" ]; then
    echo "Usage: $0 \"Feature Description\" [project-root]"
    exit 1
fi

# Get current date in required format
DATE=$(date +%d%^b%Y)

# Sanitize feature name: uppercase, underscores, max 30 chars
FEATURE_NAME=$(echo "$FEATURE_DESC" | \
    tr '[:lower:]' '[:upper:]' | \
    tr -cs '[:alnum:]' '_' | \
    sed 's/^_//;s/_$//' | \
    cut -c1-30)

# Remove trailing underscore if present after cut
FEATURE_NAME="${FEATURE_NAME%_}"

FOLDER_NAME="${DATE}_${FEATURE_NAME}"
FULL_PATH="$PROJECT_ROOT/docs/feature_dev/$FOLDER_NAME"

# Create directory
mkdir -p "$FULL_PATH"

# Output the folder name for use by calling scripts
echo "$FOLDER_NAME"
