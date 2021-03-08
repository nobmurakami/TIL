# 区間和の計算 (paizaランク B 相当)
array_n = gets.to_i
array = gets.split.map { |i| i.to_i }
query_n = gets.to_i

# 累積和の計算
sums = [0]
array_n.times do |i|
  sums << sums[-1] + array[i]
end

# 配列Aの区間l..uの和は、累積和S[u+1]-S[l]で求められる
# A[l]+...+A[u]
# = (A[0]+...+A[u]) - (A[0]+...+A[l-1])
# = S[u+1]-S[l]

query_n.times do
  l, u = gets.split.map { |i| i.to_i }
  puts sums[u + 1] - sums[l]
end

# 次の実装だと計算量が膨大になってしまう
# (要素数と区間数が100,000の時、10倍の実行時間がかかる)
# query_n.times do
#   l, u = gets.split.map { |i| i.to_i }
#   puts array[l..u].sum
# end