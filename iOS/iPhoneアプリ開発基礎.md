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

## ビューの作成
- Main.storyboardでビュー（画面）を作成する
- 右上の[+]ボタンからビューやパーツを追加できる
 
