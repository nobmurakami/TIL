h, w, sy, sx, d, m = gets.chomp.split
h = h.to_i
w = w.to_i
sy = sy.to_i
sx = sx.to_i

s = []
h.times do
  s << gets.chomp
end

if m == "R"
  lr = 1
elsif m == "L"
  lr = -1
end

if d == "N"
  sx += lr
elsif d == "E"
  sy += lr
elsif d == "S"
  sx -= lr
elsif d == "W"
  sy -= lr
end

if s[sy][sx] == "."
  puts "Yes"
else
  puts "No"
end