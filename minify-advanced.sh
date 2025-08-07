#!/bin/bash

# Advanced HTML Minification Script for Maple Farm
# This script uses html-minifier-terser for better compression
# Requires: npm install -g html-minifier-terser

echo "Advanced HTML minification with html-minifier-terser..."

# Check if html-minifier-terser is installed
if ! command -v html-minifier-terser &> /dev/null; then
    echo "html-minifier-terser not found. Installing..."
    npm install -g html-minifier-terser
    if [ $? -ne 0 ]; then
        echo "Failed to install html-minifier-terser. Please install Node.js first."
        exit 1
    fi
fi

# Check if input file exists
if [ ! -f "index.readable.html" ]; then
    echo "Error: index.readable.html not found!"
    exit 1
fi

echo "Minifying with html-minifier-terser..."

html-minifier-terser \
    --collapse-whitespace \
    --remove-comments \
    --remove-optional-tags \
    --remove-redundant-attributes \
    --remove-script-type-attributes \
    --remove-tag-whitespace \
    --use-short-doctype \
    --minify-css true \
    --minify-js true \
    --output index.html \
    index.readable.html

if [ $? -eq 0 ]; then
    echo "✅ Advanced minification complete!"
    
    # Show file sizes for comparison
    echo "File size comparison:"
    echo "Original: $(wc -c < index.readable.html) bytes"
    echo "Minified: $(wc -c < index.html) bytes"
    
    # Calculate compression ratio
    original_size=$(wc -c < index.readable.html)
    minified_size=$(wc -c < index.html)
    reduction=$(echo "scale=1; ($original_size - $minified_size) * 100 / $original_size" | bc -l 2>/dev/null || echo "N/A")
    
    echo "Size reduction: ${reduction}%"
else
    echo "❌ Minification failed!"
    exit 1
fi