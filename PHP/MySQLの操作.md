# PHPからMySQLを操作する

## MySQLサーバーに接続する処理の例（手続き型）
- mysqli_connect()でMySQLサーバーに接続する
- mysqli_connect()は失敗した場合にfalseを返す
- エラーハンドリングを行う必要がある
- mysqli_connect_error()は直近の接続エラーの内容を文字列で返す
- MySQLサーバーに接続し、接続エラーがなければ接続を表すオブジェクトを返す関数の例：
```PHP
function dbConnect()
{
    $link = mysqli_connect('host', 'username', 'passwd', 'dbname');

    if (!$link) {
        echo 'Error: データベースに接続できませんでした' . PHP_EOL;
        echo 'Debugging error: ' . mysqli_connect_error() . PHP_EOL;
        exit;
    }

    echo 'データベースに接続しました' . PHP_EOL;

    return $link;
}
```

## テーブルにデータを登録する処理の例（手続き型）
- mysqli_query($link, $query)関数でINSERT INTO構文を実行する
- INSERT INTO構文をヒアドキュメントで記述する場合、文字列の入った変数は{}で展開した上で""で囲む必要がある
- 登録失敗時のエラーハンドリングを行う
- mysqli_error($link)関数で、mysqli_connect()が返すリンクID $linkについて直近のmysqli関数のコールが失敗した際のエラーメッセージを返す
```PHP
function createNote($link)
{
    echo 'メモを登録してください' . PHP_EOL;
    echo 'タイトル：';
    $title = trim(fgets(STDIN));

    echo '内容：';
    $content = trim(fgets(STDIN));

    $query = <<<EOT
    INSERT INTO notes (
        title,
        content
    ) VALUES (
        "{$title}",
        "{$content}"
    )
    EOT;

    $result = mysqli_query($link, $query);
    if ($result) {
        echo '登録が完了しました' . PHP_EOL;
    } else {
        echo 'Error: 登録に失敗しました' . PHP_EOL;
        echo 'Debugging error: ' . mysqli_error($link) . PHP_EOL;
    }
}
```

## テーブルのデータを取得する処理の例（手続き型）
- mysqli_query()でSELECT構文を実行し、mysqli_resultオブジェクトを取得する
- mysqli_fetch_assoc()でmysqli_resultオブジェクトから連想配列を取得する
- while ($row = mysqli_fetch_assoc($result)) {} で$resultのなかのレコードを一つ一つ取り出して処理することができる
- 最後にmysqli_free_result()でメモリを解放する
```PHP
function listNotes($link)
{
    echo '登録されているメモを一覧表示します' . PHP_EOL;

    $query = 'SELECT id, title, content FROM notes';
    $result = mysqli_query($link, $query);

    while ($note = mysqli_fetch_assoc($result)) {
        echo 'タイトル：' . $note['title'] . PHP_EOL;
        echo '内容：' . $note['content'] . PHP_EOL;
        echo '-------------' . PHP_EOL;
    }

    mysqli_free_result($result);
}
```
