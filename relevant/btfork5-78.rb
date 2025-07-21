assert_equal 'ok', %q{
  def now = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  Thread.new do
    loop { sleep 0.0001 }
  end

  10.times do
    pid = fork{ exit!(0) }
    deadline = now + 10
    until Process.waitpid(pid, Process::WNOHANG)
      if now > deadline
        Process.kill(:KILL, pid)
        raise "failed"
      end
      sleep 0.001
    end
  rescue NotImplementedError
  end
  :ok
}, '[Bug #20670]'
