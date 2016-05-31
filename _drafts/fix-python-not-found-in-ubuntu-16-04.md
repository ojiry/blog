---
layout: post
title: Ubuntu 16.04 (Xenial Xerus) で Ansible を動かす
description: Ubuntu 16.04 で Ansible が動かない原因と対応の備忘録です。
date: 2016-05-31
tags:
- ansible
- ubuntu
---

開発環境を Ubuntu 16.04 で構築しようとしたところ、 Ansible からプロビジョニング出来ないという問題と遭遇しました。  
デフォルトでインストールされている Python が、2系から3系に更新された事が原因のようです。  
解決方法もググれば直ぐに出てきたので、自分への備忘録として対応をまとめておきます。

## TL;DR

```yaml
# file: site.yml

---
- hosts: all
  gather_facts: no
  tasks:
    - name: install python 2.7
      raw: sudo apt-get install -qq python2.7
```

```yaml
# file: group_vars/all

---
ansible_python_interpreter: /usr/bin/python2.7
```

## 環境情報

* Vagrant 1.8.1
* ubuntu/xenial64 (virtualbox, 20160528.0.0)
* ansible 2.1.0.0

## 対応方法

1. gather_facts は no
2. raw module を使用して Python 2.7 をインストール
3. ansible_python_interpreter 変数に Python 2.7 のパスを指定
