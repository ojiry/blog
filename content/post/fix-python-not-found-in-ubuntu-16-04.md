+++
date = "2016-06-02T00:00:00+09:00"
draft = false
title = "Ubuntu 16.04 (Xenial Xerus) で Ansible を動かす"
+++

開発環境を Ubuntu 16.04 で構築しようとしたところ、 Ansible からプロビジョニング出来ないという問題と遭遇しました。  
デフォルトでインストールされている Python が、2系から3系に更新された事が原因のようです。  
解決方法もググれば直ぐに出てきたので、自分への備忘録として対応をまとめておきます。

## TL;DR

```
# file: site.yml

---
- hosts: all
  gather_facts: no
  tasks:
    - name: install python 2.7
      raw: sudo apt-get install -qq python2.7
```

```
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

## gather_facts は no

詳細までは調査していないのですが、恐らくサーバ情報を収集するのに Python が必要なのかと。  
Python 2.7 をインストールする際はこのオプションを切ります。

```
gather_facts: no
```

## raw module を使用して Python 2.7 をインストール

apt module を動かす事は出来ません。  
raw module を使用して ssh 経由でコマンドを実行します。

```
tasks:
  - name: install python 2.7
    raw: sudo apt-get install -qq python2.7
```

## ansible_python_interpreter 変数に Python 2.7 のパスを指定

Python 2.7 がインストールできたら、後は Ansible に 2.7 を使うよう指定するだけです。

```
ansible_python_interpreter: /usr/bin/python2.7
```
