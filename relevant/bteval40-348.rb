# assert_normal_exit %q{
#   hash = {}
#   ("aaaa".."matz").each_with_index do |s, i|
#     hash[s] = i
#   end
#   begin
#     eval "class C; @@h = #{hash.inspect}; end"
#   end
# }, '[ruby-core:25714]'

all = []
("bkce".."blpj").each do |s|
  all << s
end

size = all.size
b = size / 2
mid = all[b]
puts "mid: #{mid}"
