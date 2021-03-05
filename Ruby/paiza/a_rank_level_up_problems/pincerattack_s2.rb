# リバーシの操作（縦横） (paizaランク C 相当)
$h, $w, y, x = gets.split.map {|i| i.to_i}
map = $h.times.map { gets.chomp }

# 現在地y, xから左右を順番に探索するメソッド
def check_row(y, x, map)
  # lrで探索の方向を切り替える
  [-1, 1].each do |lr|
    i = 0
    while true
      i += 1
      # マップの外に出たら探索を打ち切る
      if x + i * lr < 0 || x + i * lr >= $w
        break
      # 自分の石が見つかったら、間のマスを自分の石で埋めて、探索を打ち切る
      elsif map[y][x + i * lr] == "*"
        i.times do |j|
          map[y][x + j * lr] = "*"
        end
        break
      end
    end
  end
end

# 現在地y, xから上下を順番に探索するメソッド
def check_column(y, x, map)
  # lrで探索の方向を切り替える
  [-1, 1].each do |lr|
    i = 0
    while true
      i += 1
      # マップの外に出たら探索を打ち切る
      if y + i * lr < 0 || y + i * lr >= $h
        break
      # 自分の石が見つかったら、間のマスを自分の石で埋めて、探索を打ち切る
      elsif map[y + i * lr][x] == "*"
        i.times do |j|
          map[y + j * lr][x] = "*"
        end
        break
      end
    end
  end
end

# 石を置く
map[y][x] = "*"

check_row(y, x, map)
check_column(y, x, map)

map.each {|i| puts i}
