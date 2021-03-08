# 累積和の計算 (paizaランク C 相当)
n = gets.to_i
array = gets.split.map { |i| i.to_i }

sums = [0]
n.times do |i|
  sums << sums[-1] + array[i]
end
puts sums

# sum = 0
# array.each do |a|
#   puts sum += a
# end