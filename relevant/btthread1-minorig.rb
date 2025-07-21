assert_equal 'ok', %{
	begin
	Thread.new { fork { GC.start } }.join
	pid, status = Process.wait2
	$result = status.success? ? :ok : :ng
	end
  $result
}

