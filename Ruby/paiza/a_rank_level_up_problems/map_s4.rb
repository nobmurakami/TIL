h, w = gets.split.map {|i| i.to_i}

s = []
h.times do
  s << gets
end

h.times do |y|
  w.times do |x|
    if y == 0 || s[y - 1][x] == "#"
      if y == h - 1 || s[y + 1][x] == "#"
        puts "#{y} #{x}"
      end
    end
  end
end