# frozen_string_literal: true
# shareable_constant_value: literal
baseruby="/usr/bin/ruby --disable=gems"
_\
=begin
_=
ruby="${RUBY-$baseruby}"
case "$ruby" in "echo "*) $ruby; exit $?;; esac
case "$0" in /*) r=-r"$0";; *) r=-r"./$0";; esac
exec $ruby "$r" "$@"
=end
=baseruby
class Object
  remove_const :CROSS_COMPILING if defined?(CROSS_COMPILING)
  CROSS_COMPILING = RUBY_PLATFORM
  options = remove_const(:RUBY_DESCRIPTION)[/( \+[^\[\]\+]+)*(?= \[\S+\]\z)/]
  constants.grep(/^RUBY_/) {|n| remove_const n}
  RUBY_VERSION = "3.4.1"
  RUBY_RELEASE_DATE = "2025-06-22"
  RUBY_PLATFORM = "riscv64-freebsd"
  RUBY_PATCHLEVEL = 0
  RUBY_REVISION = "57e798cfc6e67cdb1eb7887fc95695f12d48fd80"
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2025 Yukihiro Matsumoto"
  RUBY_ENGINE = "ruby"
  RUBY_ENGINE_VERSION = "3.4.1"
  RUBY_DESCRIPTION = "ruby 3.4.1 (2025-06-22 revision 57e798cfc6)#{options} [riscv64-freebsd]".freeze
end
builddir = File.dirname(File.expand_path(__FILE__))
libpathenv = libpathenv = "LD_LIBRARY_PATH"
preloadenv = preloadenv = "LD_PRELOAD"
libruby_so = libruby_so = "libruby.so.3.4.1"
srcdir = ".."
top_srcdir = File.realpath(srcdir, builddir)
fake = File.join(top_srcdir, "tool/fake.rb")
eval(File.binread(fake), nil, fake)
ropt = "-r#{__FILE__}"
["RUBYOPT"].each do |flag|
  opt = ENV[flag]
  opt = opt ? ([ropt] | opt.b.split(/\s+/)).join(" ") : ropt
  ENV[flag] = opt
end
