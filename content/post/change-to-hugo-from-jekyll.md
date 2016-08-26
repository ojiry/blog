+++
title = "Jekyll から Hugo へ"
draft = true
date = "2016-08-26T23:00:23+09:00"
+++

記事数が少ないうちにという事で、ブログのジェネレータを [Hugo](https://gohugo.io/) に移行しました。  
どうやら記事数が数百になってくると Jekyll では遅いようで。  
速度を求めて移行する人が多いみたいです。

自分も将来的に変更を余儀なくされるなら今のうちにという事で。  
やり方自体はドキュメントも用意されていたので、サクッと終わりました。

ついでにいい感じのテンプレート [Angel's Ladder](https://github.com/tanksuzuki/angels-ladder) でネックだったデザインを改善したり。  
[DISQUS](https://disqus.com/) によるコメントなんかも導入してみました。

デプロイをどうするか悩んでいましたが、引き続き [s3_website](https://github.com/laurilehmijoki/s3_website) を使う事にしました。  
Gem だったのでてっきり Ruby で書かれてると思ったのですが、実装は Scala なんですね。

まだ微妙に設定周りを全然みれてないので、時間を見つけて直していこうと思います。
