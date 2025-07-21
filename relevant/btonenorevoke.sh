#!/bin/sh

elfctl -e +nocherirevoke ruby
elfctl -e +nocherirevoke miniruby

./ruby --disable=gems  "../bootstraptest/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  -r./riscv64-freebsd-fake --disable-gems" $i

