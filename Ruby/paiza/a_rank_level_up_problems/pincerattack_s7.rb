# いびつなひとりリバーシ (paizaランク B 相当)
$h, $w, n = gets.split.map { |i| i.to_i }
map = $h.times.map { gets.chomp }
yx = n.times.map do
  gets.split.map { |i| i.to_i }
end

# 上下
def check_column(y, x, map)
  plus_minus = [1, -1]
  plus_minus.each do |y_pm|
    i = 0
    while true
      i += 1
      # "#"にぶつかるかマップの外に出たら打ち切る
      if y + i * y_pm < 0 || y + i * y_pm >= $h || map[y + i * y_pm][x] == "#"
        break
      elsif map[y + i * y_pm][x] == '*'
        i.times do |j|
          map[y + j * y_pm][x] = '*'
        end
        break
      end
    end
  end
end

# 左右
def check_row(y, x, map)
  plus_minus = [1, -1]
  plus_minus.each do |x_pm|
    i = 0
    while true
      i += 1
      # "#"にぶつかるかマップの外に出たら打ち切る
      if x + i * x_pm < 0 || x + i * x_pm >= $w || map[y][x + i * x_pm] == "#"
        break
      elsif map[y][x + i * x_pm] == '*'
        i.times do |j|
          map[y][x + j * x_pm] = '*'
        end
        break
      end
    end
  end
end

# 斜めの操作。右下、左下、右上、左上、の順に探索する
def check_diagonal(y, x, map)
  plus_minus = [1, -1]
  plus_minus.each do |y_pm|
    plus_minus.each do |x_pm|
      i = 0
      while true
        i += 1
        # "#"にぶつかるかマップの外に出たら打ち切る
        if y + i * y_pm < 0 || y + i * y_pm >= $h || x + i * x_pm < 0 || x + i * x_pm >= $w || map[y + i * y_pm][x + i * x_pm] == "#"
          break
        elsif map[y + i * y_pm][x + i * x_pm] == '*'
          i.times do |j|
            map[y + j * y_pm][x + j * x_pm] = '*'
          end
          break
        end
      end
    end
  end
end

yx.each do |i|
  y, x = i[0], i[1]
  map[y][x] = '*'

  check_column(y, x, map)
  check_row(y, x, map)
  check_diagonal(y, x, map)
end

map.each { |i| puts i }