#!/usr/bin/bash

# This script sums up all the numbers passed as arguments

sum=0
if [ $# -gt 0 ]; then
	# Handle command-line arguments
	for number in "$@"; do
		if [[ $number =~ ^-?[0-9]+$ ]]; then
			sum=$((sum + number))
		else
			echo "Error: '$number' is not a valid integer." >&2
			exit 1
		fi
	done
else
	# Handle piped input
	while read -r line; do
		# get the number from the line
		number=$(echo "$line" | grep -oE '[0-9]+')
		echo "Processing number: $number"
		# if [[ $number =~ ^-?[0-9]+$ ]]; then
			sum=$((sum + number))
		# else
		# 	echo "Error: '$number' is not a valid integer." >&2
		# 	exit 1
		# fi
	done
fi

echo "The sum is: $sum"
# Exit with success status
exit 0
# End of script		
