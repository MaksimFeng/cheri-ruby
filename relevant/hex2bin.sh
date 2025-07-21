#!/usr/bin/bash

# Convert hex to binary and replace specific patterns in the output file

sed -i 's/0/0000/g' mark_bitsb.log
sed -i 's/1/0001/g' mark_bitsb.log
sed -i 's/2/0010/g' mark_bitsb.log
sed -i 's/3/0011/g' mark_bitsb.log
sed -i 's/4/0100/g' mark_bitsb.log
sed -i 's/5/0101/g' mark_bitsb.log
sed -i 's/6/0110/g' mark_bitsb.log
sed -i 's/7/0111/g' mark_bitsb.log
sed -i 's/8/1000/g' mark_bitsb.log
sed -i 's/9/1001/g' mark_bitsb.log
sed -i 's/a/1010/g' mark_bitsb.log
sed -i 's/b/1011/g' mark_bitsb.log
sed -i 's/c/1100/g' mark_bitsb.log
sed -i 's/d/1101/g' mark_bitsb.log
sed -i 's/e/1110/g' mark_bitsb.log
sed -i 's/f/1111/g' mark_bitsb.log
