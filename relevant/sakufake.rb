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
  RUBY_VERSION = "3.5.0"
  RUBY_RELEASE_DATE = "2025-04-17"
  RUBY_PLATFORM = "riscv64-freebsd"
  RUBY_PATCHLEVEL = -1
  RUBY_REVISION = "7224badce8405fd71be82a6f838004ca7ede5da7"
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2025 Yukihiro Matsumoto"
  RUBY_ENGINE = "ruby"
  RUBY_ENGINE_VERSION = "3.5.0"
  RUBY_DESCRIPTION = "ruby 3.5.0dev (2025-04-17T07:03:27Z compat 7224badce8)#{options} [riscv64-freebsd]".freeze
end
module Ruby
  constants.each {|n| remove_const n}
  VERSION = ::RUBY_VERSION
  RELEASE_DATE = ::RUBY_RELEASE_DATE
  PLATFORM = ::RUBY_PLATFORM
  PATCHLEVEL = ::RUBY_PATCHLEVEL
  REVISION = ::RUBY_REVISION
  COPYRIGHT = ::RUBY_COPYRIGHT
  ENGINE = ::RUBY_ENGINE
  ENGINE_VERSION = ::RUBY_ENGINE_VERSION
  DESCRIPTION = ::RUBY_DESCRIPTION
end
builddir = File.dirname(File.expand_path(__FILE__))
libpathenv = libpathenv = "LD_LIBRARY_PATH"
preloadenv = preloadenv = "LD_PRELOAD"
libruby_so = libruby_so = "libruby.so.3.5.0"
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
