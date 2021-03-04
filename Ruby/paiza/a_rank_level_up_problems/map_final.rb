# h, w = gets.split.map {|i| i.to_i}

# s = []
# h.times do
#   s << gets
# end

# h.times do |y|
#   w.times do |x|
#     if (y == 0 || s[y - 1][x] == "#") && (x == 0 || s[y][x - 1] == "#")
#       if (y == h - 1 || s[y + 1][x] == "#") && (x == w -1 || s[y][x + 1] == "#")
#         puts "#{y} #{x}"
#       end
#     end
#   end
# end

h, w = gets.split.map {|i| i.to_i}

s = []
h.times do
  s << gets
end

h.times do |y|
  w.times do |x|
    flag_row = false
    flag_column = false

    if x == 0 || s[y][x - 1] == "#"
      if x == w -1 || s[y][x + 1] == "#"
        flag_row = true
      end
    end

    if y == 0 || s[y - 1][x] == "#"
      if y == h - 1 || s[y + 1][x] == "#"
        flag_column = true
      end
    end

    if flag_column && flag_row
      puts "#{y} #{x}"
    end
  end
end