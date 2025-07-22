# Ractor.select is interruptible
assert_normal_exit %q{
  trap(:INT) do
    exit
  end

  r = Ractor.new do
    loop do
      sleep 1
    end
  end

  Thread.new do
    sleep 0.5
    Process.kill(:INT, Process.pid)
  end
  Ractor.select(r)
}

# yield/move can fail
assert_equal "allocator undefined for Thread", %q{
  r = Ractor.new do
    obj = Thread.new{}
    Ractor.yield obj
  rescue => e
    e.message
  end
  r.take
}

# $DEBUG, $VERBOSE are Ractor local
assert_equal 'true', %q{
  $DEBUG = true
  $VERBOSE = true

  def ractor_local_globals
    /a(b)(c)d/ =~ 'abcd' # for $~
    `echo foo` unless  /solaris/ =~ RUBY_PLATFORM

    {
     # ractor-local (derived from created ractor): debug
     '$DEBUG' => $DEBUG,
     '$-d' => $-d,

     # ractor-local (derived from created ractor): verbose
     '$VERBOSE' => $VERBOSE,
     '$-w' => $-w,
     '$-W' => $-W,
     '$-v' => $-v,

     # process-local (readonly): other commandline parameters
     '$-p' => $-p,
     '$-l' => $-l,
     '$-a' => $-a,

     # process-local (readonly): getpid
     '$$'  => $$,

     # thread local: process result
     '$?'  => $?,

     # scope local: match
     '$~'  => $~.inspect,
     '$&'  => $&,
     '$`'  => $`,
     '$\''  => $',
     '$+'  => $+,
     '$1'  => $1,

     # scope local: last line
     '$_' => $_,

     # scope local: last backtrace
     '$@' => $@,
     '$!' => $!,

     # ractor local: stdin, out, err
     '$stdin'  => $stdin.inspect,
     '$stdout' => $stdout.inspect,
     '$stderr' => $stderr.inspect,
    }
  end

  h = Ractor.new do
    ractor_local_globals
  end.take
  ractor_local_globals == h #=> true
}

# Ractor.select is interruptible
assert_normal_exit %q{
  trap(:INT) do
    exit
  end

  r = Ractor.new do
    loop do
      sleep 1
    end
  end

  Thread.new do
    sleep 0.5
    Process.kill(:INT, Process.pid)
  end
  Ractor.select(r)
}
