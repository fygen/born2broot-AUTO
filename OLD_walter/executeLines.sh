#!/bin/bash

function prompt_execute() {
    read -p "Do you want to execute: $1? (y/n): " answer 
    if [ "$answer" != "${answer#[Yy]}" ]; then
        eval "$1"
    else
        echo "Skipping..."
    fi
}

$user=$(who | cut -d ' ' -f1)

# Source the functions file
# source funcs.sh
echo "Executing commands from file: $1"

# Read each line from the file using a for loop
IFS=$'\n'  # Set IFS to newline
for line in $(<"$1"); do
    prompt_execute "$line"
done