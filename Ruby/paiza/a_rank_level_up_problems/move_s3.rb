# input = gets.chomp.split
# y, x = input[0..1].map {|i| i.to_i}
# d = input[2]

# move_d = gets.chomp

# if d == "N"
#   if move_d == "L"
#     x -= 1
#   elsif move_d == "R"
#     x += 1
#   end
# elsif d == "S"
#   if move_d == "L"
#     x += 1
#   elsif move_d == "R"
#     x -= 1
#   end
# elsif d == "E"
#   if move_d == "L"
#     y -= 1
#   elsif move_d == "R"
#     y += 1
#   end
# elsif d == "W"
#   if move_d == "L"
#     y += 1
#   elsif move_d == "R"
#     y -= 1
#   end
# end

# puts "#{y} #{x}"

y, x, now_direction = gets.chomp.split
y = y.to_i
x = x.to_i
d = gets.chomp
lr = 1

if d == "L"
  lr = -1
end

if now_direction == "N"
  x += lr
elsif now_direction == "S"
  x -= lr
elsif now_direction == "E"
  y += lr
elsif now_direction == "W"
  y -= lr
end

puts "#{y} #{x}"