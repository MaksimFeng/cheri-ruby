  hash = {}
  ("aaaa".."matz").each_with_index do |s, i|
    hash[s] = i
  end
  begin
    eval "class C; @@h = #{hash.inspect}; end"
  end

  puts "done"


  # bc
