# write the assert_equal method 
# compare the expected and actual values
# by first running the code in the block
# and then comparing the result with the expected value
def assert_equal(expected, testsrc, message = '', opt = '', **kwargs)
  if testsrc.is_a?(String)
	actual = nil
    th = Thread.new {
        actual = eval(testsrc)
        $?
      }
	if !th.join(1800)
		Process.kill :KILL, pid
	end 
    if expected.to_s == actual.to_s
      puts true
      true 
    else
      puts expected.inspect, actual.inspect
    end
  else
    if expected == testsrc
      true
    else
      raise "Assertion failed: expected #{expected.inspect}, got #{testsrc.inspect}#{message ? " (#{message})" : ''}"
    end
  end
  # reset the ruby process environment  
end

def assert_finish(timeout_seconds, testsrc, message = '')
	eval(testsrc)
	puts true
end 

def assert_normal_exit(testsrc, *rest, timeout:1800, **opt)
th = Thread.new {
        eval(testsrc)
        $?
      }
      if !th.join(timeout)
        Process.kill :KILL, pid
        timeout_signaled = true
      end
      status = th.value
	  if status && status.signaled?
		raise "Assertion failed: expected normal exit, got signal #{status.termsig}"
	  else
		puts true
	  end
end

def assert_match(expected_pattern, testsrc, message = '', **argh)
  result = eval(testsrc).to_s
      if expected_pattern =~ result
        puts true
      else
        puts expected_pattern.inspect, result.inspect
      end
end






# def assert_finish(timeout_seconds, testsrc, message = '')
#   add_assertion testsrc, -> as do
#     timeout_seconds = BT.apply_timeout_scale(timeout_seconds)

#     as.show_progress(message) {
#       faildesc = nil
#       filename = as.make_srcfile
#       io = IO.popen("#{BT.ruby} -W0 #{filename}", err: as.err)
#       pid = io.pid
#       waited = false
#       tlimit = Time.now + timeout_seconds
#       diff = timeout_seconds
#       while diff > 0
#         if Process.waitpid pid, Process::WNOHANG
#           waited = true
#           break
#         end
#         if io.respond_to?(:read_nonblock)
#           if IO.select([io], nil, nil, diff)
#             begin
#               io.read_nonblock(1024)
#             rescue Errno::EAGAIN, IO::WaitReadable, EOFError
#               break
#             end while true
#           end
#         else
#           sleep 0.1
#         end
#         diff = tlimit - Time.now
#       end
#       if !waited
#         Process.kill(:KILL, pid)
#         Process.waitpid pid
#         faildesc = pretty(testsrc, "not finished in #{timeout_seconds} seconds", nil)
#       end
#       io.close
#       faildesc
#     }
#   end
# end	





# $start_time = Time.now



#     puts $start_time
#     $stdout.flush

# module Launchable
#   @@last_test_name = nil
#   @@failure_log = ''
#   @@duration = 0

#   def show_progress(message = '')
#     faildesc, t = super

#     if writer = BT.launchable_test_reports
#       if faildesc
#         @@failure_log += faildesc
#       end
#       repo_path = File.expand_path("#{__dir__}/../")
#       relative_path = File.join(__dir__, self.path).delete_prefix("#{repo_path}/")
#       if @@last_test_name != nil && @@last_test_name != relative_path
#         # The test path is a URL-encoded representation.
#         # https://github.com/launchableinc/cli/blob/v1.81.0/launchable/testpath.py#L18
#         test_path = "#{encode_test_path_component("file")}=#{encode_test_path_component(@@last_test_name)}"
#         if @@failure_log.size > 0
#           status = 'TEST_FAILED'
#         else
#           status = 'TEST_PASSED'
#         end
#         writer.write_object(
#           {
#             testPath: test_path,
#             status: status,
#             duration: t,
#             createdAt: Time.now.to_s,
#             stderr: @@failure_log,
#             stdout: nil,
#             data: {
#               lineNumber: self.lineno
#             }
#           }
#         )
#         @@duration = 0
#         @@failure_log.clear
#       end
#       @@last_test_name = relative_path
#       @@duration += t
#     end
#   end

#   private
#   def encode_test_path_component component
#     component.to_s.gsub('%', '%25').gsub('=', '%3D').gsub('#', '%23').gsub('&', '%26')
#   end
# end

# def exec_test(paths)
#   # setup
#   load_test paths
#   BT_STATE.count = 0
#   BT_STATE.error = 0
#   BT.columns = 0
#   BT.width = paths.map {|path| File.basename(path).size}.max + 2

#   # execute tests
#   if BT.wn > 1
#     concurrent_exec_test
#   else
#     prev_basename = nil
#     Assertion.all.each do |basename, assertions|
#       if !BT.quiet && basename != prev_basename
#         prev_basename = basename
#         $stderr.printf("%s%-*s ", erase(BT.quiet), BT.width, basename)
#         $stderr.flush
#       end
#       BT.columns = BT.width + 1
#       $stderr.puts if BT.verbose
#       count = BT_STATE.count
#       error = BT_STATE.error

#       assertions.each do |assertion|
#         BT_STATE.count += 1
#         assertion.call
#       end

#       if BT.tty
#         if BT_STATE.error == error
#           msg = "PASS #{BT_STATE.count-count}"
#           BT.columns += msg.size - 1
#           $stderr.print "#{BT.progress_bs}#{BT.passed}#{msg}#{BT.reset}" unless BT.quiet
#         else
#           msg = "FAIL #{BT_STATE.error-error}/#{BT_STATE.count-count}"
#           $stderr.print "#{BT.progress_bs}#{BT.failed}#{msg}#{BT.reset}"
#           BT.columns = 0
#         end
#       end
#       $stderr.puts if !BT.quiet and (BT.tty or BT_STATE.error == error)
#     end
#   end

#   # show results
#   unless BT.quiet
#     $stderr.puts(erase)

#     sec = Time.now - $start_time
#     $stderr.puts "Finished in #{'%.2f' % sec} sec\n\n" if Assertion.count > 0
#   end

#   Assertion.errbuf.each do |msg|
#     $stderr.puts msg
#   end

#   out = $stderr

#   if BT_STATE.error == 0
#     if Assertion.count == 0
#       out.puts "No tests, no problem" unless BT.quiet
#     else
#       out.puts "#{BT.passed}PASS#{BT.reset} all #{Assertion.count} tests"
#     end
#     true
#   else
#     $stderr.puts "#{BT.failed}FAIL#{BT.reset} #{BT_STATE.error}/#{BT_STATE.count} tests failed"
#     false
#   end
# end


# class Assertion < Struct.new(:src, :path, :lineno, :proc)
#   prepend Launchable
#   @count = 0
#   @all = Hash.new{|h, k| h[k] = []}
#   @errbuf = []

#   class << self
#     attr_reader :count, :errbuf

#     def all
#       @all
#     end

#     def add as
#       @all[as.path] << as
#       as.id = (@count += 1)
#     end
#   end

#   def initialize(*args)
#     super
#     self.class.add self
#     @category = self.path[/\Atest_(.+)\.rb\z/, 1]
#   end

#   def call
#     self.proc.call self
#   end

#   def assert_check(message = '', opt = '', **argh)
#     show_progress(message) {
#       result = get_result_string(opt, **argh)
#       yield(result)
#     }
#   end

#   def with_stderr
#     out = err = nil
#     r, w = IO.pipe
#     @err = w
#     err_reader = Thread.new{ r.read }

#     begin
#       out = yield
#     ensure
#       w.close
#       err = err_reader.value
#       r.close rescue nil
#     end

#     return out, err
#   end

#   def show_error(msg, additional_message)
#     msg = "#{BT.failed}\##{self.id} #{self.path}:#{self.lineno}#{BT.reset}: #{msg}  #{additional_message}"
#     if BT.tty
#       $stderr.puts "#{erase}#{msg}"
#     else
#       Assertion.errbuf << msg
#     end
#     BT_STATE.error += 1
#   end


#   def show_progress(message = '')
#     if BT.quiet || BT.wn > 1
#       # do nothing
#     elsif BT.verbose
#       $stderr.print "\##{@id} #{self.path}:#{self.lineno} "
#     elsif BT.tty
#       $stderr.print "#{BT.progress_bs}#{BT.progress[BT_STATE.count % BT.progress.size]}"
#     end

#     t = Time.now if BT.verbose || BT.launchable_test_reports
#     faildesc, errout = with_stderr {yield}
#     t = Time.now - t if BT.verbose || BT.launchable_test_reports

#     if !faildesc
#       # success
#       if BT.quiet || BT.wn > 1
#         # do nothing
#       elsif BT.tty
#         $stderr.print "#{BT.progress_bs}#{BT.progress[BT_STATE.count % BT.progress.size]}"
#       elsif BT.verbose
#         $stderr.printf(". %.3f\n", t)
#       else
#         BT.putc '.'
#       end
#     else
#       $stderr.print "#{BT.failed}F"
#       $stderr.printf(" %.3f", t) if BT.verbose
#       $stderr.print BT.reset
#       $stderr.puts if BT.verbose
#       show_error faildesc, message
#       unless errout.empty?
#         $stderr.print "#{BT.failed}stderr output is not empty#{BT.reset}\n", adjust_indent(errout)
#       end

#       if BT.tty and !BT.verbose and BT.wn == 1
#         $stderr.printf("%-*s%s", BT.width, path, BT.progress[BT_STATE.count % BT.progress.size])
#       end
#     end

#     [faildesc, t]
#   rescue Interrupt
#     $stderr.puts "\##{@id} #{path}:#{lineno}"
#     raise
#   rescue Exception => err
#     $stderr.print 'E'
#     $stderr.puts if BT.verbose
#     show_error err.message, message
#   ensure
#     begin
#       check_coredump
#     rescue CoreDumpError => err
#       $stderr.print 'E'
#       $stderr.puts if BT.verbose
#       show_error err.message, message
#       cleanup_coredump
#     end
#   end

#   def get_result_string(opt = '', timeout: BT.timeout, **argh)
#     if BT.ruby
#       timeout = BT.apply_timeout_scale(timeout)
#       filename = make_srcfile(**argh)
#       begin
#         kw = self.err ? {err: self.err} : {}
#         out = IO.popen("#{BT.ruby} -W0 #{opt} #{filename}", **kw)
#         pid = out.pid
#         th = Thread.new {out.read.tap {Process.waitpid(pid); out.close}}
#         th.value if th.join(timeout)
#       ensure
#         raise Interrupt if $? and $?.signaled? && $?.termsig == Signal.list["INT"]

#         begin
#           Process.kill :KILL, pid
#         rescue Errno::ESRCH
#           # OK
#         end
#       end
#     else
#       eval(src).to_s
#     end
#   end

#   def make_srcfile(frozen_string_literal: nil)
#     filename = "bootstraptest.#{self.path}_#{self.lineno}_#{self.id}.rb"
#     File.open(filename, 'w') {|f|
#       f.puts "#frozen_string_literal:#{frozen_string_literal}" unless frozen_string_literal.nil?
#       if $stress
#         f.puts "GC.stress = true" if $stress
#       else
#         f.puts ""
#       end
#       f.puts "class BT_Skip < Exception; end; def skip(msg) = raise(BT_Skip, msg.to_s)"
#       f.puts "print(begin; #{self.src}; rescue BT_Skip; $!.message; end)"
#     }
#     filename
#   end
# end

# def add_assertion src, pr
#   loc = caller_locations(2, 1).first
#   lineno = loc.lineno
#   path = File.basename(loc.path)

#   Assertion.new(src, path, lineno, pr)
# end

# def assert_equal(expected, testsrc, message = '', opt = '', **kwargs)
#   add_assertion testsrc, -> as do
#     as.assert_check(message, opt, **kwargs) {|result|
#       if expected == result
#         nil
#       else
#         desc = "#{result.inspect} (expected #{expected.inspect})"
#         pretty(testsrc, desc, result)
#       end
#     }
#   end
# end

# def assert_match(expected_pattern, testsrc, message = '', **argh)
#   add_assertion testsrc, -> as do
#     as.assert_check(message, **argh) {|result|
#       if expected_pattern =~ result
#         nil
#       else
#         desc = "#{expected_pattern.inspect} expected to be =~\n#{result.inspect}"
#         pretty(testsrc, desc, result)
#       end
#     }
#   end
# end

# def assert_not_match(unexpected_pattern, testsrc, message = '')
#   add_assertion testsrc, -> as do
#     as.assert_check(message) {|result|
#       if unexpected_pattern !~ result
#         nil
#       else
#         desc = "#{unexpected_pattern.inspect} expected to be !~\n#{result.inspect}"
#         pretty(testsrc, desc, result)
#       end
#     }
#   end
# end

# def assert_valid_syntax(testsrc, message = '')
#   add_assertion testsrc, -> as do
#     as.assert_check(message, '-c') {|result|
#       result if /Syntax OK/ !~ result
#     }
#   end
# end

# def assert_normal_exit(testsrc, *rest, timeout: BT.timeout, **opt)
#   add_assertion testsrc, -> as do
#     timeout = BT.apply_timeout_scale(timeout)
#     message, ignore_signals = rest
#     message ||= ''
#     as.show_progress(message) {
#       faildesc = nil
#       filename = as.make_srcfile
#       timeout_signaled = false
#       logfile = "assert_normal_exit.#{as.path}.#{as.lineno}.log"

#       io = IO.popen("#{BT.ruby} -W0 #{filename}", err: logfile)
#       pid = io.pid
#       th = Thread.new {
#         io.read
#         io.close
#         $?
#       }
#       if !th.join(timeout)
#         Process.kill :KILL, pid
#         timeout_signaled = true
#       end
#       status = th.value

#       if status && status.signaled?
#         signo = status.termsig
#         signame = Signal.list.invert[signo]
#         unless ignore_signals and ignore_signals.include?(signame)
#           sigdesc = "signal #{signo}"
#           if signame
#             sigdesc = "SIG#{signame} (#{sigdesc})"
#           end
#           if timeout_signaled
#             sigdesc << " (timeout)"
#           end
#           faildesc = pretty(testsrc, "killed by #{sigdesc}", nil)
#           stderr_log = File.read(logfile)
#           if !stderr_log.empty?
#             faildesc << "\n" if /\n\z/ !~ faildesc
#             stderr_log << "\n" if /\n\z/ !~ stderr_log
#             stderr_log.gsub!(/^.*\n/) { '| ' + $& }
#             faildesc << stderr_log
#           end
#         end
#       end
#       faildesc
#     }
#   end
# end

# def assert_finish(timeout_seconds, testsrc, message = '')
#   add_assertion testsrc, -> as do
#     timeout_seconds = BT.apply_timeout_scale(timeout_seconds)

#     as.show_progress(message) {
#       faildesc = nil
#       filename = as.make_srcfile
#       io = IO.popen("#{BT.ruby} -W0 #{filename}", err: as.err)
#       pid = io.pid
#       waited = false
#       tlimit = Time.now + timeout_seconds
#       diff = timeout_seconds
#       while diff > 0
#         if Process.waitpid pid, Process::WNOHANG
#           waited = true
#           break
#         end
#         if io.respond_to?(:read_nonblock)
#           if IO.select([io], nil, nil, diff)
#             begin
#               io.read_nonblock(1024)
#             rescue Errno::EAGAIN, IO::WaitReadable, EOFError
#               break
#             end while true
#           end
#         else
#           sleep 0.1
#         end
#         diff = tlimit - Time.now
#       end
#       if !waited
#         Process.kill(:KILL, pid)
#         Process.waitpid pid
#         faildesc = pretty(testsrc, "not finished in #{timeout_seconds} seconds", nil)
#       end
#       io.close
#       faildesc
#     }
#   end
# end



