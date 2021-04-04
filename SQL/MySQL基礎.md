# MySQLでデータベーステーブルを作成する
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
usersテーブルにidカラムとnameカラムを作る場合の例：
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

# テーブルにデータを挿入する
```SQL
INSERT INTO users (id, name) VALUES (1, 'yamada');
```
