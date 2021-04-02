/* 
 * 複数行での
 * コメント
 */

// 一行コメント

// Hello World
print( "Hello, World!" )

// 変数
// var name: Type = value でType型の変数nameを宣言し、valueで初期化する
var explicitDouble: Double = 70 // 70.0
 
/// 型が省略された場合は、型推論により初期値の型が適用される
var implicitInteger = 70    // Int型
var implicitDouble = 70.0   // Double型

// 定数
// let name:Type = value でType型の定数nameにvalueを設定する
// 型推論可能な場合、型の表記は省略できる
let theAnswer = 42


// 型の変換
let label = "The width is "
let width = 94
let widthLabel = label + String(width)


// 式展開
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary) // I have 3 apples.
print(fruitSummary) // I have 8 pieces of fruit.

// 「"""」で囲むと複数行の文字列を作成できる
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
print(quotation)
// I said "I have 3 apples."
// And then I said "I have 8 pieces of fruit."


// 配列と辞書（ハッシュ、連想配列）
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"
shoppingList.append("blue paint")
print(shoppingList) // ["catfish", "bottle of water", "tulips", "blue paint"]

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print(occupations)  // ["Kaylee": "Mechanic", "Malcolm": "Captain", "Jayne": "Public Relations"]

let people = ["Anna": 67, "Bety": 8, "Jack": 33, "Sam": 25]
for (name, age) in people {
    print("\(name) is \(age) years old.")
}
// Sam is 25 years old.
// Bety is 8 years old.
// Jack is 33 years old.
// Anna is 67 years old.

// 空の配列を定義する時は型を指定する
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// 既に定義されている配列や辞書を空にする時は型の指定は不要
shoppingList = []
occupations = [:]


// 制御構造

// for文とif文
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore) // "11"

for i in 0..<10 {
  print(i)
} // ログに0から9までの数字が表示される

for i in 0...<10 {
  print(i)
} // ログに0から10までの数字が表示される

// switch文とwhere
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):  // 末尾に「pepper」がある場合
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
// "Is it a spicy red pepper?"


// 関数とメソッドの宣言
// 仮引数に型を指定する
// 「->」で戻り値の型を指定する
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

// 上の関数は次のように書くこともできる
// 呼び出す時の引数の名前を変えることで、英語のように関数の呼び出しを記述できる
func greet(to person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(to: "Bob", day: "Tuesday")


// オプショナルバインディング
// オプショナル型の値がnilではないという判定と、アンラップして別変数への代入を同時に行うこと
var price: Int? = 100

if let p = price {
    print("価格：\(p)円")
} else {
    print("価格：未定")
}
