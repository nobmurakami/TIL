h, w, sy, sx, m = gets.chomp.split
h = h.to_i
w = w.to_i
sy = sy.to_i
sx = sx.to_i

s = []
h.times do
  s << gets
end

if m == "N"
  sy -= 1
elsif m == "E"
  sx += 1
elsif m == "S"
  sy += 1
elsif m == "W"
  sx -= 1
end

if s[sy][sx] == "."
puts "Yes"
else
puts "No"
end