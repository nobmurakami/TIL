def move(y, x, front)
  if front == "N"
    y -= 1
  elsif front == "E"
    x += 1
  elsif front == "S"
    y += 1
  elsif front == "W"
    x -= 1
  end

  return y, x
end

h, w, y, x, n = gets.split.map {|i| i.to_i}

s = []
h.times do
  s << gets.chomp
end

time_lr = []
n.times do
  time_lr << gets.chomp.split
end

directions = ["N", "E", "S", "W"]
now_direction = 0
time_index = 0
s[y][x] = "*"

100.times do |t_now|
  if time_index < n && t_now.to_s == time_lr[time_index][0]
    d = time_lr[time_index][1]
    time_index += 1
    if d == "R"
      now_direction = (now_direction + 1) % 4
    elsif d == "L"
      now_direction = (now_direction - 1) % 4
    end
  end

  y, x = move(y, x, directions[now_direction])
  
  if y < 0 || y >= h || x < 0 || x >= w
    break
  elsif s[y][x] == "#" || s[y][x] == "*"
    break
  else
    s[y][x] = "*"
  end
end

s.each do |i|
  puts i
end

