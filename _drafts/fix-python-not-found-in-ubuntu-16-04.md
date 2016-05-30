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
どうやらデフォルトでインストールされている Python が、2系から3系に更新された事が原因のようです。
解決方法もググれば直ぐに出てきたので、自分への備忘録として対応をまとめておきます。


