# PHPでのWebサイト作成基礎

## HTMLにPHPを埋め込む
- PHPのコードを１行で書く場合はセミコロンを省略することができる

### endforeachを用いたforeach文
- HTMLにforeach文を埋め込む際は以下のようにendforeachを使った方法が便利
```PHP
<?php
$array = array(1, 2, 3);
?>
<?php foreach ($array as $a): ?>
  <p><?php echo $a ?></p>
<?php endforeach ?>
```

### endif, endfor, endwhile, endswitch
- if文、for文、while文、switch文もforeach文と同様に「endif」「endfor」「endwhile」「endswitch」を使って書くことができる

## ファイルを分ける
- `require_once('ファイル名')`で別のphpファイルを読み込むことができる

## 画像を表示する
- `<img>`タグのsrc属性の中にPHPを埋め込んで画像のリンクを生成できる

## 他のページへのリンクとクエリ
- <a>タグで他のphpファイルへのリンクを作れるが、URLの末尾の「?」以降に「キー名=値」という形で簡単な情報を載せることができる。これをクエリ情報という。
```PHP
<a href="show.php?name=<?php echo $article->getName() ?>">
```
- クエリ情報を受け取るには「$_GET」を使用する。
```PHP
echo $_GET['name'];
```
