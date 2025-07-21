#!/bin/bash

output="trunnermerged.log"

if [ $# -eq 0 ]; then
	echo "Usage: $0 testlog.txt"
	exit 1
fi

for file in "$@"; do
	if [ ! -f "$file" ]; then
		echo "File '$file' does not exist."
		continue
	fi

	echo "Processing file: $file"
	cat "$file" >> "$output"
done

while IFS= read -r line; do
	# for each line delete the newline and append the next line
	if [[ $line == *" s"* ]]; then
		line=$(echo "$line" | sed 's/ s//')
		echo -n "$line " >> "$output"
		continue
	fi
	sed -i "s/${line}//" "$output"
done < <(egrep '^\[' $output | grep -v '[0-9] s$')

# for file in "$@"; do
# 	if [ ! -f "$file" ]; then
# 		echo "File '$file' does not exist."
# 		continue
# 	fi

# 	echo "Merging file: $file"
# 	cat "$file" >> "$output"
# 	echo "" >> "$output"
# done

