#! /usr/bin/bash

# Find the largest iteration number from directories starting with 'iter'
LAST_ITER=$(find . -maxdepth 1 -type d -name "iter*" | sed 's/.*iter//' | sort -n | tail -n 1)
if [ -z "$LAST_ITER" ]; then
	LAST_ITER=0
fi

ITER=$((LAST_ITER + 1))
# Check if the current iteration directory already exists
# If it does, we will not proceed with the script
# If it does not exist, we will create a new directory for the current iteration
if [ -d "iter${ITER}" ]; then
	echo "Directory iter${ITER} already exists. Exiting."
	exit 1
fi

if [ ! -z "$1" ]; then
	ITER=$1
fi

cd /cheruby-purecap/src/output/rootfs-riscv64-purecap/research/ruby-3.4.1/build
make clean 
clear 
echo "Current iteration is: $ITER"
make > logs/build.log 2>&1
cd logs

MAKE_OUTPUT="build.log"

# array of all the warnings patterns
PATTERNS=(
	"binary expression on capability types"
	"format specifies type"
	"overflow in expression"
	"shift count >= width of type"
	"non-void function does not return a value"
	"cast from provenance-free integer type"
)

cat $MAKE_OUTPUT | \
	grep 'warning: ' | \
	wc -l

cat $MAKE_OUTPUT | \
	grep 'warning: ' > allwaningssave${ITER}.log

cat $MAKE_OUTPUT | \
	grep 'warning: ' > warnings.log

# Loop through each pattern and save to a file
for pattern in "${PATTERNS[@]}"; do
	first_word=$(echo "$pattern" | cut -d' ' -f1)
	cat warnings.log | \
		grep "$pattern" > "${first_word}${ITER}.log"
	sed -i "/$pattern/d" warnings.log
done

mkdir iter${ITER}
mv *.log iter${ITER}/
