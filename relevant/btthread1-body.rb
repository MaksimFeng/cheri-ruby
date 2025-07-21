Thread.new { fork { 
puts "Hello from child process"	
GC.start } }.join
pid, status = Process.wait2
$result = status.success? ? :ok : :ng
puts $result
