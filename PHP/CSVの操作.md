# PHPでのCSVファイルの操作

## CSVファイル内の特定の行を更新するサンプルコード
2列のCSVファイルの2行目を差し替える
```PHP
$posts = [];
$file = 'posts.csv';

// ファイルを読み込んで配列に格納
$read_fp = fopen($file, 'r');

while ($row = fgetcsv($read_fp)) {
    $posts[] = $row;
}

fclose($read_fp);

// 更新するデータの作成
$target_id = 1;
$new_post = [
    '２行目',
    '編集'
];

// 更新したデータを配列に上書き
foreach ($posts as $i => $post) {
    if ($i === $target_id) {
	$posts[$i] = $new_post;
	break;
    }
}

// CSV出力
$write_fp = fopen($file, 'w');

foreach ($posts as $row) {
    fputcsv($write_fp, $row);
}

fclose($write_fp);
```

