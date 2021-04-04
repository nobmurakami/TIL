# データベーステーブルを作成する
- データベースを作成する
```SQL
CREATE DATABASE データベース名;
```
- データベースを確認する
```SQL
SHOW DATABASES;
```
- データベースを変更する
```SQL
USE データベース名;
```
- テーブルを作成する
例：usersテーブルにidカラムとnameカラムを作る
```SQL
CREATE TABLE users (id int, name varchar(20));
```
- テーブルを確認する
```SQL
SHOW TABLES;
```
- カラムを確認する
```SQL
SHOW COLUMNS FROM users;
```

# テーブルにデータを挿入する(INSERT)
```SQL
INSERT INTO users (id, name) VALUES (1, 'yamada');
```

# テーブルからデータを取得する(SELECT)
例：usersテーブルのidカラムとnameカラムの全てのレコードを取得する
```SQL
SELECT id, name FROM users;
```

# テーブル内の既存データを更新する(UPDATE)
例：usersテーブルのidが1のレコードを更新する
```SQL
UPDATE users SET id = 2, name = 'yamato' WHERE id = 1;
```

# テーブルのデータを削除する(DELETE)
例：usersテーブルのidが2のレコードを削除する
```SQL
DELETE FROM users WHERE id = 2;
```
