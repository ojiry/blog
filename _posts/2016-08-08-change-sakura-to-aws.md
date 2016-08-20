---
layout: post
title: ブログをさくらから AWS に完全移行した
description: ドメイン管理も含め、ブログ周りを全て AWS に移行した備忘録です。
date: 2016-08-08
---

タイトルの通りなのですが、ブログをさくらから AWS にしました。  
きっかけはこちらの記事。

[AWS Certificate Manager でこのブログを HTTPS 化しました](https://blog.manabusakai.com/2016/07/switch-to-https/)

正直に言います。  
Jekyll を S3 で公開すると HTTPS 化出来ないと思い込んでいました。  
ちゃんと調べればすぐわかったのに。

結果的に Docker や Let's Encrypt, Nginx なりと学ぶ事はありましたけどね。

では、私がやった事のリンクをまとめていきます。  
詳しい内容はリンク先を読んでください。

## お名前.com から Amazon Route 53 にドメインを移管

まずは お名前.com で管理していたドメインを Route 53 に移管しました。

[お名前.comからAmazon Route 53へドメインを移管する ｜ Developers.IO](http://dev.classmethod.jp/cloud/aws/onamae-to-route53/)

管理しているドメインが2つとも有効期限200日以上残ってましたが、大人の事情でスルー。

移管はスムーズに終わりました。  
手続きの間にメール認証が2回あります。  
これを承認しないと手続きが進まないので、メールチェック大事です。

## お名前.com を退会

大人の事情で退会しました。  
退会はサービス上から行えないので、問い合わせフォーム経由で退会する必要があります。

[お名前.comでドメインが取得できなかったうえに、退会するのがけっこうめんどくさかった件 ｜  INCOMPLETE++](http://mikan.lunarscape.net/2016/02/cancel-onamaecom.html)

## AWS アカウントの初期設定

数年前にAWSアカウントを作成して依頼、お遊び程度でしか触っていなかったので色々ザルでした。  
流石にこのまま使うのはマズそうなので、権限周りをしっかりと整備しました。

[AWSアカウントを取得したら速攻でやっておくべき初期設定まとめ - Qiita](http://qiita.com/tmknom/items/303db2d1d928db720888)

## S3 に静的ファイルをデプロイ

特に難しい事はなく、 s3_website という gem を使います。

[laurilehmijoki/s3_website](https://github.com/laurilehmijoki/s3_website)

ここでも [@manabusakai](https://twitter.com/manabusakai) の記事を参考にさせて頂きました。

[Jekyll サイトを s3_website で Amazon S3 に公開する](https://blog.manabusakai.com/2014/03/jekyll-s3-website/)

## ブログを HTTPS で公開

AWS Certificate Manager と Amazon CloudFront を使い HTTPS 化します。

[無償SSLのCertificate Manager、S3、Cloud Frontで、独自ドメインの静的HTTPSサイトを作る - Qiita](http://qiita.com/74th/items/62aaf34c080e747ba420)

CloudFront のエンドポイントからサイトが見れる事が確認できたら、 Route 53 の設定を変更します。  
これで無事ブログの S3 への移行が完了です。

## S3 と Route 53 を使ったリダイレクト

実はさくらで動かしている Nginx は、サブドメインのリダイレクト設定がされていました。  
blog.ojiry.com を rynotes.com にリダイレクトしています。  
S3 と Route 53 を使えば実現できるので、こちらも対応しました。

[Domain forwarding using Amazon S3 and Route 53 ｜ Rude Otter](https://blog.rudeotter.com/domain-forwarding-amazon-s3-route-53/)

## リダイレクトの HTTPS 化

上記の方法では HTTPS でアクセスするとリダイレクトされません。  
これは CloudFront を利用する事で解決が可能です。

[S3 で HTTPS をリダイレクトする - @m4i's blog](https://blog.m4i.jp/2015/10/01/redirect-https-using-s3)

## EC2 のインスタンスで Nginx を立ち上げる

実はブログ以外にも、 いくつかサブドメインのリダイレクトを設定してました。  

こんな感じのです。

```shell
$ curl -Ls card.ojiry.com | cat
```

S3 のリダイレクトではパスの最後に `/` が入ってしまい、どうにも上手く動きません。  
少し調べても bit.ly を使う以外の方法が見つからず、大人しく Nginx を立てました。

t2.nano という安いインスタンスもありますし、 EC2 の勉強にもちょうどよいです。  
今後 Webserver が必要になる事もあるかもしれませんしね。

## 移行完了!!

これで無事に AWS への完全移行が出来ました。  
さくらはもう不要なのでサーバを解約しました。

これからは認定資格の取得も視野にいれ、 AWS を触っていきます。
