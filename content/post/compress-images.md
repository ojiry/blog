+++
title = "ブログの画像を圧縮"
draft = false
date = "2016-10-03T22:45:23+09:00"
+++

このブログを [PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) で分析してみた所、盛大にご指摘を受けました。

今日から地道に指摘された箇所に対応していこうと思います。

手始めに「画像を最適化する」から。

簡単に言えば「画像は圧縮しとけよ？」という事らしいです。

今回は png なので、おすすめされている OptiPNG を使って圧縮します。

Mac なら Homebrew からインストール可能です。

```sh
$ brew install optipng
```

インストールが完了したら、オプションで最適化レベルを指定して画像を圧縮します。

```sh
$ optipng -o7 profile.png
```

ちなみに元の画像は残らないので適宜バックアップして下さい。

圧縮した画像をデプロイして再度分析かけたところ…

まだ怒られる…

どうやらもっと圧縮が必要なようで。

Google 先生は厳しかった。
