#!/bin/sh

# Usage:
#   ./rmfiles.sh < file_list.txt
#   or
#   some_command | ./rmfiles.sh

while IFS= read -r filepath; do
  # Skip blank lines
  [ -z "$filepath" ] && continue

  if [ -f "$filepath" ]; then
    rm "$filepath" && echo "Deleted: $filepath" || echo "Failed to delete: $filepath"
  else
    echo "File not found: $filepath"
  fi
done
