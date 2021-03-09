# 動的計画法を用いた部分和問題のサンプルコード
# 3, 1, 6の3枚のカードから何枚か選んで数字を足した時、現れる可能性のある数字の一覧を出力する。
num_list = [3, 1, 6]  # 数字は順不同でOK
S = num_list.sum  # 10
N = num_list.length  # 3

# 動的計画表の初期化
# 3行(0..2)*11列(0..10)のセルを全て0で埋める 
dp_table = Array.new(N) { Array.new(S + 1, 0) }

# 1番目のカード(3)
# 動的計画表0行目の3列目(カードの数字と同じ番号)以降のセルに3を記入
# なお、本当はこの処理はいらない（次の2番目以降のカードの繰り返し処理の1回目で同様のことを行うため）
(S + 1).times do |j|
  if num_list[0] <= j
    dp_table[0][j] = num_list[0]
  end
end

# 2番目以降のカード
N.times do |i|
  (S + 1).times do |j|
    tmp_not_choice = dp_table[i-1][j]
    # カード単体の数字が表の列番号より大きかった場合、そのカードは追加せず、セルには一つ上のセルの値をコピペする
    if num_list[i] > j
      dp_table[i][j] = tmp_not_choice
    else
      # そうでない場合、そのカードを追加した場合と追加しなかった場合の合計を比べて、大きい方をセルに記入する
      # 追加する場合の合計値は、1つ前の行を見て決める
      tmp_choice = dp_table[i-1][j - num_list[i]] + num_list[i]
      dp_table[i][j] = [tmp_choice, tmp_not_choice].max
    end
  end
end

# 動的計画表を一つの配列にまとめ、重複を削除した上で昇順で並び替えて出力
result_list = []
dp_table.each { |i| result_list += i }
puts result_list.uniq.sort

# 出力結果
# 0
# 1
# 3
# 4
# 6
# 7
# 9
# 10