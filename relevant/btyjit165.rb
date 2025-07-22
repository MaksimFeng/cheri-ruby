# regression test for GC marking stubs in invalidated code
assert_normal_exit %q{
  skip true unless GC.respond_to?(:compact)
  garbage = Array.new(10_000) { [] } # create garbage to cause iseq movement
  eval(<<~RUBY)
  def foo(n, garbage)
    if n == 2
      # 1.times.each to create a cfunc frame to preserve the JIT frame
      # which will return to a stub housed in an invalidated block
      return 1.times.each do
        Object.define_method(:foo) {}
        garbage.clear
        GC.verify_compaction_references(toward: :empty, expand_heap: true)
      end
    end

    foo(n + 1, garbage)
  end
  RUBY

  foo(1, garbage)
}

assert_equal "good", %q{
  skip :good unless GC.respond_to?(:compact)
  def bar
    "good"
  end

  def foo
    bar
  end

  foo
  foo

  begin
    GC.verify_compaction_references(expand_heap: true, toward: :empty)
  rescue NotImplementedError
    # in case compaction isn't supported
  end

  foo
}

assert_equal '[[:return, 42]]', %q{
  def traced_method
    Fiber.yield
    42
  end

  events = []
  tp = TracePoint.new(:return) { events << [_1.event, _1.return_value] }
  # assume first call compiles
  fiber = Fiber.new { traced_method }
  fiber.resume
  tp.enable(target: method(:traced_method))
  fiber.resume

  events
}

assert_equal '[:itself]', %q{
  def traced_method
    itself
  end

  tracing_ractor = Ractor.new do
    # 1: start tracing
    events = []
    tp = TracePoint.new(:c_call) { events << _1.method_id }
    tp.enable
    Ractor.yield(nil)

    # 3: run compiled method on tracing ractor
    Ractor.yield(nil)
    traced_method

    events
  ensure
    tp&.disable
  end

  tracing_ractor.take

  # 2: compile on non tracing ractor
  traced_method

  tracing_ractor.take
  tracing_ractor.take
}

assert_equal '42', %q{
  def compiled(arg)
    if arg
      arg + 1
    else
      itself
      itself
    end
  end

  ractor = Ractor.new do
    compiled(false)
    Ractor.yield(nil)
    compiled(41)
  end

  tp = TracePoint.new(:line) { itself }
  ractor.take
  tp.enable

  ractor.take
}

assert_equal '42',  %q{
  class A
    def self.foo
      _foo = 1
      _bar = 2
      begin
        @bar = _foo + _bar
      rescue Ractor::IsolationError
        42
      end
    end
  end

  A.foo
  A.foo

  Ractor.new { A.foo }.take
}

assert_equal '10', %q{
  r = Ractor.new Ractor.current do |main|
    main << 1
    main << 2
    main << 3
    main << 4
    main << 5
    main << 6
    main << 7
    main << 8
    main << 9
    main << 10
  end

  a = []
  a << Ractor.receive_if{|msg| msg == 10}
  a << Ractor.receive_if{|msg| msg == 9}
  a << Ractor.receive_if{|msg| msg == 8}
  a << Ractor.receive_if{|msg| msg == 7}
  a << Ractor.receive_if{|msg| msg == 6}
  a << Ractor.receive_if{|msg| msg == 5}
  a << Ractor.receive_if{|msg| msg == 4}
  a << Ractor.receive_if{|msg| msg == 3}
  a << Ractor.receive_if{|msg| msg == 2}
  a << Ractor.receive_if{|msg| msg == 1}

  a.length
}
