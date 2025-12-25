#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Ren Okaren
# SPDX-License-Identifier: BSD-3-Clause

ng () {
  echo "${1}行目が違うよ"
  res=1
}

res=0

# plus コマンドのテスト
out=$(seq 5 | ./plus)
[ "$out" = 15 ] || ng "$LINENO"

# 異常な入力（文字）
out=$(echo あ | ./plus)
[ $? = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

# 異常な入力（空）
out=$(echo  | ./plus)
[ $? = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"


# macprice コマンドのテスト

# 正常入力①: 数量指定なし
# ビッグマック(480) と コカ・コーラ(140) → 620
out=$(printf "ビッグマック,コカ・コーラ\n" | ./macprice)
[ $? = 0 ] || ng "$LINENO"
[ "$out" = "620" ] || ng "$LINENO"

# 正常入力②: 数量指定あり
# 2ビッグマック(2*480) と シャカチキ(220) → 1180
out=$(printf "2ビッグマック,シャカチキ\n" | ./macprice)
[ $? = 0 ] || ng "$LINENO"
[ "$out" = "1180" ] || ng "$LINENO"

# 異常入力①: 未登録メニュー
out=$(printf "ビッグマック,幻のメニュー\n" | ./macprice)
[ $? = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

# 異常入力②: 個数が 0 以下
out=$(printf "0ビッグマック\n" | ./macprice)
[ $? = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

# 異常入力③: 個数だけで商品名がない
out=$(printf "2\n" | ./macprice)
[ $? = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"


# 結果
[ "$res" = 0 ] && echo OK
exit $res
