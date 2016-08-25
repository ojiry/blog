+++
date = "2016-05-17T00:00:00+09:00"
draft = false
title = "Ansible Best Practices でステージ毎の設定をする"
+++

Ansible では公式で公開されている [Best Practices](http://docs.ansible.com/ansible/playbooks_best_practices.html) があります。  
これに添って Playbook を構築していくのが、公開する上でも良い方法だと思います。  
今回は Best Practices 構成でハマっていた、 Inventory を使ったステージ切り替え方法が一段落したのでまとめてみます。

## ステージパターン

[Ansible inventoryパターン ｜ Developers.IO](http://dev.classmethod.jp/server-side/ansible/ansible-inventory-pattern/)

最初に見つけたのは stage 変数を定義してそれを参照するという方法です。  
次のように Inventory 内で変数を定義して、必要なところで参照します。

```ini
# file: production

[webservers]
192.168.33.10
[all:vars]
stage=production
```

```
# file: webservers.yml

---
- hosts: web
  vars_files:
    - vars/{{ stage }}.yml
  roles:
    - common
    - { role: nginx, when: "stage == 'production'" }
```

この方法でやりたい事は全て出来るのですが、 Inventory を Production と Staging で分けているのに、更に変数を定義するというのがどうも気になります。  
とは言いつつも、代案を思いつかなかったので最初はこの方法を採用していました。

## Inventory File

どうにか別の方法で出来ないかと考えていた所、思いついたのが Inventory のファイル名を使用するという方法です。  
そもそも production という名前をつけているのだから、その名前を再利用すればいいのです。  
調べた所 inventory_file という変数が Ansible で定義されていました。


```ini
# file: production

[webservers]
192.168.33.10
```

```
# file: webservers

---
- hosts: all
  roles:
    - common
    - { role: nginx, when: inventory_file == 'production' }
```

Playbook で利用する変数に関しては、 group_vars と hosts_vars で適切に切り分ければ良いと思っています。  
そこで切り分けるのが難しい場合は、各 Inventory 内で定義すれば良いかなと。

## 実践

このブログの構築には Ansible を使用しているので、 Inventory File によるステージの切り替えを実践してみました。

[ojiry/blog](https://github.com/ojiry/blog)

構成がシンプルなので上手く適用出来ている感じがしますが、複数台のサーバ構成でも上手くいくかはまだわかりません。  
記事を書くのを優先してまだリファクタリング出来ていないので、もう少し綺麗に直していく予定です。
