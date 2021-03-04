h, w = gets.split.map { |i| i.to_i }
s = h.times.map { gets.chomp }

flag_out = false
h.times do |y|
  w.times do |x|
    if s[y][x] == "*"
      s[y - 1][x] = "*" if y > 0
      s[y + 1][x] = "*" if y < h - 1
      s[y][x - 1] = "*" if x > 0
      s[y][x + 1] = "*" if x < w - 1
      flag_out = true
      break
    end
  end
  break if flag_out
end

h.times { |y| puts s[y] }