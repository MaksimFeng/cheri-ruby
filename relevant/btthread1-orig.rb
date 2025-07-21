assert_equal 'ok', %{
  File.write("zzz_t1.rb", <<-END)
      begin
        Thread.new { fork { GC.start } }.join
        pid, status = Process.wait2
        $result = status.success? ? :ok : :ng
      rescue NotImplementedError
        $result = :ok
      end
    END
  require "./zzz_t1.rb"
  $result
}
