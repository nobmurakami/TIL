<!-- 値取得・出力サンプルコード

入力される値
2
2 5
3 4

期待する出力
hello = 2 , world = 5
hello = 3 , world = 4 -->

<!-- PHP -->
<?php
$input_line = trim(fgets(STDIN));
for ($i = 0; $i < $input_line; $i++) {
    $s = trim(fgets(STDIN));
    $s = str_replace(array("\r\n","\r","\n"), '', $s);
    $s = explode(" ", $s);
    echo "hello = ".$s[0]." , world = ".$s[1]."\n";
}
?>