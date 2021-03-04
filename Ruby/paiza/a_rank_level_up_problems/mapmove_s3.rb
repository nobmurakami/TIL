h, w, sy, sx, n = gets.chomp.split.map {|i| i.to_i}

s = []
h.times do
  s << gets.chomp
end

moves = []
n.times do
  moves << gets.chomp
end

def move(y, x, front, lr)
  if front == "N"
    x += lr
  elsif front == "E"
    y += lr
  elsif front == "S"
    x -= lr
  elsif front == "W"
    y -= lr
  end

  return y, x
end

directions = ["N", "E", "S", "W"]
now_direction = 0
y, x = sy, sx

moves.each do |m|
  front = directions[now_direction]

  if m == "R"
    lr = 1
  elsif m == "L"
    lr = -1
  end

  y, x = move(y, x, front, lr)
  now_direction = (now_direction + lr) % 4

  if y < 0 || y >= h || x < 0 || x >= w
    puts "Stop"
    break
  elsif s[y][x] == "#" 
    puts "Stop"
    break
  else
    puts "#{y} #{x}"
  end
end