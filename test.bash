#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Ren Okazaki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### NORMAL INPUT ###
out=$(seq 5 | ./plus)
[ "$out" = 15 ] || ng "$LINENO"

### 異常な入力（文字）
out=$(echo あ | ./plus)
[ $? = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

### 異常な入力（空）
out=$(echo | ./plus)
[ $? = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

