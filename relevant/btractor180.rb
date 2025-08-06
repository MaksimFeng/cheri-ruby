# # Ractor#receive_if can't be called recursively
# assert_equal '[[:e1, 1], [:e2, 2]]', %q{
#   r = Ractor.new Ractor.current do |main|
#     main << 1
#     main << 2
#     main << 3
#   end

#   a = []

#   Ractor.receive_if do |msg|
#     begin
#       Ractor.receive
#     rescue Ractor::Error
#       a << [:e1, msg]
#     end
#     true # delete 1 from queue
#   end

#   Ractor.receive_if do |msg|
#     begin
#       Ractor.receive_if{}
#     rescue Ractor::Error
#       a << [:e2, msg]
#     end
#     true # delete 2 from queue
#   end

#   a #
# }

# # dtoa race condition
# assert_equal '[:ok, :ok, :ok]', %q{
#   n = 3
#   n.times.map{
#     Ractor.new{
#       10_000.times{ rand.to_s }
#       :ok
#     }
#   }.map(&:take)
# }

# # Ractor.make_shareable issue for locals in proc [Bug #18023]
# assert_equal '[:a, :b, :c, :d, :e]', %q{
#   v1, v2, v3, v4, v5 = :a, :b, :c, :d, :e
#   closure = Ractor.current.instance_eval{ Proc.new { [v1, v2, v3, v4, v5] } }

#   Ractor.make_shareable(closure).call
# }

n = 3
  n.times.map{
    Ractor.new{
      10_000.times{ 0.00086518750471209493.to_s }
      :ok
    }
  }.map(&:take)
