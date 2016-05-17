---
layout: post
title: Ansible Best Practices でステージ毎の設定をする
description: ここ数日で調べた Ansible のステージ切り替え方法をまとめてみました。
date: 2016-05-16
tags: ansible
---

Ansible では公式で公開されている [Best Practices](http://docs.ansible.com/ansible/playbooks_best_practices.html) があります。  
基本的には Best Practices に添って Playbook を構築していくのが、他者に公開する上でも良い方法だと思います。  
今回は自分が Best Practices で構築した Playbook でハマっていた、 Inventory を使ったステージ切り替え方法が一段落したのでまとめてみました。

## ステージパターン

[Ansible inventoryパターン ｜ Developers.IO](http://dev.classmethod.jp/server-side/ansible/ansible-inventory-pattern/)

まず最初に見つけたのは stage 変数を定義してそれを参照するという方法です。
次のように Inventory 内で変数を定義して、必要なところで参照します。

```ini
# file: production

[webservers]
192.168.33.10
[all:vars]
stage=production
```

```yml
---
# file: webservers.yml
- hosts: web
  vars_files:
    - vars/{{ stage }}.yml
  roles:
    - common
    - { role: nginx, when: "stage == 'production'" } 
```

この方法でやりたい事は全て出来るのですが、 Inventory を Production と Staging で分けているのに、わざわざ変数を定義してというのがどうにも気になります。  
とは言いつつも代案を思いつかなかった為、最初はこの方法を採用していました。

## Inventory File

どうにか別の方法で出来ないかと考えていた所思いついたのが Inventory のファイル名を取得するという方法です。  
そもそも production, staging という名前をつけているのだから、その名前を再利用すればいいのです。  
調べた所 inventory_file という変数がしっかりと定義されていました。


```ini
# file: production

[webservers]
192.168.33.10
```

```yml
---
# file: webservers
- hosts: all
  roles:
    - common
    - { role: nginx, when: inventory_file == 'production' }
```

TODO: 変数の切り分け

