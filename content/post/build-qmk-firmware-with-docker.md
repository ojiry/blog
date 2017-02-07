+++
date = "2017-02-07T20:03:23+09:00"
title = "qmk_firmware を Docker でビルドする"
draft = false
+++

健康を金で買うぞ！と勢いで ErgoDox EZ を注文してしまった為、自分専用のファームウェアを用意する必要が出てきました。
[qmk/qmk_firmware](https://github.com/qmk/qmk_firmware) の Wiki 通りにすればビルドできるのですが、備忘録として残しておきます。

# Docker を使えるようにする

各自の環境に合わせて使えるようにしてください。

# qmk_firmware をクローンする

しましょう。自分は [motemen/ghq](https://github.com/motemen/ghq) を使ってます。

# Docker イメージを用意する

ご丁寧にリポジトリに Dockerfile が用意されているので使いましょう。

```sh
$ docker build -t ojiry/qmk_firmware .
```

# Dcoker でビルドする

ちなみに自分は fish シェル使ってるので、コマンドは適宜自分のシェルに置き換えてください。

```sh
$ docker run -e keyboard=ergodox -e subproject=ez -e keymap=default --rm -v (pwd):/qmk:rw ojiry/qmk_firmware
```

これで無事に `ergodox_ez_default.hex` が出力されました。

後は適当に自分用の keymap を追加して、引数に指定してあげればOKです。

キーボードが届くのが楽しみですね。
