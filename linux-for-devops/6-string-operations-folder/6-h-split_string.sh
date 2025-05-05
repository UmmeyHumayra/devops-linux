#!/bin/bash 

CSV="apple,banana,grape     hashira,    dragon"
IFS=',' read -ra fruits <<< "$CSV"

echo "First fruit: ${fruits[0]}"
echo "All fruits: ${fruits[@]}"