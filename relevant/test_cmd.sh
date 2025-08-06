cat test_targets.txt | while read -r line; do echo "# target" >> test_cmd.sh; echo $line >> test_cmd.sh; echo "#" >> test_cmd.sh; make -n $line >> test_cmd.sh; echo "#" >> test_cmd.sh; done

# target
btest
#
./ruby --disable=gems  "../bootstraptest/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  -r./riscv64-freebsd-fake --disable-gems"   
#
# target
btest-bruby
#
: 
./ruby --disable=gems  "../bootstraptest/runner.rb" --ruby="ruby -I../lib --disable-gems"   
#
# target
btest-ruby
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../bootstraptest/runner.rb" --ruby="ruby -I../lib --disable-gems"   
#
# target
install-for-test-bundled-gems
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
#
# target
no-test-all
#
: 
./miniruby -I../lib -I. -I.ext/common  -I"../lib" -r../tool/lib/_tmpdir \
"../test/runner.rb"  mkmf
#
# target
no-test-almost
#
: 
./miniruby -I../lib -I. -I.ext/common  -I"../lib" -r../tool/lib/_tmpdir \
"../test/runner.rb"  mkmf
#
# target
no-test-bundled-gems-run
#
: 
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
#
# target
rtest
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
: 
./ruby --disable=gems  "../bootstraptest/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  -r./riscv64-freebsd-fake --disable-gems" --sets=ractor -v
#
# target
test
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../bootstraptest/runner.rb" --ruby="ruby -I../lib --disable-gems"   
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../bootstraptest/runner.rb" --ruby="ruby --disable-gems"   ../KNOWNBUGS.rb
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/leaked-globals \
  SOEXT=so NM="/cheriv92/src/output/sdk/bin/clang-nm -Pgp" SYMBOL_PREFIX= \
  SYMBOLS_IN_EMPTYLIB="" \
  EXTSTATIC="" \
  PLATFORM=../include/ruby/.h ../configure.ac \
  array.o ast.o bignum.o class.o compar.o compile.o complex.o cont.o debug.o debug_counter.o dir.o dln_find.o encoding.o enum.o enumerator.o error.o eval.o file.o gc.o hash.o inits.o imemo.o io.o io_buffer.o iseq.o load.o marshal.o math.o memory_view.o rjit.o rjit_c.o node.o node_dump.o numeric.o object.o pack.o parse.o parser_st.o proc.o process.o ractor.o random.o range.o rational.o re.o regcomp.o regenc.o regerror.o regexec.o regparse.o regsyntax.o ruby.o ruby_parser.o scheduler.o shape.o signal.o sprintf.o st.o strftime.o string.o struct.o symbol.o thread.o time.o transcode.o util.o variable.o version.o vm.o vm_backtrace.o vm_dump.o vm_sync.o vm_trace.o weakmap.o prism/api_node.o prism/api_pack.o prism/diagnostic.o prism/encoding.o prism/extension.o prism/node.o prism/options.o prism/pack.o prism/prettyprint.o prism/regexp.o prism/serialize.o prism/static_literals.o prism/token_type.o prism/util/pm_buffer.o prism/util/pm_char.o prism/util/pm_constant_pool.o prism/util/pm_integer.o prism/util/pm_list.o prism/util/pm_memchr.o prism/util/pm_newline_list.o prism/util/pm_string.o prism/util/pm_strncasecmp.o prism/util/pm_strpbrk.o prism/prism.o prism_init.o   coroutine/amd64/Context.o  enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o enc/trans/newline.o setproctitle.o strlcat.o strlcpy.o addr2line.o  
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../basictest/runner.rb" --run-opt=--disable-gems  
#
# target
test-all
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
--excludes-dir=../test/.excludes --name=!/memory_leak/  
#
# target
test-almost
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
--excludes-dir=../test/.excludes --name=!/memory_leak/  
#
# target
test-annocheck
#
[ -n "" ] || [ -n "" ] || rm -f ./.libruby-with-ext.time
/cheriv92/src/output/sdk/bin/clang -shared -Wl,--compress-debug-sections=zlib -fstack-protector-strong -pie   dln.o localeinit.o loadpath.o array.o ast.o bignum.o class.o compar.o compile.o complex.o cont.o debug.o debug_counter.o dir.o dln_find.o encoding.o enum.o enumerator.o error.o eval.o file.o gc.o hash.o inits.o imemo.o io.o io_buffer.o iseq.o load.o marshal.o math.o memory_view.o rjit.o rjit_c.o node.o node_dump.o numeric.o object.o pack.o parse.o parser_st.o proc.o process.o ractor.o random.o range.o rational.o re.o regcomp.o regenc.o regerror.o regexec.o regparse.o regsyntax.o ruby.o ruby_parser.o scheduler.o shape.o signal.o sprintf.o st.o strftime.o string.o struct.o symbol.o thread.o time.o transcode.o util.o variable.o version.o vm.o vm_backtrace.o vm_dump.o vm_sync.o vm_trace.o weakmap.o prism/api_node.o prism/api_pack.o prism/diagnostic.o prism/encoding.o prism/extension.o prism/node.o prism/options.o prism/pack.o prism/prettyprint.o prism/regexp.o prism/serialize.o prism/static_literals.o prism/token_type.o prism/util/pm_buffer.o prism/util/pm_char.o prism/util/pm_constant_pool.o prism/util/pm_integer.o prism/util/pm_list.o prism/util/pm_memchr.o prism/util/pm_newline_list.o prism/util/pm_string.o prism/util/pm_strncasecmp.o prism/util/pm_strpbrk.o prism/prism.o prism_init.o   coroutine/amd64/Context.o  enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o enc/trans/newline.o setproctitle.o strlcat.o strlcpy.o addr2line.o  builtin.o dmyext.o dmyenc.o -lz -lrt -lrt -lgmp -ldl -lcrypt -lm -lpthread   -o libruby.so.3.4.5
objcopy -w -L 'Init_*' -L 'ruby_static_id_*' \
		-L '*_threadptr_*' -L '*_ec_*' libruby.so.3.4.5
./miniruby -I../lib -I. -I.ext/common  -e 'so, *aliases = ARGV; aliases.uniq!; aliases.delete(File.basename(so)); \
			  aliases.each { |link| File.delete link rescue nil; File.symlink so, link }' \
			libruby.so.3.4.5 libruby.so || true
../tool/test-annocheck.sh ruby libruby.so.3.4.5
#
# target
test-basic
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/leaked-globals \
  SOEXT=so NM="/cheriv92/src/output/sdk/bin/clang-nm -Pgp" SYMBOL_PREFIX= \
  SYMBOLS_IN_EMPTYLIB="" \
  EXTSTATIC="" \
  PLATFORM=../include/ruby/.h ../configure.ac \
  array.o ast.o bignum.o class.o compar.o compile.o complex.o cont.o debug.o debug_counter.o dir.o dln_find.o encoding.o enum.o enumerator.o error.o eval.o file.o gc.o hash.o inits.o imemo.o io.o io_buffer.o iseq.o load.o marshal.o math.o memory_view.o rjit.o rjit_c.o node.o node_dump.o numeric.o object.o pack.o parse.o parser_st.o proc.o process.o ractor.o random.o range.o rational.o re.o regcomp.o regenc.o regerror.o regexec.o regparse.o regsyntax.o ruby.o ruby_parser.o scheduler.o shape.o signal.o sprintf.o st.o strftime.o string.o struct.o symbol.o thread.o time.o transcode.o util.o variable.o version.o vm.o vm_backtrace.o vm_dump.o vm_sync.o vm_trace.o weakmap.o prism/api_node.o prism/api_pack.o prism/diagnostic.o prism/encoding.o prism/extension.o prism/node.o prism/options.o prism/pack.o prism/prettyprint.o prism/regexp.o prism/serialize.o prism/static_literals.o prism/token_type.o prism/util/pm_buffer.o prism/util/pm_char.o prism/util/pm_constant_pool.o prism/util/pm_integer.o prism/util/pm_list.o prism/util/pm_memchr.o prism/util/pm_newline_list.o prism/util/pm_string.o prism/util/pm_strncasecmp.o prism/util/pm_strpbrk.o prism/prism.o prism_init.o   coroutine/amd64/Context.o  enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o enc/trans/newline.o setproctitle.o strlcat.o strlcpy.o addr2line.o  
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../basictest/runner.rb" --run-opt=--disable-gems  
#
# target
test-bundled-gems
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. .bundle/bin/rspec spec/bundled_gems_spec.rb
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/test-bundled-gems.rb 
: 
\
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r./riscv64-freebsd-fake -r../tool/lib/_tmpdir \
	../spec/mspec/bin/mspec run --env BUNDLED_GEMS= -B ../spec/bundled_gems.mspec \
	 
#
# target
test-bundled-gems-fetch
#
: 
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
#
# target
test-bundled-gems-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
#
# target
test-bundled-gems-prepare
#
: 
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
#
# target
test-bundled-gems-run
#
: 
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/test-bundled-gems.rb 
#
# target
test-bundled-gems-spec
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
: 
\
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r./riscv64-freebsd-fake -r../tool/lib/_tmpdir \
	../spec/mspec/bin/mspec run --env BUNDLED_GEMS= -B ../spec/bundled_gems.mspec \
	 
#
# target
test-bundler
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ilib \
	-e 'ENV["GEM_HOME"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_APP_CONFIG"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_PATH__SYSTEM"] = "true"' \
	-e 'ENV["BUNDLE_WITHOUT"] = "lint doc"' \
	-e 'load "spec/bundler/support/bundle.rb"' -- install --quiet --gemfile=tool/bundler/dev_gems.rb
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems \
	-r./riscv64-freebsd-fake \
	-e "exec(*ARGV)" -- \
	./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ispec/bundler -Ispec/lib .bundle/bin/rspec \
	-r spec_helper -r formatter_overrides spec/bundler/
#
# target
test-bundler-parallel
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ilib \
	-e 'ENV["GEM_HOME"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_APP_CONFIG"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_PATH__SYSTEM"] = "true"' \
	-e 'ENV["BUNDLE_WITHOUT"] = "lint doc"' \
	-e 'load "spec/bundler/support/bundle.rb"' -- install --quiet --gemfile=tool/bundler/dev_gems.rb
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems \
	-r./riscv64-freebsd-fake \
	-I../spec/bundler \
	-e "ruby = ENV['RUBY']" \
	-e "ARGV[-1] = File.expand_path(ARGV[-1])" \
	-e "ENV['PARALLEL_TESTS_EXECUTABLE'] = ruby + ARGV.shift" \
	-e "load ARGV.shift" \
	" -C .. -Ispec/bundler -Ispec/lib .bundle/bin/rspec -r spec_helper" \
	../spec/bin/parallel_rspec -r formatter_overrides \
	--runtime-log ../tmp/parallel_runtime_rspec.log  ../spec/bundler/
#
# target
test-bundler-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
#
# target
test-bundler-prepare
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ilib \
	-e 'ENV["GEM_HOME"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_APP_CONFIG"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_PATH__SYSTEM"] = "true"' \
	-e 'ENV["BUNDLE_WITHOUT"] = "lint doc"' \
	-e 'load "spec/bundler/support/bundle.rb"' -- install --quiet --gemfile=tool/bundler/dev_gems.rb
#
# target
test-knownbug
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../bootstraptest/runner.rb" --ruby="ruby --disable-gems"   ../KNOWNBUGS.rb
#
# target
test-knownbugs
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../bootstraptest/runner.rb" --ruby="ruby --disable-gems"   ../KNOWNBUGS.rb
#
# target
test-leaked-globals
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/leaked-globals \
  SOEXT=so NM="/cheriv92/src/output/sdk/bin/clang-nm -Pgp" SYMBOL_PREFIX= \
  SYMBOLS_IN_EMPTYLIB="" \
  EXTSTATIC="" \
  PLATFORM=../include/ruby/.h ../configure.ac \
  array.o ast.o bignum.o class.o compar.o compile.o complex.o cont.o debug.o debug_counter.o dir.o dln_find.o encoding.o enum.o enumerator.o error.o eval.o file.o gc.o hash.o inits.o imemo.o io.o io_buffer.o iseq.o load.o marshal.o math.o memory_view.o rjit.o rjit_c.o node.o node_dump.o numeric.o object.o pack.o parse.o parser_st.o proc.o process.o ractor.o random.o range.o rational.o re.o regcomp.o regenc.o regerror.o regexec.o regparse.o regsyntax.o ruby.o ruby_parser.o scheduler.o shape.o signal.o sprintf.o st.o strftime.o string.o struct.o symbol.o thread.o time.o transcode.o util.o variable.o version.o vm.o vm_backtrace.o vm_dump.o vm_sync.o vm_trace.o weakmap.o prism/api_node.o prism/api_pack.o prism/diagnostic.o prism/encoding.o prism/extension.o prism/node.o prism/options.o prism/pack.o prism/prettyprint.o prism/regexp.o prism/serialize.o prism/static_literals.o prism/token_type.o prism/util/pm_buffer.o prism/util/pm_char.o prism/util/pm_constant_pool.o prism/util/pm_integer.o prism/util/pm_list.o prism/util/pm_memchr.o prism/util/pm_newline_list.o prism/util/pm_string.o prism/util/pm_strncasecmp.o prism/util/pm_strpbrk.o prism/prism.o prism_init.o   coroutine/amd64/Context.o  enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o enc/trans/newline.o setproctitle.o strlcat.o strlcpy.o addr2line.o  
#
# target
test-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
#
# target
test-ruby
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../test/runner.rb" --excludes-dir=../test/.excludes --name=!/memory_leak/  -- ruby -ext-
#
# target
test-rubyspec
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
\
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r./riscv64-freebsd-fake -r../tool/lib/_tmpdir \
	../spec/mspec/bin/mspec run -B ../spec/default.mspec  
#
# target
test-sample

#
# target
test-short
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../bootstraptest/runner.rb" --ruby="ruby -I../lib --disable-gems"   
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../bootstraptest/runner.rb" --ruby="ruby --disable-gems"   ../KNOWNBUGS.rb
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/leaked-globals \
  SOEXT=so NM="/cheriv92/src/output/sdk/bin/clang-nm -Pgp" SYMBOL_PREFIX= \
  SYMBOLS_IN_EMPTYLIB="" \
  EXTSTATIC="" \
  PLATFORM=../include/ruby/.h ../configure.ac \
  array.o ast.o bignum.o class.o compar.o compile.o complex.o cont.o debug.o debug_counter.o dir.o dln_find.o encoding.o enum.o enumerator.o error.o eval.o file.o gc.o hash.o inits.o imemo.o io.o io_buffer.o iseq.o load.o marshal.o math.o memory_view.o rjit.o rjit_c.o node.o node_dump.o numeric.o object.o pack.o parse.o parser_st.o proc.o process.o ractor.o random.o range.o rational.o re.o regcomp.o regenc.o regerror.o regexec.o regparse.o regsyntax.o ruby.o ruby_parser.o scheduler.o shape.o signal.o sprintf.o st.o strftime.o string.o struct.o symbol.o thread.o time.o transcode.o util.o variable.o version.o vm.o vm_backtrace.o vm_dump.o vm_sync.o vm_trace.o weakmap.o prism/api_node.o prism/api_pack.o prism/diagnostic.o prism/encoding.o prism/extension.o prism/node.o prism/options.o prism/pack.o prism/prettyprint.o prism/regexp.o prism/serialize.o prism/static_literals.o prism/token_type.o prism/util/pm_buffer.o prism/util/pm_char.o prism/util/pm_constant_pool.o prism/util/pm_integer.o prism/util/pm_list.o prism/util/pm_memchr.o prism/util/pm_newline_list.o prism/util/pm_string.o prism/util/pm_strncasecmp.o prism/util/pm_strpbrk.o prism/prism.o prism_init.o   coroutine/amd64/Context.o  enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o enc/trans/newline.o setproctitle.o strlcat.o strlcpy.o addr2line.o  
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../basictest/runner.rb" --run-opt=--disable-gems  
#
# target
test-spec
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
\
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r./riscv64-freebsd-fake -r../tool/lib/_tmpdir \
	../spec/mspec/bin/mspec run -B ../spec/default.mspec  
#
# target
test-syntax-suggest
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." bin/gem install --no-document \
	--install-dir .bundle --conservative "rspec:~> 3"
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ispec/syntax_suggest:spec/lib .bundle/bin/rspec \
	--require rspec/expectations \
	--require spec_helper --require formatter_overrides --require spec_coverage \
	-r formatter_overrides spec/syntax_suggest/
#
# target
test-syntax-suggest-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
#
# target
test-syntax-suggest-prepare
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." bin/gem install --no-document \
	--install-dir .bundle --conservative "rspec:~> 3"
#
# target
test-testframework
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../tool/test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems"  testunit
#
# target
test-tool
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../tool/test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" 
#
# target
yes-btest
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
: 
./ruby --disable=gems  "../bootstraptest/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  -r./riscv64-freebsd-fake --disable-gems"   
#
# target
yes-btest-ruby
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../bootstraptest/runner.rb" --ruby="ruby -I../lib --disable-gems"   
#
# target
yes-install-for-test-bundled-gems
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
#
# target
yes-test-all
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
--excludes-dir=../test/.excludes --name=!/memory_leak/  
#
# target
yes-test-all-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
#
# target
yes-test-almost
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
--excludes-dir=../test/.excludes --name=!/memory_leak/  
#
# target
yes-test-basic
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/leaked-globals \
  SOEXT=so NM="/cheriv92/src/output/sdk/bin/clang-nm -Pgp" SYMBOL_PREFIX= \
  SYMBOLS_IN_EMPTYLIB="" \
  EXTSTATIC="" \
  PLATFORM=../include/ruby/.h ../configure.ac \
  array.o ast.o bignum.o class.o compar.o compile.o complex.o cont.o debug.o debug_counter.o dir.o dln_find.o encoding.o enum.o enumerator.o error.o eval.o file.o gc.o hash.o inits.o imemo.o io.o io_buffer.o iseq.o load.o marshal.o math.o memory_view.o rjit.o rjit_c.o node.o node_dump.o numeric.o object.o pack.o parse.o parser_st.o proc.o process.o ractor.o random.o range.o rational.o re.o regcomp.o regenc.o regerror.o regexec.o regparse.o regsyntax.o ruby.o ruby_parser.o scheduler.o shape.o signal.o sprintf.o st.o strftime.o string.o struct.o symbol.o thread.o time.o transcode.o util.o variable.o version.o vm.o vm_backtrace.o vm_dump.o vm_sync.o vm_trace.o weakmap.o prism/api_node.o prism/api_pack.o prism/diagnostic.o prism/encoding.o prism/extension.o prism/node.o prism/options.o prism/pack.o prism/prettyprint.o prism/regexp.o prism/serialize.o prism/static_literals.o prism/token_type.o prism/util/pm_buffer.o prism/util/pm_char.o prism/util/pm_constant_pool.o prism/util/pm_integer.o prism/util/pm_list.o prism/util/pm_memchr.o prism/util/pm_newline_list.o prism/util/pm_string.o prism/util/pm_strncasecmp.o prism/util/pm_strpbrk.o prism/prism.o prism_init.o   coroutine/amd64/Context.o  enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o enc/trans/newline.o setproctitle.o strlcat.o strlcpy.o addr2line.o  
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../basictest/runner.rb" --run-opt=--disable-gems  
#
# target
yes-test-bundled-gems
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. .bundle/bin/rspec spec/bundled_gems_spec.rb
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/test-bundled-gems.rb 
#
# target
yes-test-bundled-gems-fetch
#
: 
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
#
# target
yes-test-bundled-gems-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
#
# target
yes-test-bundled-gems-prepare
#
: 
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
#
# target
yes-test-bundled-gems-run
#
: 
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/test-bundled-gems.rb 
#
# target
yes-test-bundled-gems-spec
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
/usr/bin/mkdir -p ../.bundle/specifications
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -W0 -C ".." -rrubygems \
    -e "destdir = ARGV.shift" \
    -e "ARGV.each do |basedir|" \
    -e   "Dir.glob(basedir+'/**/*.gemspec') do |g|" \
    -e     "dir, base = File.split(g)" \
    -e     "spec = Dir.chdir(dir) {Gem::Specification.load(base)} ||" \
    -e         "Gem::Specification.load(g)" \
    -e     "unless spec" \
    -e       "puts %[Ignoring #{g}]" \
    -e       "next" \
    -e     "end" \
    -e     "spec.files.clear" \
    -e     "spec.extensions.clear" \
    -e     "File.binwrite(File.join(destdir, spec.full_name+'.gemspec'), spec.to_ruby)" \
    -e   "end" \
    -e "end" \
    -- .bundle/specifications lib ext
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." -r./tool/lib/gem_env.rb bin/gem \
	install --no-document --conservative \
	"hoe" "json-schema:5.1.0" "test-unit-rr" "simplecov" "simplecov-html" "simplecov-json" "rspec" "zeitwerk" \
	"sinatra" "rack" "tilt" "mustermann" "base64" "compact_index" "rack-test"
./ruby --disable=gems -C ../gems ../tool/fetch-bundled_gems.rb BUNDLED_GEMS="" src bundled_gems
: 
\
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r./riscv64-freebsd-fake -r../tool/lib/_tmpdir \
	../spec/mspec/bin/mspec run --env BUNDLED_GEMS= -B ../spec/bundled_gems.mspec \
	 
#
# target
yes-test-bundler
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ilib \
	-e 'ENV["GEM_HOME"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_APP_CONFIG"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_PATH__SYSTEM"] = "true"' \
	-e 'ENV["BUNDLE_WITHOUT"] = "lint doc"' \
	-e 'load "spec/bundler/support/bundle.rb"' -- install --quiet --gemfile=tool/bundler/dev_gems.rb
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems \
	-r./riscv64-freebsd-fake \
	-e "exec(*ARGV)" -- \
	./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ispec/bundler -Ispec/lib .bundle/bin/rspec \
	-r spec_helper -r formatter_overrides spec/bundler/
#
# target
yes-test-bundler-parallel
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ilib \
	-e 'ENV["GEM_HOME"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_APP_CONFIG"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_PATH__SYSTEM"] = "true"' \
	-e 'ENV["BUNDLE_WITHOUT"] = "lint doc"' \
	-e 'load "spec/bundler/support/bundle.rb"' -- install --quiet --gemfile=tool/bundler/dev_gems.rb
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems \
	-r./riscv64-freebsd-fake \
	-I../spec/bundler \
	-e "ruby = ENV['RUBY']" \
	-e "ARGV[-1] = File.expand_path(ARGV[-1])" \
	-e "ENV['PARALLEL_TESTS_EXECUTABLE'] = ruby + ARGV.shift" \
	-e "load ARGV.shift" \
	" -C .. -Ispec/bundler -Ispec/lib .bundle/bin/rspec -r spec_helper" \
	../spec/bin/parallel_rspec -r formatter_overrides \
	--runtime-log ../tmp/parallel_runtime_rspec.log  ../spec/bundler/
#
# target
yes-test-bundler-parallel-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
#
# target
yes-test-bundler-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
#
# target
yes-test-bundler-prepare
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ilib \
	-e 'ENV["GEM_HOME"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_APP_CONFIG"] = File.expand_path(".bundle")' \
	-e 'ENV["BUNDLE_PATH__SYSTEM"] = "true"' \
	-e 'ENV["BUNDLE_WITHOUT"] = "lint doc"' \
	-e 'load "spec/bundler/support/bundle.rb"' -- install --quiet --gemfile=tool/bundler/dev_gems.rb
#
# target
yes-test-knownbug
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../bootstraptest/runner.rb" --ruby="ruby --disable-gems"   ../KNOWNBUGS.rb
#
# target
yes-test-leaked-globals
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems ../tool/leaked-globals \
  SOEXT=so NM="/cheriv92/src/output/sdk/bin/clang-nm -Pgp" SYMBOL_PREFIX= \
  SYMBOLS_IN_EMPTYLIB="" \
  EXTSTATIC="" \
  PLATFORM=../include/ruby/.h ../configure.ac \
  array.o ast.o bignum.o class.o compar.o compile.o complex.o cont.o debug.o debug_counter.o dir.o dln_find.o encoding.o enum.o enumerator.o error.o eval.o file.o gc.o hash.o inits.o imemo.o io.o io_buffer.o iseq.o load.o marshal.o math.o memory_view.o rjit.o rjit_c.o node.o node_dump.o numeric.o object.o pack.o parse.o parser_st.o proc.o process.o ractor.o random.o range.o rational.o re.o regcomp.o regenc.o regerror.o regexec.o regparse.o regsyntax.o ruby.o ruby_parser.o scheduler.o shape.o signal.o sprintf.o st.o strftime.o string.o struct.o symbol.o thread.o time.o transcode.o util.o variable.o version.o vm.o vm_backtrace.o vm_dump.o vm_sync.o vm_trace.o weakmap.o prism/api_node.o prism/api_pack.o prism/diagnostic.o prism/encoding.o prism/extension.o prism/node.o prism/options.o prism/pack.o prism/prettyprint.o prism/regexp.o prism/serialize.o prism/static_literals.o prism/token_type.o prism/util/pm_buffer.o prism/util/pm_char.o prism/util/pm_constant_pool.o prism/util/pm_integer.o prism/util/pm_list.o prism/util/pm_memchr.o prism/util/pm_newline_list.o prism/util/pm_string.o prism/util/pm_strncasecmp.o prism/util/pm_strpbrk.o prism/prism.o prism_init.o   coroutine/amd64/Context.o  enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o enc/trans/newline.o setproctitle.o strlcat.o strlcpy.o addr2line.o  
#
# target
yes-test-leaked-globals-precheck
#
#
# target
yes-test-ruby
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../test/runner.rb" --excludes-dir=../test/.excludes --name=!/memory_leak/  -- ruby -ext-
#
# target
yes-test-rubyspec
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
\
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r./riscv64-freebsd-fake -r../tool/lib/_tmpdir \
	../spec/mspec/bin/mspec run -B ../spec/default.mspec  
#
# target
yes-test-spec
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
\
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r./riscv64-freebsd-fake -r../tool/lib/_tmpdir \
	../spec/mspec/bin/mspec run -B ../spec/default.mspec  
#
# target
yes-test-spec-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
#
# target
yes-test-syntax-suggest
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." bin/gem install --no-document \
	--install-dir .bundle --conservative "rspec:~> 3"
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C .. -Ispec/syntax_suggest:spec/lib .bundle/bin/rspec \
	--require rspec/expectations \
	--require spec_helper --require formatter_overrides --require spec_coverage \
	-r formatter_overrides spec/syntax_suggest/
#
# target
yes-test-syntax-suggest-precheck
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
#
# target
yes-test-syntax-suggest-prepare
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -C ".." bin/gem install --no-document \
	--install-dir .bundle --conservative "rspec:~> 3"
#
# target
yes-test-testframework
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../tool/test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems"  testunit
#
# target
yes-test-tool
#
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../tool/test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" 
#
# target
yjit-smoke-test
#
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
: 
./ruby --disable=gems  "../bootstraptest/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  -r./riscv64-freebsd-fake --yjit-call-threshold=1"   -j
/cheriv92/src/output/sdk/bin/clang -E -DRUBY_EXPORT -I. -I.ext/include/riscv64-freebsd -I.ext/include -I../include -I.. -I../prism -I../enc/unicode/15.0.0     "../version.c" | \
./ruby --disable=gems  "../tool/generic_erb.rb" -o riscv64-freebsd-fake.rb "../template/fake.rb.in" \
    i=- srcdir=".." BASERUBY="./ruby --disable=gems" \
    LIBPATHENV="LD_LIBRARY_PATH" PRELOADENV="LD_PRELOAD" LIBRUBY_SO="libruby.so.3.4.5"
./ruby --disable=gems  -r./riscv64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
./ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
/usr/bin/mkdir -p ext
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="./miniruby -I../lib -I. -I.ext/common " --script-args='--dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="-nw" --make-flags="nw -- TESTS=../test/ruby/test_yjit.rb"'
	gnumake=yes MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
	EXTLDFLAGS="" srcdir=".."
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/-test-
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/cgi
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/continuation
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/coverage
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/date
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/digest
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/erb
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/etc
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fcntl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/fiddle
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/io
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/json
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/monitor
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/objspace
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/openssl
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pathname
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/psych
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/pty
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rbconfig
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/ripper
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/rubyvm
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/socket
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/stringio
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/strscan
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/win32ole
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --extstatic  \
	-- configure ext/zlib
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.11.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/debug-1.11.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
./miniruby -I../lib -I. -I.ext/common  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='./miniruby -I../lib -I. -I.ext/common '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
./miniruby -I../lib -I. -I.ext/common  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
    EXTENCS="dmyenc.o" BASERUBY="./ruby --disable=gems" MINIRUBY="./miniruby -I../lib -I. -I.ext/common " \
    
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.11.0/lib ../../../../../.bundle/gems/debug-1.11.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
../../../../../../miniruby -I'../../../../../..' -I'../../../../../../../lib' -I'../../../../../../.ext/riscv64-freebsd' -I'../../../../../../.ext/common' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
../../../../../miniruby -I'../../../../..' -I'../../../../../../lib' -I'../../../../../.ext/riscv64-freebsd' -I'../../../../../.ext/common' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
: 
./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
--excludes-dir=../test/.excludes --name=!/memory_leak/  ../test/ruby/test_yjit.rb
#
