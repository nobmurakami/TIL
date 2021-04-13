# データベースやテーブルを作成する(DDL)
## データベースを作成する
```SQL
CREATE DATABASE データベース名;
```
## データベースを確認する
```SQL
SHOW DATABASES;
```
## データベースを変更する
```SQL
USE データベース名;
```
## テーブルを作成する
- 例：usersテーブルにidカラムとnameカラムを作る
```SQL
CREATE TABLE users (id int, name varchar(20));
```
- 例：NOT NULL制約、一意性の制約、プライマリーキーを設定する
```SQL
CREATE TABLE users (
id INT(8) NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
email VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
UNIQUE INDEX email_unique (email), --emailに一意性の制約をつける
PRIMARY KEY (id)
);
```
## テーブルを確認する
```SQL
SHOW TABLES;
```
## カラムを確認する
```SQL
SHOW COLUMNS FROM users;
```
## カラムを追加する
- 例：usersテーブルにdatetime型のcreated_at絡むを追加する
```SQL
ALTER TABLE users ADD COLUMN created_at datetime NOT NULL;
```
## カラム名を変更する
- 例：テーブルの名前を t1 から t2 に変更する
```SQL
ALTER TABLE t1 RENAME t2;
```
## テーブルにデータを挿入する(INSERT)
```SQL
INSERT INTO users (id, name) VALUES (1, 'yamada');
```

# データを操作する(DML)
## テーブルからデータを取得する(SELECT)
- 例：usersテーブルのidカラムとnameカラムの全てのレコードを取得する
```SQL
SELECT id, name FROM users;
```
## テーブル内の既存データを更新する(UPDATE)
例：usersテーブルのidが1のレコードを更新する
```SQL
UPDATE users SET id = 2, name = 'yamato' WHERE id = 1;
```
## テーブルのデータを削除する(DELETE)
例：usersテーブルのidが2のレコードを削除する
```SQL
DELETE FROM users WHERE id = 2;
```
