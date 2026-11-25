# errja

コマンドを実行したときにエラーが出た場合、日本語訳を付けてくれるコマンドです。

## 使い方

インストール済みの場合、`errja コマンド [引数...]`と入力することで使用できます。

```
$ errja ls /no_such_dir
ls: cannot access '/no_such_dir': No such file or directory
ファイルまたはディレクトリがありません
```

パイプで使用する場合

```
$ errja ls /no_such_dir 2>&1 | less
ls: cannot access '/no_such_dir': No such file or directory
ファイルまたはディレクトリがありません
(END)
```

`q`キーで終了

## インストール

以下のコマンドを順番に入力

```
$ git clone https://github.com/kotsubuann/errja.git
$ cd errja
$ sudo cp errja /usr/local/bin/
```

動作確認用コマンド

```
$ errja ls /no_such_dir
```

「ファイルまたはディレクトリがありません」と表示された場合成功です。

## 動作環境

- OS: Ubuntu 24.04
- Python: 3.12

## 和訳できるエラー

DICTIONARY内にあるエラーの一覧

| 英語のエラー文 | 和訳 |
| :--- | :---: |
| No such file or directory | ファイルまたはディレクトリがありません |
| Permission denied | 許可がありません(権限不足) | 
| ModuleNotFoundError: No module named '名前' | モジュール '名前' が見つかりません |
| Could not read from remote repository | リモートリポジトリから読み込めませんでした |
| command not found | コマンドが見つかりません | 
| Unable to locate package | パッケージが不明です |
| Connection timed out | 接続がタイムアウトしました |

これ以外にほしいエラーがある場合、`errja`上で

```
    (r"英文エラー","エラーの和訳"), 
```

をDICTIONARYの欄に書き加えて、保存することで追加できます。

## ライセンス

BSD 3-Clause License です。詳細は `LICENSE` を参照してください。

