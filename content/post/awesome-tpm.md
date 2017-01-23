+++
date = "2017-01-23T21:57:34+09:00"
title = "tpm 最高"
draft = false
+++

今年から tmux 環境を整理するついでに [tpm](https://github.com/tmux-plugins/tpm) を導入した。

元々が最低限の設定しかしてなかったのだけど、色々と plugins を導入してかなり快適になった。

インストールしたプラグインはこんな感じ。
```
set -g @tpm_plugins ' \
  tmux-plugins/tpm \
  tmux-plugins/tmux-battery \
  tmux-plugins/tmux-copycat \
  tmux-plugins/tmux-open \
  tmux-plugins/tmux-pain-control \
  tmux-plugins/tmux-yank \
  ojiry/tmux-wifi-macos \
'
```

[gmoe/tmux-wifi-macos](https://github.com/gmoe/tmux-wifi-macos) だけは上手く動かなかったので fork したのを直して使ってる。時間があればPRだしたいけど時間はない。

一通り環境は整理した感じもするので、後は時間を見つけてインストールスクリプトとかを直したい。

今回MBPをセットアップした際に、色々と手動でやる事が多かったしね。

ただ1月から想像以上にハードなので何処までやれるかわからん。

ブログとか更新してる場合じゃないんだけど、やれる気力があるうちは日々のぼやきでもいいから更新しようと思う。
