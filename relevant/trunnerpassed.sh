#!/bin/bash

# 7 tests, 37 assertions, 0 failures, 0 errors, 0 skips

if [ $# -lt 1 ] || [ ! -f "$1" ]; then
	echo "Usage: $0 <input_file>"
	exit 1
fi

num_tests=0
num_assertions=0
num_failures=0
num_errors=0
num_skips=0

while IFS= read -r line; do
	if echo "$line" | grep -Eq '^[0-9]+ tests, [0-9]+ assertions, [0-9]+ failures, [0-9]+ errors, [0-9]+ skips$'; then
		tests=$(echo "$line" | awk -F'[ ,]+' '{print $1}')
		num_tests=$((num_tests + tests))
		assertions=$(echo "$line" | awk -F'[ ,]+' '{print $3}')
		num_assertions=$((num_assertions + assertions))
		failures=$(echo "$line" | awk -F'[ ,]+' '{print $5}')
		num_failures=$((num_failures + failures))
		errors=$(echo "$line" | awk -F'[ ,]+' '{print $7}')
		num_errors=$((num_errors + errors))
		skips=$(echo "$line" | awk -F'[ ,]+' '{print $9}')
		num_skips=$((num_skips + skips))
	fi
done < "$1"

num_passed=$((num_tests - num_failures - num_errors - num_skips))
echo "Tests passed: $num_passed"
echo "Total tests: $num_tests"
echo "Total assertions: $num_assertions"
echo "Total failures: $num_failures"
echo "Total errors: $num_errors"
echo "Total skips: $num_skips"
