h, w = gets.split.map {|i| i.to_i}

s = []
h.times do
  s << gets
end

h.times do |y|
  w.times do |x|
    if s[y][x] == "#"
      puts "#{y} #{x}"
    end
  end
end