# いびつなリバーシ対戦（２人） (paizaランク A 相当)
$h, $w, n = gets.split.map { |i| i.to_i }
$map = $h.times.map { gets.chomp }
yx = (n * 2).times.map do
  gets.split.map { |i| i.to_i }
end

$p_name = ["A", "B"]
p_index = 0

# 上下
def check_column(y, x, p_index)
  plus_minus = [1, -1]
  plus_minus.each do |y_pm|
    i = 0
    while true
      i += 1
      # マップの端、"#"のいずれかにぶつかったら打ち切る
      if y + i * y_pm < 0 ||
        y + i * y_pm >= $h ||
        $map[y + i * y_pm][x] == "#"
        break
      elsif $map[y + i * y_pm][x] == $p_name[p_index]
        i.times do |j|
          $map[y + j * y_pm][x] = $p_name[p_index]
        end
        break
      end
    end
  end
end

# 左右
def check_row(y, x, p_index)
  plus_minus = [1, -1]
  plus_minus.each do |x_pm|
    i = 0
    while true
      i += 1
      # マップの端、"#"のいずれかにぶつかったら打ち切る
      if x + i * x_pm < 0 ||
        x + i * x_pm >= $w ||
        $map[y][x + i * x_pm] == "#"
        break
      elsif $map[y][x + i * x_pm] == $p_name[p_index]
        i.times do |j|
          $map[y][x + j * x_pm] = $p_name[p_index]
        end
        break
      end
    end
  end
end

# 斜めの操作。右下、左下、右上、左上、の順に探索する
def check_diagonal(y, x, p_index)
  plus_minus = [1, -1]
  plus_minus.each do |y_pm|
    plus_minus.each do |x_pm|
      i = 0
      while true
        i += 1
        # マップの端、"#"のいずれかにぶつかったら打ち切る
        if y + i * y_pm < 0 ||
          y + i * y_pm >= $h ||
          x + i * x_pm < 0 ||
          x + i * x_pm >= $w ||
          $map[y + i * y_pm][x + i * x_pm] == "#"
          break
        elsif $map[y + i * y_pm][x + i * x_pm] == $p_name[p_index]
          i.times do |j|
            $map[y + j * y_pm][x + j * x_pm] = $p_name[p_index]
          end
          break
        end
      end
    end
  end
end

yx.each do |i|
  y, x = i[0], i[1]
  $map[y][x] = $p_name[p_index]

  check_column(y, x, p_index)
  check_row(y, x, p_index)
  check_diagonal(y, x, p_index)

  p_index = (p_index + 1) % 2
end

$map.each { |i| puts i }