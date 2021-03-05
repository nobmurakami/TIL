# リバーシの操作（斜め） (paizaランク C 相当)
h, w, y, x = gets.split.map {|i| i.to_i}
map = h.times.map { gets.chomp }

# 石を置く
map[y][x] = "*"

# 上下左右を区別する変数
plus_minus = [1, -1]

# 二重each文で、斜め右下、斜め左下、斜め右上、斜め左上、の順に探索する
plus_minus.each do |y_pm|
  plus_minus.each do |x_pm|
    i = 0
    while true
      i += 1
      # マップの外に出たら打ち切る
      if y + i * y_pm < 0 || y + i * y_pm >= h || x + i * x_pm < 0 || x + i * x_pm >= w
        break
      elsif map[y + i * y_pm][x + i * x_pm] == "*"
        i.times do |j|
          map[y + j * y_pm][x + j * x_pm] = "*"
        end
        break
      end
    end
  end
end

map.each {|i| puts i}