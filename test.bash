#!/bin/bash
# SPDX-FileCopyrightText: 2026 HarunaYamagishi
# SPDX-License-Identifier: BSD-3-Clause

cd "$(dirname "$0")" || exit 1

res=0
ng () {
	echo "NG: ${1}行目のテストが失敗"
	res=1
}

# 1. 辞書にあるエラーは、標準エラー出力に和訳が付く
out=$(./errja ls /no_such_dir_xyz 2>&1 >/dev/null)
echo "$out" | grep -q "ファイルまたはディレクトリがありません" || ng "$LINENO"

# 2. 元のエラー文もそのまま残る
echo "$out" | grep -q "No such file or directory" || ng "$LINENO"

# 3. 和訳は標準出力に混ざらない
out=$(./errja ls /no_such_dir_xyz 2>/dev/null)
[ -z "$out" ] || ng "$LINENO"

# 4. 正常終了するコマンドの標準出力はそのまま出る
out=$(./errja echo hello 2>/dev/null)
[ "$out" = "hello" ] || ng "$LINENO"

# 5. 終了ステータスを引き継ぐ
./errja false 2>/dev/null
[ "$?" = "1" ] || ng "$LINENO"

# 6. 正規表現の「取り出し」が使える(モジュール名が和訳に入る)
out=$(./errja python3 -c "import no_such_mod_xyz" 2>&1 >/dev/null)
echo "$out" | grep -q "no_such_mod_xyz" || ng "$LINENO"
echo "$out" | grep -q "モジュール" || ng "$LINENO"

# 7. 引数なしは使い方を標準エラー出力に出して、終了ステータス2
out=$(./errja 2>&1 >/dev/null)
st=$?
[ "$st" = "2" ] || ng "$LINENO"
[ -n "$out" ] || ng "$LINENO"

# 8. 存在しないコマンドは終了ステータス127
./errja no_such_command_xyz 2>/dev/null
[ "$?" = "127" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
