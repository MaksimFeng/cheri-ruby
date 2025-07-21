#!/bin/sh

ARG=${1:-"abcdefghijklmnopqrstuvwxyz"}
ARG2=${2:-"1"}
start_time=$(date +%s)

for letter in $(printf %s $ARG | grep -o .); do
# for letter in $(printf %s 'abcdefghijklmnopqrstuvwxyz' | grep -o .); do
  output_file="test_${letter}_results2.log"
  if [ "$ARG2" -gt 1 ]; then
    output_file="test_${letter}_${ARG2}_results2.log"
  fi 
  > $output_file
  echo "=== Group test_${letter}* ===" >> $output_file
  # construct file name test${letter}_index.txt
  input_file="test${letter}_index.txt"
  # check if the file exists
  if [ ! -f "$input_file" ]; then
	echo "File $input_file does not exist."
	continue
  fi
  # read the file line by line
  counter=1 #$(($ARG2))
  while IFS= read -r file; do
	# if $2 is provided, run from that line to the end and skip the first $2-1 lines
	if [ "$counter" -lt "$ARG2" ]; then
	  counter=$((counter + 1))
	  continue
	fi
	# check if the file exists
	if [ ! -f "$file" ]; then
	  echo "File $file does not exist." >> $output_file
	  continue
	fi
	# run the test and log the output
	# print current timestamp
	echo "=== $(date) ===" 
	echo "----------------$counter-Running $file---------------"
	echo "" >> $output_file
	echo "=== $counter" >> $output_file
	echo "-----------------Running $file---------------" >> $output_file
	(/root/sakuranbo/build/ruby -I./ext/psych -I./enc -I../test/did_you_mean -I./ext \
	-I.ext/riscv64-freebsd -I../lib -I. -I.ext/common -I../tool/lib -I../ext -I../test \
	-r./riscv64-freebsd-fake "$file" -s 3216 --timeout-scale 10 --worker-timeout=100 || {
	  echo "Error running $file" >> $output_file
	  echo "=== runner ===" >> $output_file
	  /root/sakuranbo/build/ruby -I./ext/psych -I./enc -I../test/did_you_mean -I./ext \
	  -I.ext/riscv64-freebsd -I../lib -I. -I.ext/common -I../tool/lib -I../ext -I../test \
	  -r./riscv64-freebsd-fake /root/sakuranbo/build/runnerone.rb -s 3216 --timeout-scale 10 \
	  --worker-timeout=100 "$file"
	}) >> $output_file 2>&1 

	counter=$((counter + 1))
  done < "$input_file"
done

end_time=$(date +%s)
total_time=$((end_time - start_time))
echo "Total time taken: $total_time seconds" >> $output_file
echo "=== End of test_${letter}* ===" >> $output_file
  
  
	# /root/sakuranbo/build/ruby -I./ext -I.ext/riscv64-freebsd -I../lib -I. -I.ext/common -I../tool/lib -I../ext -I../test -r./riscv64-freebsd-fake "$file" -s 3216 --timeout-scale 10 --worker-timeout=100 >> $output_file 2>&1 || echo "Error running $file" >> $output_file
#   find /root/sakuranbo/test -type f -name "test_${letter}*.rb" | sort | while read -r file; do

