assert_equal 'ok', %{
  File.write("zzz_t1.rb", <<-END)
      begin
        th = Thread.new {  GC.start  }
		th.join
        $result = th.status == false ? :ok : :ng
      rescue NotImplementedError
        $result = :ok
      end
    END
  require "./zzz_t1.rb"
  $result
}