#!/bin/bash

teams=("Developers" "Designers" "QA" "DevOps")

# Loop with indices
for i in "${!teams[@]}"; do 
    echo "Team $i: ${teams[i]}"
done

# Loop through elements directly
for team in "${teams[@]}"; do 
    echo "Processing $team..."
done