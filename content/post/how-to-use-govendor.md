+++
date = "2017-01-12T10:17:25+09:00"
title = "govendor の使い方"
draft = false
+++

世間では glide が一番流行っているかもしれませんが自分は govendor 派です。
しかし govendor の理解が浅く、環境を作り直した際に正しくパッケージを展開出来ませんでした。
そこで備忘録的に使い方を簡単にメモしておこうと思います。

参考にさせて頂いた [@snowcrush](https://twitter.com/snowcrush) の大変わかりやすいスライド。

<blockquote class="twitter-tweet" data-lang="ja"><p lang="ja" dir="ltr">先程の発表資料はこちらになります。<a href="https://t.co/JByfiU3Jw2">https://t.co/JByfiU3Jw2</a><br><br> <a href="https://twitter.com/hashtag/saikin_go?src=hash">#saikin_go</a></p>&mdash; Minori Tokuda (@snowcrush) <a href="https://twitter.com/snowcrush/status/806827914805161985">2016年12月8日</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

# 基本

```
# 初期設定
$ govendor init

# $GOPATH にあるパッケージを管理対象に追加
$ govendor add +external github.com/ojiry/gothic

# 管理されているパッケージを確認
$ govendor list
```

これだけ。開発中のリポジトリをクローンしてきた場合は下記コマンド一発。

```
$ govendor sync
```

# ステータス

リスト表示した際にパッケージの横にステータスが表示される。
最初この事を知らずにちゃんと管理出来ていませんでした。
詳しい内容は公式ドキュメントを参照してください。

https://github.com/kardianos/govendor#status

このステータスが govendor の各コマンドと連携しており、次のような便利なコマンドが実行できます。

```
# 管理対象になっていないパッケージを追加
$ govendor add +e
# $GOPATH にないパッケージを取得
$ govendor fetch +m
# 未使用のパッケージを管理対象から削除
$ govendor remove +u
```

# 最後に

> GOVENDORいいぞ！

GOVENDORいいぞ！
