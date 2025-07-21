#!/bin/sh

elfctl -e +nocherirevoke ruby
elfctl -e +nocherirevoke miniruby

# original command
# ./ruby --disable=gems  "../bootstraptest/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  -r./riscv64-freebsd-fake --disable-gems"  

for i in ../bootstraptest/test*; do
  if [ -f "$i" ]; then
    ./ruby --disable=gems  "../bootstraptest/runner.rb" \
	--ruby="./miniruby -I../lib -I. -I.ext/common  -r./riscv64-freebsd-fake --disable-gems" "$i" # yes 
  fi
done

# ./ruby --disable=gems  "../bootstraptest/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  \
# 	-r./riscv64-freebsd-fake --disable-gems"  $1
# a=0; while read -r i; do a=$((a + i)); done < <(egrep "PASS all" btreswarning1norev9.log | egrep -o "[0-9]+"); echo $a

