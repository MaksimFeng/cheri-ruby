#!/bin/sh

elfctl -e +nocherirevoke miniruby
elfctl -e +nocherirevoke ruby

# ./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
# "../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
# --excludes-dir=../test/.excludes --name=!/memory_leak/  ../test/ruby/test_string.rb --name=TestString#test_to_s -s 3216 --timeout-scale 10 --worker-timeout=100

./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
--excludes-dir=../test/.excludes --name=!/memory_leak/  $1 --name=$2 -s 3216 --timeout-scale 10 --worker-timeout=100

