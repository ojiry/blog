+++
title = "Akiba.go #1"
draft = false
date = "2016-10-07T12:21:23+09:00"
+++

今週の水曜日に Akiba.go という Golang のもくもく会を開催しました。

http://akihabarago.connpass.com/event/37713/

簡単にスケジュールを説明し、自己紹介の後に各自もくもく。

自分はパッケージ管理ツールの調査をやっていました。

調べる対象は次の4つ。

* govendor  
https://github.com/kardianos/govendor
* godep  
https://github.com/tools/godep
* glide  
https://github.com/Masterminds/glide
* gb  
https://github.com/constabulary/gb

簡単なプログラムを用意して、それぞれのツールで環境を構築して行きました。

最初の govendor はすんなりに動き、機能もシンプルで好印象。  
次の godep では `$ godep save` 時にエラーが発生。

時間内にエラーを解決出来ず、2つのツールしか評価出来ずに終わりました。

後で他の参加者の方にきいたところ、今は glide が勢いあるらしいですね。

次回の Akiba.go までにはツールの評価は終わらせて、実際に何か作りたい。
