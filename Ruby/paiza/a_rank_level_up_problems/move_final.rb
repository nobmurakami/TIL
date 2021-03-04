x, y, n = gets.split.map {|i| i.to_i}
directions = ["N", "E", "S", "W"]
now_direction = 0

move_direction = []
n.times do
  move_direction << gets.chomp
end

move_direction.each do |d|
  if d == "R"
    lr = 1
  elsif d == "L"
    lr = -1
  end

  if directions[now_direction] == "N"
    x += lr
  elsif directions[now_direction] == "E"
    y += lr
  elsif directions[now_direction] == "S"
    x -= lr
  elsif directions[now_direction] == "W"
    y -= lr
  end

  puts "#{x} #{y}"
  now_direction = (now_direction + lr) % 4
end


