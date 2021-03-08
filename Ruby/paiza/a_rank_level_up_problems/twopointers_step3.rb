# 最短の区間 (paizaランク B 相当)
n, m = gets.split.map { |i| i.to_i }
array = gets.split.map { |i| i.to_i }

# 累積和の計算
sums = [0]
n.times do |i|
  sums << sums[-1] + array[i]
end

# 以下のように区間を全探索するとタイムオーバーになる
# lengths = []
# n.times do |i|
#   (n - 1).times do |j|
#     l, u = n - j, i
#     if sums[u + 1] - sums[l] >= m
#       lengths << u + 1 - l
#     end
#   end
# end

# 計算量を減らすためにしゃくとり法で実装
# 区間の総和がM以上なら末尾を縮める
# 区間の総和がMより少なければ先頭を伸ばす
# 先頭が配列の外に出たら終了
count = Float::INFINITY # 初期値として正の無限大を指定
l = 0 # 区間の始まり（末尾）の初期値
u = 0 # 区間の終わり（先頭）の初期値
while true
  if u >= n
    break
  elsif sums[u + 1] - sums[l] >= m
    if u - l + 1 < count
      count = u - l + 1
    end
    l += 1
  else
    u += 1
  end
end

if count == Float::INFINITY
  count = -1
end
puts count