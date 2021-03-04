# 裏返せる可能性（縦横） (paizaランク C 相当)
h, w, sy, sx = gets.split.map {|i| i.to_i}
map = h.times.map { "." * w }

h.times do |y|
  w.times do |x|
    if y == sy && x == sx
      map[y][x] = "!"
    elsif y == sy || x == sx
      map[y][x] = "*"
    end
  end
end

map.each {|i| puts i}