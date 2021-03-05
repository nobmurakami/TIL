# 裏返せる可能性（斜め） (paizaランク C 相当)
h, w, y, x = gets.split.map {|i| i.to_i}
map = h.times.map { "." * w }

# 石を置く
map[y][x] = "!"

# 現在地y, xの斜め上方向の左右を*にする
plus_minus = [1, -1]

# 二重each文で、斜め右下、斜め左下、斜め右上、斜め左上、の順にマスを*で埋める
plus_minus.each do |y_pm|
  plus_minus.each do |x_pm|
    i = 0
    while true
      i += 1
      # マップの外に出たら打ち切る
      if y + i * y_pm < 0 || y + i * y_pm >= h || x + i * x_pm < 0 || x + i * x_pm >= w
        break
      else
        map[y + i * y_pm][x + i * x_pm] = "*"
      end
    end
  end
end

map.each {|i| puts i}
