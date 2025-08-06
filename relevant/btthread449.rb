assert_finish 3, %q{
  require 'thread'

  lock = Thread::Mutex.new
  cond = Thread::ConditionVariable.new
  t = Thread.new do
    lock.synchronize do
      cond.wait(lock)
    end
  end

  begin
    pid = fork do
      # Child
      STDOUT.write "This is the child process.\n"
      STDOUT.write "Child process exiting.\n"
    end
    Process.waitpid(pid)
  rescue NotImplementedError
  end
}, '[ruby-core:23572]'
