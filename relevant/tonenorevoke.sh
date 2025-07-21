#!/bin/sh

elfctl -e +nocherirevoke ruby

./ruby  -I./ext/psych -I./enc -I../test/did_you_mean -I./ext \
	-I.ext/riscv64-freebsd -I../lib -I. -I.ext/common -I../tool/lib -I../ext -I../test \
	-r./riscv64-freebsd-fake "$1" -s 3216 --timeout-scale 10 --worker-timeout=100
