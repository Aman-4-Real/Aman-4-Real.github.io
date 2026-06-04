#!/bin/bash

# Script to remove polyfill references from all HTML files
echo "Removing polyfill references from HTML files..."

# Find all HTML files (excluding _site and .git directories)
find . -name "*.html" -type f | grep -v "_site" | grep -v ".git" | while read file; do
    echo "Processing: $file"

    # Remove the polyfill script line
    sed -i '/<script defer src="https:\/\/polyfill.io\/v3\/polyfill.min.js?features=es6"><\/script>/d' "$file"

    # Also remove any other polyfill.io references
    sed -i '/polyfill.io/d' "$file"
done

echo "Polyfill removal completed!"