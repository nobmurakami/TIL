# 最長の区間 (paizaランク B 相当)
# 要素の和がM以下になる部分列の最大の長さを求める
N, M = gets.split.map { |i| i.to_i }
array = gets.split.map { |i| i.to_i }

# 累積和の計算
sums = [0]
N.times do |i|
  sums << sums[-1] + array[i]
end

# 計算量を減らすためにしゃくとり法で実装
# 区間の総和がM以下の場合、区間の長さがcountより大きかったらcountを更新し、先頭を伸ばす
# 区間の総和がMを超えていたら末尾を縮める
# 先頭が配列の外に出たら終了
count = 0  # 初期値
l = 0 # 区間の始まり（末尾）の初期値
u = 0 # 区間の終わり（先頭）の初期値
while true
  if u >= N
    break
  elsif sums[u + 1] - sums[l] <= M
    if u - l + 1 > count
      count = u - l + 1
    end
    u += 1
  else
    l += 1
  end
end

puts count