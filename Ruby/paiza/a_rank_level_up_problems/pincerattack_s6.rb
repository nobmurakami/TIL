# いびつなひとりリバーシ（１ターン） (paizaランク B 相当)
h, w = gets.split.map { |i| i.to_i }
map = h.times.map { gets.chomp }

y , x = 0, 0

# 石を置く場所の座標を取得
h.times do |sy|
  w.times do |sx|
    if map[sy][sx] == '!'
      y, x = sy, sx
    end
  end
end

# 石を置く
map[y][x] = '*'

# 上下左右を区別する変数
plus_minus = [1, -1]

# 上下
plus_minus.each do |y_pm|
  i = 0
  while true
    i += 1
    # "#"にぶつかるかマップの外に出たら打ち切る
    if y + i * y_pm < 0 || y + i * y_pm >= h || map[y + i * y_pm][x] == "#"
      break
    elsif map[y + i * y_pm][x] == '*'
      i.times do |j|
        map[y + j * y_pm][x] = '*'
      end
      break
    end
  end
end

# 左右
plus_minus.each do |x_pm|
  i = 0
  while true
    i += 1
    # "#"にぶつかるかマップの外に出たら打ち切る
    if x + i * x_pm < 0 || x + i * x_pm >= w || map[y][x + i * x_pm] == "#"
      break
    elsif map[y][x + i * x_pm] == '*'
      i.times do |j|
        map[y][x + j * x_pm] = '*'
      end
      break
    end
  end
end

# 斜めの操作。右下、左下、右上、左上、の順に探索する
plus_minus.each do |y_pm|
  plus_minus.each do |x_pm|
    i = 0
    while true
      i += 1
      # "#"にぶつかるかマップの外に出たら打ち切る
      if y + i * y_pm < 0 || y + i * y_pm >= h || x + i * x_pm < 0 || x + i * x_pm >= w || map[y + i * y_pm][x + i * x_pm] == "#"
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

map.each { |i| puts i }
