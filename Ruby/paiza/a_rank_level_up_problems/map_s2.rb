# paizaラーニングトップ > レベルアップ問題集 > Aランクレベルアップメニュー（言語選択） > 問題一覧 Ruby編 > 盤面の情報変更

hwn = gets
h = hwn.split[0].to_i
w = hwn.split[1].to_i
n = hwn.split[2].to_i

str_ary = []
h.times do
  str_ary << gets.chomp
end

yx_ary = []
n.times do
  yx_ary << gets.split
end

yx_ary.each do |yx|
  y = yx[0].to_i
  x = yx[1].to_i
  str_ary[y][x] = "#"
end

str_ary.each do |str|
  puts str
end