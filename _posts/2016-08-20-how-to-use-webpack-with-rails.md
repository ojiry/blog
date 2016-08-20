---
layout: post
title: Rails で webpack を使う方法
description: Rails で webpack を使う方法を考察してみました。
date: 2016-08-20
---

最近フロントエンドの技術を少しづつですが触り始めてます。  
趣味の範囲で触ってるだけなので、チュートリアルレベルですが。

調べた感じでは、 react, redux, babel, webpack 辺りを押さえておけば良いのかなという気がしています。

これらの技術を使うにあたり、 Rails と組み合わせる方法を考えてみました。

## リポジトリを分ける

可能であるならこれが一番良い方法なのかなっと。  
無理に Rails に載せると色々無理が出てきそうですし。

ただ個人で遊ぶ程度なら、一つにまとまってた方が色々と楽です。  
そのため今回は見送りで。  

## xxxx-rails な gem を使う

react 使うだけなら react-rails を使うのもありだと思います。  
ですが使いたいライブラリが増えていくと、色々と不都合が出てきそうです。  
最新のバージョンに gem が追随していない、そもそも gem 化されていないなど。

今回はフロントエンドの技術全般を使いたかったので、この案も見送りです。

## webpack に全て任せる

調べてみると、今は webpack に全て任せる方法が主流のような感じがします。  
webpack でビルドした js を Rails 側で読み込む形です。

その際に Sprockets を残す場合とそうでない場合があるよう。

個人的に Sprockets を廃止する必要もない気がしているので、今の所は残す派です。  

## とりあえずやってみた

[ojiry/webpack-on-rails-example](https://github.com/ojiry/webpack-on-rails-example)

`app/frontend/javascripts` に webpack でビルドするソースを配置して、ビルドしたソースを `app/assets/javascripts/bundle.js` に出力して Rails で読み込む感じです。

特に問題なく動いたのでこれで遊べそうです。

さて、勉強するか。
