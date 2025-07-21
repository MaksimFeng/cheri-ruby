#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 2 ]; then
  echo "Usage: $0 <dirA> <dirB>"
  exit 1
fi

dirA=$1
dirB=$2

# Ensure both directories exist
if [ ! -d "$dirA" ]; then
  echo "Directory not found: $dirA" >&2
  exit 1
fi
if [ ! -d "$dirB" ]; then
  echo "Directory not found: $dirB" >&2
  exit 1
fi

# Find all .c and .h in dirA
find "$dirA" -type f \( -name '*.c' -o -name '*.h' \) | while read -r fileA; do
  # Compute the path relative to dirA
  rel="${fileA#$dirA/}"
  fileB="$dirB/$rel"

  # Only compare if the counterpart exists
  if [ -f "$fileB" ]; then
    # -q: quiet, just return status
    if ! diff -q "$fileA" "$fileB" >/dev/null; then
      echo "$rel"
	  cp "$fileB" "$fileA"
	  # diff -u "$fileA" "$fileB"
    fi
#   else
#     echo "MISSING in B: $rel"
  fi
done


