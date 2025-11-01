#!/bin/bash
file="moveFiles.txt"
user="zan"
group="users"

mapfile -t destinations < "$file"

for dest in "${destinations[@]}"; do

    src="$(basename "$dest")"  # get folder name from current dir
    if [ ! -e "$src" ]; then
        echo "Skipping $src: not found in current directory"
        continue
    fi

    parent_dir="$(dirname "$dest")"
    if [ ! -d "$parent_dir" ]; then
        echo "Skipping $src: parent directory missing ($parent_dir)"
        continue
    fi

    # Remove existing destination folder entirely
    if [ -e "$dest" ]; then
        rm -rf "$dest"
    fi

    # Copy source folder to destination
    cp -R "$src" "$dest"

    # Set ownership
    chown -R "$user:$group" "$dest"

    echo "Copied and replaced $src → $dest"
done
