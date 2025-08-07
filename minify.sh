#!/bin/bash

# HTML Minification Script for Maple Farm
# This script minifies index.readable.html to create index.min.html

echo "Starting minification process..."

# Check if input file exists
if [ ! -f "index.readable.html" ]; then
    echo "Error: index.readable.html not found!"
    exit 1
fi

# Create minified version using sed and tr commands
# This approach works without external dependencies

# Step 1: Remove comments, extra whitespace, and newlines
echo "Minifying HTML..."

cat index.readable.html | \
# Remove HTML comments
sed 's/<!--.*-->//g' | \
# Remove leading/trailing whitespace from each line
sed 's/^[[:space:]]*//g' | \
sed 's/[[:space:]]*$//g' | \
# Remove empty lines
sed '/^$/d' | \
# Join all lines into one (remove newlines between tags)
tr -d '\n' | \
# Add back necessary spaces between attributes and after closing tags
sed 's/></> </g' | \
# Remove extra spaces (multiple spaces become single space)
sed 's/[[:space:]]\+/ /g' | \
# Remove spaces around = in attributes
sed 's/ = /=/g' | \
sed 's/= /=/g' | \
sed 's/ =/=/g' | \
# Remove spaces before closing >
sed 's/ >/>/g' | \
# Remove spaces after opening <
sed 's/< /</g' | \
# Final cleanup - remove any remaining multiple spaces
tr -s ' ' > index.min.html

# Add newline at end of file
echo >> index.min.html

echo "Minification complete!"

# Show file sizes for comparison
echo "File size comparison:"
echo "Original: $(wc -c < index.readable.html) bytes"
echo "Minified: $(wc -c < index.min.html) bytes"

# Calculate compression ratio
original_size=$(wc -c < index.readable.html)
minified_size=$(wc -c < index.min.html)
reduction=$(echo "scale=1; ($original_size - $minified_size) * 100 / $original_size" | bc -l 2>/dev/null || echo "N/A")

echo "Size reduction: ${reduction}%"

echo "✅ index.min.html created successfully!"