#!/bin/sh

A2=${2:-""}

# ./ruby -I./ext/psych -I./enc -I../test/did_you_mean -I./ext -I.ext/riscv64-freebsd \
# 	-I../lib -I. -I.ext/common -I../tool/lib -I../ext -I../test -r./riscv64-freebsd-fake $1 \
# 	-s 3216 --timeout-scale 10 --worker-timeout=100 "$A2"

./ruby -I./ext/psych -I./enc -I../test/did_you_mean -I./ext -I.ext/riscv64-freebsd \
	-I../lib -I. -I.ext/common -I../tool/lib -I../ext -I../test -r./riscv64-freebsd-fake "$1" \
	-s 3216 --timeout-scale 10 --worker-timeout=100

# ./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
# "../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
# --excludes-dir=../test/.excludes --name=!/memory_leak/  ../test/ruby/test_string.rb --name=TestString#test_to_s



# -I./ext -I.ext/x86_64-linux -I../lib -I. -I.ext/common -I../tool/lib -I../ext -I../test -r./x86_64-linux-fake -s 3216 --timeout-scale 10 --worker-timeout=100