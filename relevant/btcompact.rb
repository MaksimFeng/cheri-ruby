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

# regression test for invokeblock iseq guard
assert_equal 'ok', %q{
  skip :ok unless GC.respond_to?(:compact)
  def foo = yield
  10.times do |i|
    ret = eval("foo { #{i} }")
    raise "failed at #{i}" unless ret == i
    GC.compact
  end
  :ok
} unless rjit_enabled? # Not yet working on RJIT

	# Test that object references in generated code get marked and moved
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

# Test EP == BP invalidation with moving ISEQs
assert_equal 'ok', %q{
  skip :ok unless GC.respond_to?(:compact)
  def entry
    ok = proc { :ok } # set #entry as an EP-escaping ISEQ
    [nil].reverse_each do # avoid exiting the JIT frame on the constant
      GC.compact # move #entry ISEQ
    end
    ok # should be read off of escaped EP
  end

  entry.call
}