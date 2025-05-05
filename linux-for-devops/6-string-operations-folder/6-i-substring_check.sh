#!/bin/bash

str="Linux is awesome"

if [[ "$str" == *"is"* ]]; then
    echo "Substring found!"
fi

empty_str=""
if [[ -z "$empty_str" ]]; then
    echo "String is empty."
fi 