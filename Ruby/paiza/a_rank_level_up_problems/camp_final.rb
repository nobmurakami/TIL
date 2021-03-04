h, w = gets.split.map { |i| i.to_i }
ab = gets.chomp
s = h.times.map { gets.chomp }

count = 0
a_add = 0
sums = [1, 1]
flag_pass = true
ab_queue = [[], []]

if ab == "B"
  count += 1
  a_add += 1
end

puts "***"
puts "count: #{count}"
puts "ab: #{ab}"
puts "### flag_pass: #{flag_pass} ###"
puts "***"

h.times do |y|
  w.times do |x|
    if s[y][x] == "A"
      ab_queue[0] << [y, x, a_add]
    elsif s[y][x] == "B"
      ab_queue[1] << [y, x, 0]
    end
  end
end

puts "ab_queue 0: #{ab_queue[0]}"
puts "ab_queue 1: #{ab_queue[1]}"

while ab_queue[0].length > 0 || ab_queue[1].length > 0
  puts ""



  # 現在のプレイヤーのキューが空だったらパス
  # フラグを降ろして、もうパスできないようにする
  if ab_queue[count % 2].length == 0
    count += 1
    flag_pass = false
    puts "### flag_pass: #{flag_pass} ###"
  end

  # 現在のプレイヤーの先頭のキューのnとcountを比べている。
  # nは現在のプレイヤーが行動した回数。
  # countはターン数。
  # n が (count / 2) より大きければ、現在のプレイヤーはターンを終了しているということ。
  # なので、まだパスが実行されていなければ、次のプレイヤーにターンがうつる
  y, x, n = ab_queue[count % 2][0]
  puts "count: #{count}"
  puts "y: #{y}, x: #{x}, n: #{n}"
  puts "count / 2: #{count / 2}"
  if count / 2 < n && flag_pass
    count += 1
    y, x, n = ab_queue[count % 2][0]
    puts "[変更] y: #{y}, x: #{x}, n: #{n}"
  end

  # このターンのプレイヤーの先頭のキューを取り出す
  ab_queue[count % 2].shift

  # このターンでマスに記入するプレイヤー名を定義
  if count % 2 == 0
    ab = "A"

    puts "### Aのターン ###"
  else
    ab = "B"

    puts "### Bのターン ###"
  end

  if y > 0 && s[y - 1][x] == "."
    s[y - 1][x] = ab
    sums[count % 2] += 1
    ab_queue[count % 2] << [y - 1, x, n + 1]
  end
  if y < h - 1 && s[y + 1][x] == "."
    s[y + 1][x] = ab
    sums[count % 2] += 1
    ab_queue[count % 2] << [y + 1, x, n + 1]
  end
  if x > 0 && s[y][x - 1] == "."
    s[y][x - 1] = ab
    sums[count % 2] += 1
    ab_queue[count % 2] << [y, x - 1, n + 1]
  end
  if x < w - 1 && s[y][x + 1] == "."
    s[y][x + 1] = ab
    sums[count % 2] += 1
    ab_queue[count % 2] << [y, x + 1, n + 1]
  end

  puts "***"
  puts "count: #{count}"
  puts "ab: #{ab}"
  puts "***"
  h.times { |y| puts s[y] }
  puts "ab_queue 0: #{ab_queue[0]}"
  puts "ab_queue 1: #{ab_queue[1]}"
end

h.times { |y| puts s[y] }

puts "#{sums[0]} #{sums[1]}"
if sums[0] > sums[1]
  result = "A"
else
  result = "B"
end
puts result