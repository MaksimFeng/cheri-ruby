#!/bin/bash

# Recursively finds all *.c and *.h files.
# Extracts one-line constant macros (ignores multi-line or function-like macros).
# Outputs the unique set of macros.

find . -type f \( -name "*.c" -o -name "*.h" \) \
    -exec grep -hE '^[[:space:]]*#define[[:space:]]+[A-Za-z_][A-Za-z0-9_]*([[:space:]]+.+)?$' {} + \
| grep -vE '\\$' \
| grep -vE '#define[[:space:]]+[A-Za-z_][A-Za-z0-9_]*\(' \
| sed -E 's/^[[:space:]]*#define[[:space:]]+([A-Za-z_][A-Za-z0-9_]*).*$/\1/' \
| sort -u
