#!/bin/bash

# Usage: ./sum_test_times.sh log.txt

declare -A class_times

while IFS= read -r line; do
  # Extract class name and time using regex
  if [[ "$line" =~ [[:space:]]([A-Za-z0-9_:]+)#.*=[[:space:]]([0-9]+\.[0-9]+)[[:space:]]s$ ]]; then
    class="${BASH_REMATCH[1]}"
    time="${BASH_REMATCH[2]}"

	# echo "Processing: $line"
	# echo "Class: $class, Time: $time s"

    # Add time to class total
    sum=$(awk "BEGIN {print ${class_times["$class"]:-0} + $time}")
	# echo "Sum for $class: $sum s"
    class_times["$class"]=$sum
  fi
done < "${1:-/dev/stdin}"  # Read from file if given, else stdin

# Output totals, sorted by class name
for class in "${!class_times[@]}"; do
  printf "%-40s %.2f s\n" "$class" "${class_times[$class]}"
done | sort -k2 -n
