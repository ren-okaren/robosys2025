# robosys2025

- このソフトウェアパッケージは、 GPL v3.0 ライセンスの下、再頒布および使用が許可されます。 © 2025 Ren Okaren

## robosys2025

ロボットシステム学の練習用リポジトリです。
標準入力から数値や文字列を読み込んで処理するコマンドなどを作っています。

## インストール・準備

次のコマンドでリポジトリを取得し、実行権限を付けます。

    git clone https://github.com/ren-okaren/robosys2025.git
    cd robosys2025
    chmod +x plus macprice

## plus コマンド

標準入力から読み込んだ数値をすべて足し合わせて、その合計を標準出力に出すコマンドです。

実行例：

    $ seq 5 | ./plus
    15

入力：  
- 数値を 1 行に 1 つ

出力：  
- 合計値を 1 行で出力

## macprice コマンド

マクドナルドのレギュラーメニュー名を標準入力から読み込み、  
各商品の値段と合計金額を標準出力に表示する Python 製コマンドです。

実行例：

    $ printf "ビッグマック\nマックフライポテト\nコカ・コーラ\n" | ./macprice
    ビッグマック 480
    マックフライポテト 200
    コカ・コーラ 140
    合計 820

入力：  
- メニュー名（日本語名）を 1 行に 1 つ

出力：  
- 各行に「メニュー名 値段」  
- 最後に「合計 合計金額」

登録されていないメニュー名が入力された場合は、その行は合計に含めません。

## テスト

GitHub Actions を用いて、`push` のたびに自動でテストを実行しています。  
ローカルでは次のコマンドでテストを実行できます。

    $ ./test.bash

### テストバッジ

テストの状態は次のバッジで確認できます。

    ![test](https://github.com/ren-okaren/robosys2025/actions/workflows/test.yml/badge.svg)

## 必要なソフトウェア

- Python 3
- Git

## テスト環境

- Ubuntu 22.04 LTS
- GitHub Actions (`ubuntu-latest`)
