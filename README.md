# robosys2025
- このソフトウェアパッケージは、GPL v3.0 ライセンスの下、再頒布および使用が許可されます。
© 2025 Ren Okaren
# robosys2025

ロボットシステム学の練習用リポジトリです。
標準入力から数値を読み込んで処理するコマンドなどを作っています。

## インストール・準備

```sh
$ git clone https://github.com/ren-okaren/robosys2025.git
$ cd robosys2025
$ chmod +x plus macprice

## plus コマンド

標準入力から読み込んだ数値を全部足し合わせて、その合計を標準出力に出すコマンドです。

```sh
$ seq 5 | ./plus
15

## macprice コマンド

マクドナルドのレギュラーメニュー名を標準入力から読み込み、
各商品の値段と合計金額を標準出力に表示する Python 製コマンドです。

```sh
$ printf "ビッグマック\nマックフライポテト\nコカ・コーラ\n" | ./macprice
ビッグマック 480
マックフライポテト 200
コカ・コーラ 140
合計 820

入力：メニュー名（日本語名を1行に1つ）

出力：
各行に「メニュー名 値段」
最後に「合計 合計金額」
登録されていないメニュー名が入力された場合は、その行は合計に含めません。

##テスト
GitHub Actions を用いて、push のたびに自動でテストを実行しています。

```sh
$ ./test.bash

##必要なソフトウェア
Python 3
Git
（動作確認済み）Ubuntu 22.04 LTS / GitHub Actions の ubuntu-latest

##著作権・ライセンス
Copyright (c) 2025 Ren Okaren
リポジトリ全体としては GPL v3.0 を想定しています。
macprice スクリプトにはファイル先頭に記載の SPDX ライセンス表記が適用されます。
