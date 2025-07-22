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
