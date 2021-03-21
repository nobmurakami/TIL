# iPhoneアプリ開発基礎

## iPhoneアプリはどうやって作る？
- iPhoneアプリは、MacでXcodeというツールを使って開発することができる
- プログラミング言語はSwift

## プロジェクトの作成
※Version 12.3現在

1. Xcodeを起動する
2. [Create a new Xcode project]を選択
3. [Choose a template for your new project]で iOS > App を選択
4. [Choose options for your new project]で下記のように入力して[Next]をクリック
  - [Product Name]にプロジェクト名を入力
  - [Organization Identifier]は「com.好きな名前」を入力
  - [Interface]は「Storyboard」を選択
  - [Langage]は「Swift」
  - 下のチェックボックスは全部オフ
5. プロジェクトの保存先を選択する
6. 「プロジェクト名.xcodeproj」の TARGETS > プロジェクト名 > General にて下記を設定
  - [Display Name] -> アプリの名前を入力
  - [Deployment Info] -> 対応する機種や画面モードを選択

## 画面の作成
- Main.storyboardでViewController（画面）を作成する
- 右上の[+]ボタンからオブジェクトを選び、ストーリーボード上にドラッグ&ドロップするとオブジェクトを配置できる

### 画像の配置
- [Assets]を選択し、右側に開いたリストの中に画像ファイルをドラッグ＆ドロップで入れる
- オブジェクトを選択し、[Attributes Inspector]を開く
- [Image]で画像ファイルを選択する

## ViewControllerのプログラムを書く
- ストーリーボードカラム右上のEditor OptionsメニューからAssistantを選択すると、ViewControllerのコードを編集できる
- ストーリーボード上のオブジェクトを選択し、controlを押しながらコードにドラッグ&ドロップすると、オブジェクトとコードを接続することができる

## ブレークポイント
- コードの行番号をクリックするとブレークポイントを作成し、シミュレーターの実行中に該当箇所でプログラムを止めることができる
- ブレークポイントをつかんで行番号以外の場所にドロップすると消える

## テキストフィールドで表示されるキーボードを閉じる方法
- まず、ViewControllerクラスにUITextFieldDelegateを読み込む
```Swift
class ViewController: UIViewController, UITextFieldDelegate {
```
- タッチでキーボードを閉じるには、次の関数を定義する
```Swift
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
}
```
- キーボードのリターンを押した時にキーボードを閉じるには、次の関数を定義する
```Swift
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
}
```

## 画面遷移
※View ControllerからNext View Controllerに画面遷移する場合

### ボタンを押した時に画面遷移させる
1. Storyboardにて、ボタンから次の画面へcontrolをおしながらドラッグ&ドロップする
2. 表示されるメニューで、ShowやPresent Modallyを選択する
3. 画面と画面がStoryboard Segueという矢印で接続されたらOK

### 前の画面に戻るボタンのサンプルコード
```Swift
@IBAction func back(_ sender: Any) {
    dismiss(animated: true, completion: nil)
}
```

### 戻るボタンのタップ時に「unrecognized selector sent to instance」エラーが出る場合
- 戻るボタンがあるViewControllerのCustom Class設定にて、Moduleが空だとなるっぽい
- その場合はInherit Module From Targetにチェックを入れるか、Moduleに手打ちすればよい

### ある条件を満たしたら画面遷移させる
1. Storyboardにて、iPhone画面の上のView Controllerボタン（四角いマーク）から次の画面へ、controlをおしながらドラッグ&ドロップする
2. 表示されるメニューで、ShowやPresent Modallyを選択する
3. Storyboard Segueの矢印をクリックし、Identifierに任意の名前を設定する
4. ViewController.swiftにて、if文の中など、画面遷移をさせたいタイミングで下記のコードを記述する
```Swift
performSegue(withIdentifier: "3で設定したIdentifier", sender: nil)
```

### 値を持たせて画面遷移する
今の画面の変数を、次の画面の変数に渡したい時は次のような関数を定義する
```Swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let nextVC = segue.destination as! NextViewController
    nextVC.次の画面の変数B = 今の画面の変数A
}
```

### ナビゲーションコントローラーを用いた画面遷移
1. View Controllerを選択
2. Editor > Embed In > Navigation Controllerをクリック
3. View Controllerボタンをcontrolを押しながら次の画面にドラッグ&ドロップする
4. 表示されるメニューで、ShowやPresent Modallyを選択する
5. Next View ControllerのIdentity > Storyboard IDに任意の名前を設定し、Use Storyboard IDにチェックを入れる
6. ViewController.swiftにて、if文の中など、画面遷移をさせたいタイミングで下記のコードを記述する
```Swift
let nextVC = storyboard?.instantiateViewController(withIdentifier: "5で設定したStoryboard ID") as! NextViewController
navigationController?.pushViewController(nextVC, animated: true)
```