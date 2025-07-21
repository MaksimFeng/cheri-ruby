#!/bin/sh

elfctl -e +nocherirevoke miniruby
elfctl -e +nocherirevoke ruby

# exec ./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
# "../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
# --excludes-dir=../test/.excludes --name=!/memory_leak/  ../test/ruby/test_string.rb -s 3216 --timeout-scale 10 --worker-timeout=100

# Ensure test_processed.txt exists
if [ ! -f test_processed.txt ]; then
  echo "Creating test_processed.txt"
  touch test_processed.txt
fi

echo "Creating test_toproc.txt"
tmpfile=$(mktemp)
find ../test -type f -name "*.rb" | while read -r file; do
# Exclude files that are already processed
	if ! grep -Fxq "$file" test_processed.txt; then
		echo "$file" >> "$tmpfile"
	fi
done
mv "$tmpfile" test_toproc.txt
echo "test_toproc.txt $(wc -l < test_toproc.txt) files found."

tmpfile2=$(mktemp)
while IFS= read -r file; do
	# check if the file exists
	if [ ! -f "$file" ]; then
	  echo "File $file does not exist."
	  continue
	fi
	# mark the file as processed if not already present
	if ! grep -Fxq "$file" test_processed.txt; then
	  echo "$file" >> "$tmpfile2"
	fi
	echo "Running test: $file"
	echo "start time: $(date +%Y-%m-%dT%H:%M:%S)"
	./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
	"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
	--excludes-dir=../test/.excludes --name=!/memory_leak/ -s 3216 --timeout-scale 10 --worker-timeout=100 -v $file
	echo "end time: $(date +%Y-%m-%dT%H:%M:%S)"
	echo "----------------------------------------"
done < test_toproc.txt
# Move processed files to test_processed.txt
if [ -s "$tmpfile2" ]; then
  echo "Appending processed files to test_processed.txt"
  cat "$tmpfile2" >> test_processed.txt
  rm "$tmpfile2"
else
  echo "No new files to process."
  rm "$tmpfile2"
fi
