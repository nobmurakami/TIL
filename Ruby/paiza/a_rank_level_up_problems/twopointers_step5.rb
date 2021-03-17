# 区間への足し算 (paizaランク A 相当)
# 配列内の特定の区間の全ての要素に足し算をする

# 普通に計算すると計算量がO(N^2)になってしまう
# 累積和を用いたimos法(いもす法)というアルゴリズムを使うと計算量を減らすことができる

n, m = gets.split.map { |i| i.to_i }
numbers = gets.split.map { |i| i.to_i }

# 【ステップ1】
# クエリ用の配列addを用意する
# addの要素数はnumbersより1つ多くする（ステップ2で配列をはみ出さないように）
add = [0] * (n + 1)

# 【ステップ2】
# addに対し、区間の始まりの要素にaを足し、
# 区間の終わりの次の要素からaを引く処理を行う
# ※今回は区間の入力値が1から始まるので-1している
m.times do
  l, u, a = gets.split.map { |i| i.to_i }
  add[l - 1] += a
  add[u] -= a
end

# 【ステップ3】
# addの累積和配列を作り、numbersに足す
sums = [0] * n
n.times do |i|
  sums[i] = sums[i - 1] + add[i]
  puts numbers[i] + sums[i]
end

# 新しい配列を作らずに次の書き方でも可
# n.times do |i|
#   puts numbers[i] + add[i]
#   add[i + 1] += add[i]
# end