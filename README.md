# errja
発生したエラー文を自動で翻訳してくれるコマンドになります。
## 使い方

インストール済みの場合、errja コマンド [引数...]と入力することで使用できます。
```
$ errja ls /no_such_dir
ls: cannot access '/no_such_dir': No such file or directory
ファイルまたはディレクトリがありません
```

別の例
```
$ errja python3 -c "import no_such_mod"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ModuleNotFoundError: No module named 'no_such_mod'
モジュール 'no_such_mod' が見つかりません
```

## インストール

(`git clone` から、実行できるようになるまでの手順を、1行ずつ書く。書いたとおりに入力して動くか、必ず自分で試す)

## 動作環境

- OS: Ubuntu 24.04
- Python: 3.12

## 和訳できるエラー

DIRECTORY内にあるエラーの一覧
| 英語のエラー文 | 和訳 |
| :--- | :---: |
| No such file or directory |ファイルまたはディレクトリがありません|
|Permission denied|許可がありません(権限不足)| 
|ModuleNotFoundError: No module named '(.+)'|モジュール '{0}' が見つかりません|
|Could not read from remote repository|リモートリポジトリから読み込めませんでした|
|command not found|コマンドが見つかりません| 
|Unable to locate package|パッケージが不明です|
|Connection timed out|接続がタイムアウトしました|

これ以外にほしいエラーがある場合、errja上で
空白4つ(r"英文エラー","エラーの和訳"),　をDICTIONAYの欄に書き加えて、保存することで追加できます。

## ライセンス

BSD 3-Clause License です。詳細は `LICENSE` を参照してください。

##謝辞

