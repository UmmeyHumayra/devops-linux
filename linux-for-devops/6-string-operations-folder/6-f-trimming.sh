#!/bin/bash

str="  Trim this string  "

# Method 1: Parameter expansion
shopt -s extglob
trimmed="${str##*( )}"
echo "Trimmed leading spaces from the string $trimmed."
trimmed="${trimmed%%*( )}"
echo "Trimmed leading and trailing spaces from the string $trimmed."

# Methos 2: Using sed
trimmed_sed=$(echo "$str" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
echo "Trimmed with sed: '$trimmed_sed'"