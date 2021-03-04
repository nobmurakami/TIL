x, y, n = gets.split.map {|i| i.to_i}
directions = ["E", "S", "W", "N"]
now_direction = 0
count = 0
max_count = 1
first = true

def move(direction, x, y)
  if direction == "N"
    y -= 1
  elsif direction == "E"
    x += 1
  elsif direction == "S"
    y += 1
  elsif direction == "W"
    x -= 1
  end
  return x, y
end

n.times do
  puts directions[now_direction] # デバッグ用
  x, y = move(directions[now_direction], x, y)
  count += 1
  if first && count == max_count
    first = false
    count = 0
    now_direction = (1 + now_direction) % 4
  elsif count == max_count
    first = true
    count = 0
    max_count += 1
    now_direction = (1 + now_direction) % 4
  end
end

puts "#{x} #{y}"