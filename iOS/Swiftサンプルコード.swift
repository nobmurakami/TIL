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


// for文
for i in 0..<10 {
  print(i)
} // ログに0から9までの数字が表示される

for i in 0...<10 {
  print(i)
} // ログに0から10までの数字が表示される


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


// メソッドや関数は "func"文法を使って宣言する。
// パラメータ名の付け方に注意。-> で戻り値の型を宣言する
func sayHello(to personName: String) -> String {
    let greeting = "こんにちは、" + personName + "さん"
    return greeting
}
// "こんにちは、太郎さん"を出力
print(sayHello(to: "太郎"))