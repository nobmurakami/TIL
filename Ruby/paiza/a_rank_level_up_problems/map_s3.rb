# hw = gets.chomp.split
# h = hw[0].to_i
# w = hw[1].to_i

# strings = []
# h.times do
  # strings << gets.chomp
# end

# yx = []
# strings.each_with_index do |s, y|
#   s.each_char.with_index do |c, x|
    # if ( x == 0 && s[1] == "#" ) || ( x == w - 1 && s[-2] == "#" )
      # yx << "#{y} #{x}"
    # elsif s[x-1] == "#" && s[x+1] == "#"
      # yx << "#{y} #{x}"
#     end
#   end
# end

# puts yx

###################################

# h, w = gets.split.map {|i| i.to_i}

# strings = []
# h.times do
#   strings << gets
# end

# strings.each_with_index do |s, y|
#   s.each_char.with_index do |c, x|
#     if x == 0 || strings[y][x - 1] == "#"
#       if x == w - 1 || strings[y][x + 1] == "#"
#         puts "#{y} #{x}"
#       end
#     end
#   end
# end

###################################

h, w = gets.split.map {|i| i.to_i}

strings = []
h.times do
  strings << gets
end

h.times do |y|
  w.times do |x|
    if x == 0 || strings[y][x - 1] == "#"
      if x == w - 1 || strings[y][x + 1] == "#"
        puts "#{y} #{x}"
      end
    end
  end
end