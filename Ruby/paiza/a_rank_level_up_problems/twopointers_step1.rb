# 累積和の計算 (paizaランク C 相当)
n = gets.to_i
array = gets.split.map { |i| i.to_i }

sum = 0
array.each do |a|
  puts sum += a
end