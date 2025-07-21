#!/bin/bash

# Usage: ./compare_files.sh file_list.txt /path/to/base_dir1 /path/to/base_dir2

LIST_FILE="$1"
DIR1="$2"
DIR2="$3"

if [[ -z "$LIST_FILE" || -z "$DIR1" || -z "$DIR2" ]]; then
    echo "Usage: $0 file_list.txt /path/to/base_dir1 /path/to/base_dir2"
    exit 1
fi

while IFS= read -r rel_path; do
    FILE1="$DIR1/$rel_path"
    FILE2="$DIR2/$rel_path"

    if [[ ! -f "$FILE1" ]]; then
        echo "Missing in $DIR1: $rel_path"
        continue
    fi
    if [[ ! -f "$FILE2" ]]; then
        echo "Missing in $DIR2: $rel_path"
        continue
    fi

    echo "Comparing: $rel_path"
    diff --color=always "$FILE1" "$FILE2"
    echo "-------------------------"
done < "$LIST_FILE"
