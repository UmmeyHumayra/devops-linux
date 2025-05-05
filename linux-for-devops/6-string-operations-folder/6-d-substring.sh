#!/bin/bash

str="Muzan Kibutsuji is the first and strongest demon in existence."

# Extract from index 6 (length 7)
substr="${str:6:22}"
echo "Substring: ${substr}"
echo "First 5 chars: ${str:0:5}"
echo "Omitting length: ${str:6}"