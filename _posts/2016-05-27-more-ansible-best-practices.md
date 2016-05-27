---
layout: post
title: Ansible Best Practices でステージ毎の設定をする その2
description: 前回の記事でまとめた設定が気に入らなかったので別の方法を紹介します。
date: 2016-05-27
tags: ansible
---

前回こんな記事を書いていたのですが、やっぱり気に入らなかったので別の方法を紹介します。
[Ansible Best Practices でステージ毎の設定をする]({% post_url 2016-05-17-ansible-best-practices %})

実は前回の検証中に見つけていた方法です。  

## 新オレオレ Ansible Best Practices

今回は Inventory で親子関係を定義する機能を利用します。  
やり方は単純で、 production, staging という親グループを作るだけです。

```ini
# file: production

[webservers]
production.example.com

[dbservers]
production.example.com

[production:children]
webservers
dbservers
```

```ini
# file: staging

[webservers]
staging.example.com
...
[staging:children]
webservers
...
```

そして Playbook 内で次のように書けば完成です。

```yml
# file: webservers.yml

---
- hosts: webservers
  roles:
    - common
    - hello_world

- hosts: production
  roles:
    - nginx

- hosts: staging
  roles:
    - httpd
```

ね、簡単でしょう？

前回の方法と違いグループ変数の定義だって楽ちんです。

* group_vars/production
* group_vars/staging

これでステージ毎の変数も切り分けられましたね。  
今回はわかりやすいようにサンプルも用意してあります。

[ojiry/ansible-best-practices](https://github.com/ojiry/ansible-best-practices)

リポジトリをクローンしたら `vagrant up --provision` するだけです。  
ホスト名を利用するので、 vagrant-hostsupdater のインストールをお忘れなく。

```shell
$ vagrant plugin install vagrant-hostsupdater 
```

それでは良い Ansible ライフを。
