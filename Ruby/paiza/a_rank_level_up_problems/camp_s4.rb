h, w = gets.split.map { |i| i.to_i }
s = h.times.map { gets.chomp }

queue = []
count = 0

h.times do |y|
  w.times do |x|
    if s[y][x] == "*"
      queue << [y, x, count]
    end
  end
end

while queue.length > 0
  y, x, count = queue.shift
  s[y][x] = count.to_s

  if y > 0 && s[y - 1][x] == "."
    queue << [y - 1, x, count + 1]
  end
  if y < h - 1 && s[y + 1][x] == "."
    queue << [y + 1, x, count + 1]
  end
  if x > 0 && s[y][x - 1] == "."
    queue << [y, x - 1, count + 1]
  end
  if x < w - 1 && s[y][x + 1] == "."
    queue << [y, x + 1, count + 1]
  end
end

h.times { |y| puts s[y] }