+++
title = "gulp+pug+stylus+webpack を触ってみる"
draft = false
date = "2016-08-29T21:38:27+09:00"
+++

最新のフロントエンド環境の概要を知るために、静的なHPを作るならという目的で開発環境を構築してみました。  
タイトルにもありますが、調べた感じだとこの4つを知っておくと良いのかなと思います。

# [Gulp](http://gulpjs.com/)

JavaScript 製のビルドツール。  
同様のツールに Grunt があります。  

# [Pug](https://pugjs.org/)

JavaScript 製のテンプレートエンジン。  
元々は Jade という名前で開発されていました。

# [Stylus](http://stylus-lang.com/)

JavaScript 製のCSSプリプロセッサ。  
Sass や Less よりも後発な分、2つの良いとこ取りをしてるらしい。

# [Webpack](https://webpack.github.io/)

JavaScript 製のモジュールビルダー。  
同様のツールに Browserify があります。

# やってみた

というわけで凄く単純な感じですが実際に環境構築をしてみました。

[ojiry/frontend-example](https://github.com/ojiry/frontend-example)

本当に最低限の事しかしてません。  
自分の中では概要がわかったのでこれで満足。

静的サイトを作る事があれば、この構成で実装してみようと思います。
