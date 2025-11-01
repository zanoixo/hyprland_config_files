#!/bin/bash

file="moveFiles.txt"

if [ ! -f "$file" ]; then
    echo "File not found: $file"
    exit 1
fi

while IFS= read -r folder; do
	cp -R "$folder" ./
    
done < "$file"
