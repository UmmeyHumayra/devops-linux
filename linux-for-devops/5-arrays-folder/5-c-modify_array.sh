#!/bin/bash

languages=("Bash" "Python")
echo "Original languages: ${languages[@]}"

# Append elements
languages+=("JavaScript" "Java")
echo "After appending: ${languages[@]}"

# Update an element
languages[2]="Ruby"
echo "After updating: ${languages[@]}"

# Remove the third element (index 2)
unset languages[2]
echo "After removing: ${languages[@]}"
