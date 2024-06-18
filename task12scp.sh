#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_file> <username> <ip_address>"
    exit 1
fi

source_file="$1"
username="$2"
ip_address="$3"

if [ ! -f "$source_file" ]; then
    echo "Error: Source file '$source_file' not found."
    exit 1
fi

echo "Copying $source_file to $username@$ip_address:~/..."
scp "$source_file" "$username@$ip_address":~/

if [ $? -eq 0 ]; then
    echo "File copied successfully using scp."
else
    echo "Failed to copy file using scp."
fi
