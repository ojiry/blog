+++
date = "2017-01-28T15:17:03+09:00"
title = "tmux_rename_window という fish plugin を作った"
draft = false
+++

今携わっているプロジェクトが結構な数のリポジトリに分かれており、 Tmux の各ウィンドウがどのリポジトリをみてるのかよくわからなくなっていた。
流石にウィンドウを移動して確認するのも効率が悪いので、リポジトリ名を表示するようにしてみた。

<blockquote class="twitter-tweet" data-lang="ja"><p lang="ja" dir="ltr">tmux のウィンドウにリポジトリ表示するの欲しかったので作ってみた。<br>最初は tpm のプラグインとして作りたかったのだけど、無理そうだったので諦めて fish のプラグインにした。<a href="https://t.co/84ve8k64Hv">https://t.co/84ve8k64Hv</a></p>&mdash; Ryoji Yoshioka (@ojiry) <a href="https://twitter.com/ojiry/status/824991422394703872">2017年1月27日</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

最初は [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) 用のプラグインとして実装を進めていたのだけど色々と無理がありました。
いや、本当 Tmux のドキュメント全部呼んだからね。

結局は fish 限定になってしまいましたが、サクッとやりたい事が実現できて満足です。

あと無駄に .tmux.conf で何が設定できるかを全部知る事が出来たのでいい勉強になったかも？
ずっと他所様のブログに公開されてるコードのコピペでしたからね。

そういえば README に SS を載せてないのですがこんな感じです。

![screenshot](/media/20170128153057.jpg)
