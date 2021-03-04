y, x, n = gets.split.map {|i| i.to_i}

d = []
n.times do
  d << gets.chomp
end

d.each do |i|
  if i == "N"
    y -= 1
  elsif i == "S"
    y += 1
  elsif i == "E"
    x += 1
  elsif i == "W"
    x -= 1
  end
  puts "#{y} #{x}"
end