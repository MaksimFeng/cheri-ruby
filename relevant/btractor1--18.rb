# Ractor.current returns a current ractor
assert_equal 'Ractor', %q{
  Ractor.current.class
}

# Ractor.new returns new Ractor
assert_equal 'Ractor', %q{
  Ractor.new{}.class
}

# Ractor.allocate is not supported
assert_equal "[:ok, :ok]", %q{
  rs = []
  begin
    Ractor.allocate
  rescue => e
    rs << :ok if e.message == 'allocator undefined for Ractor'
  end

  begin
    Ractor.new{}.dup
  rescue
    rs << :ok if e.message == 'allocator undefined for Ractor'
  end

  rs
}

# A Ractor can have a name
assert_equal 'test-name', %q{
  r = Ractor.new name: 'test-name' do
  end
  r.name
}

# If Ractor doesn't have a name, Ractor#name returns nil.
assert_equal 'nil', %q{
  r = Ractor.new do
  end
  r.name.inspect
}

# Raises exceptions if initialize with an invalid name
assert_equal 'ok', %q{
  begin
    r = Ractor.new(name: [{}]) {}
  rescue TypeError => e
    'ok'
  end
}

# Ractor.new must call with a block
assert_equal "must be called with a block", %q{
  begin
    Ractor.new
  rescue ArgumentError => e
    e.message
  end
}

# Ractor#inspect
# Return only id and status for main ractor
assert_equal "#<Ractor:#1 running>", %q{
  Ractor.current.inspect
}

# Return id, loc, and status for no-name ractor
assert_match /^#<Ractor:#([^ ]*?) .+:[0-9]+ terminated>$/, %q{
  r = Ractor.new { '' }
  r.take
  sleep 0.1 until r.inspect =~ /terminated/
  r.inspect
}

# Return id, name, loc, and status for named ractor
assert_match /^#<Ractor:#([^ ]*?) Test Ractor .+:[0-9]+ terminated>$/, %q{
  r = Ractor.new(name: 'Test Ractor') { '' }
  r.take
  sleep 0.1 until r.inspect =~ /terminated/
  r.inspect
}

# A return value of a Ractor block will be a message from the Ractor.
assert_equal 'ok', %q{
  # join
  r = Ractor.new do
    'ok'
  end
  r.take
}

# Passed arguments to Ractor.new will be a block parameter
# The values are passed with Ractor-communication pass.
assert_equal 'ok', %q{
  # ping-pong with arg
  r = Ractor.new 'ok' do |msg|
    msg
  end
  r.take
}

# Pass multiple arguments to Ractor.new
assert_equal 'ok', %q{
  # ping-pong with two args
  r =  Ractor.new 'ping', 'pong' do |msg, msg2|
    [msg, msg2]
  end
  'ok' if r.take == ['ping', 'pong']
}

# Ractor#send passes an object with copy to a Ractor
# and Ractor.receive in the Ractor block can receive the passed value.
assert_equal 'ok', %q{
  r = Ractor.new do
    msg = Ractor.receive
  end
  r.send 'ok'
  r.take
}

# Ractor#receive_if can filter the message
assert_equal '[2, 3, 1]', %q{
  r = Ractor.new Ractor.current do |main|
    main << 1
    main << 2
    main << 3
  end
  a = []
  a << Ractor.receive_if{|msg| msg == 2}
  a << Ractor.receive_if{|msg| msg == 3}
  a << Ractor.receive
}

# Ractor#receive_if with break
assert_equal '[2, [1, :break], 3]', %q{
  r = Ractor.new Ractor.current do |main|
    main << 1
    main << 2
    main << 3
  end

  a = []
  a << Ractor.receive_if{|msg| msg == 2}
  a << Ractor.receive_if{|msg| break [msg, :break]}
  a << Ractor.receive
}

# Ractor#receive_if can't be called recursively
assert_equal '[[:e1, 1], [:e2, 2]]', %q{
  r = Ractor.new Ractor.current do |main|
    main << 1
    main << 2
    main << 3
  end

  a = []

  Ractor.receive_if do |msg|
    begin
      Ractor.receive
    rescue Ractor::Error
      a << [:e1, msg]
    end
    true # delete 1 from queue
  end

  Ractor.receive_if do |msg|
    begin
      Ractor.receive_if{}
    rescue Ractor::Error
      a << [:e2, msg]
    end
    true # delete 2 from queue
  end

  a #
}

# dtoa race condition
assert_equal '[:ok, :ok, :ok]', %q{
  n = 3
  n.times.map{
    Ractor.new{
      10_000.times{ rand.to_s }
      :ok
    }
  }.map(&:take)
}

