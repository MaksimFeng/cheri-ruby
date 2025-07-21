Ractor.new Ractor.current do |main|
    q = Thread::Queue.new
    Thread.new do
      q << true
      loop{}
    ensure
      main << :ok
    end

    Thread.new do
      q << true
      while true
      end
    ensure
      main << :ok
    end

    Thread.new do
      q << true
      sleep 1
    ensure
      main << :ok
    end

    # wait for the start of all threads
    3.times{q.pop}
  end

  3.times.map{Ractor.receive}.tally