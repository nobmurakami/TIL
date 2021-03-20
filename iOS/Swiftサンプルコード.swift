/* 
 * 複数行での
 * コメント
 */

// 一行コメント

// Hello World
print( "Hello, World!" )

// 変数宣言と初期化
// var name: Type = value でType型の変数nameを宣言し、valueで初期化する
var explicitDouble: Double = 70 // 70.0
 
/// 型が省略された場合は、型推論により初期値の型が適用される
var implicitInteger = 70    // Int型
var implicitDouble = 70.0   // Double型
 
// let name:Type = value でType型の定数nameにvalueを設定する
// 型推論可能な場合、型の表記は省略できる
let theAnswer = 42


// 式展開
// 文字列リテラル"..."の中に\(expr)と記述すつることで、式exprの内容が展開される
let リンゴの数 = 3
let みかんの数 = 5
let リンゴ説明 = "私は\(リンゴの数)個のリンゴを持っている。"  // ”私は3個のリンゴを持っている。"
let 果物説明 = "私は\(リンゴの数 + みかんの数)個の果物を持っている。" //"私は8個の果物を持っている。"


// for文
for i in 0..<10 {
  print(i)
} // ログに0から9までの数字が表示される

for i in 0...<10 {
  print(i)
} // ログに0から10までの数字が表示される


// 辞書（ハッシュ、連想配列）
// 辞書の定義の例
let people = ["Anna": 67, "Bety": 8, "Jack": 33, "Sam": 25]

// 辞書の内容を列挙する
for (name, age) in people {
    print("\(name) is \(age) years old.")
}


// メソッドや関数は "func"文法を使って宣言する。
// パラメータ名の付け方に注意。-> で戻り値の型を宣言する
func sayHello(to personName: String) -> String {
    let greeting = "こんにちは、" + personName + "さん"
    return greeting
}
// "こんにちは、太郎さん"を出力
print(sayHello(to: "太郎"))