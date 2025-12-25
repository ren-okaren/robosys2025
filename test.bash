#!/bin/bash -eu
# SPDX-FileCopyrightText: 2025 Ren Okaren
# SPDX-License-Identifier: BSD-3-Clause

# basic success
out="$(printf "カレーライス,サラダ,ブラックコーヒー\n" | ./macprice)"
test "$out" = "975"

# multiplier (tail)
out="$(printf "ラーメン*2,りんご\n" | ./macprice)"
test "$out" = "1695"   # 800*2 + 95

# multiplier (head) + numeric kcal token
out="$(printf "2xヨーグルト,120kcal\n" | ./macprice)"
test "$out" = "360"    # 120*2 + 120

# unknown item -> exit 1 and message to stderr
set +e
printf "未知メニュー\n" | ./macprice 1>/dev/null 2>err.txt
status=$?
set -e
test "$status" -eq 1
grep -q "ERROR: unknown item" err.txt

# empty input -> exit 1
set +e
printf "\n" | ./macprice 1>/dev/null 2>err.txt
status=$?
set -e
test "$status" -eq 1
grep -q "ERROR: empty input" err.txt

echo "OK"


