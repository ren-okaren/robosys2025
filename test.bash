kk#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Ren Okazaki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

#plus コマンドのテスト

out=$(seq 5 | ./plus)
[ "$out" = 15 ] || ng "$LINENO"

#異常な入力
out=$(echo あ | ./plus)
[ $? = 1 ]      || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

#異常な入力
out=$(echo | ./plus)
[ $? = 1 ]      || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

# macprice コマンドのテスト

#正常入力①：数量指定なし
#ビッグマック + コカ・コーラ
out=$(
  printf "ビッグマック\nコカ・コーラ\n" | ./macprice | tail -n 3
)
expected="ビッグマック 1個 480円
コカ・コーラ 1個 140円
合計金額は 620 円になります"
[ "$out" = "$expected" ] || ng "$LINENO"

#正常入力②：数量指定あり
#2ビッグマック + シャカチキ
out=$(
  printf "2ビッグマック\nシャカチキ\n" | ./macprice | tail -n 3)
expected="ビッグマック 2個 960円
シャカチキ 1個 220円
合計金額は 1180 円になります"
[ "$out" = "$expected" ] || ng "$LINENO"

#異常入力①：未登録メニュー
#2つ目に変なメニューが来たらエラー終了
out=$(printf "ビッグマック\n幻のメニュー\n" | ./macprice)
[ $? = 1 ] || ng "$LINENO"
case "$out" in
  *"合計金額は"*) ng "$LINENO" ;;
esac

#異常入力②：個数が 0 以下
out=$(printf "0ビッグマック\n" | ./macprice)
[ $? = 1 ] || ng "$LINENO"
case "$out" in
  *"合計金額は"*) ng "$LINENO" ;;
esac

#異常入力③：個数だけで商品名がない
out=$(printf "2\n" | ./macprice)
[ $? = 1 ] || ng "$LINENO"
case "$out" in
  *"合計金額は"*) ng "$LINENO" ;;
esac

# 結果
[ "$res" = 0 ] && echo OK
exit $res

