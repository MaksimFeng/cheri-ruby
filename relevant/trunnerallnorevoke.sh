#!/bin/sh

elfctl -e +nocherirevoke miniruby

echo "start time: $(date +%Y-%m-%dT%H:%M:%S)"
echo "Running tests with miniruby without cherirevoke..."

# exec ./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
# "../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
# --excludes-dir=../test/.excludes --name=!/memory_leak/  ../test/ruby/test_string.rb -s 3216 --timeout-scale 10 --worker-timeout=100

# ./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
# "../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
# --excludes-dir=../test/.excludes --name=!/memory_leak/ -s 3216 --timeout-scale 10 --worker-timeout=100 \
# -v --test-order=alpha  

./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
--excludes-dir=../test/.excludes --name=!/memory_leak/ --timeout-scale 10 --worker-timeout=100 -v --test-order=sorted 

# skip failed use .exclude 
# >    -n, --name PATTERN               Filter test method names on pattern: /REGEXP/, !/REGEXP/ or STRING
# >    -x, --exclude REGEXP             Exclude test files on pattern.
# >    -X, --excludes-dir DIRECTORY     Directory name of exclude files

echo "end time: $(date +%Y-%m-%dT%H:%M:%S)"
