#!/bin/bash

# Finished tests in 1.022356s, 0.0000 tests/s, 0.0000 assertions/s.
# 0 tests, 0 assertions, 0 failures, 0 errors, 0 skips

# ruby -v: ruby 3.4.1 (2025-06-14 revision 742e381c9f) +PRISM [riscv64-freebsd]
# end time: 2025-06-21T20:44:42
# ----------------------------------------
# Running test: ../test/ruby/test_file.rb

input="$1"

awk '
{
  # Check for "Running test: ..." pattern
  buffer[NR] = $0
  if ($0 ~ /^Running test: \.\.\//) {
    if (buffer[NR - 6] !~ /Finished tests in/) {
      print previous_line
    }
    previous_line = $0
  }
}
' "$input"
