# 値取得・出力サンプルコード

# 入力される値
# 2
# 2 5
# 3 4

# 期待する出力
# hello = 2 , world = 5
# hello = 3 , world = 4

# Python3
input_line = int(input())
for i in range(input_line):
    s = input().rstrip().split(' ')
    print("hello = "+s[0]+" , world = "+s[1])