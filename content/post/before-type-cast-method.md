+++
title = "before_type_cast method の話"
draft = false
date = "2016-11-28T21:41:43+09:00"
+++

Rails 5 対応してて見つけた仕様変更。

と言ってもリリースノートか何処かに書いてあるかもしれんけど。

Multiparameter を使う時、 Rails 4.2 までは次のような値になる。

```rb
book = Book.new('published_on(1i)': '2016', 'published_on(2i)': '11', 'published_on(3i)': '28')
book.published_on #=> Mon, 28 Nov 2016
book.published_on_before_type_cast #=> Mon, 28 Nov 2016

book = Book.new('published_on(1i)': '2016', 'published_on(2i)': '', 'published_on(3i)': '28')
book.published_on_before_type_cast #=> nil
```

これが Rails 5 だと次のように変更されている。

```rb
book = Book.new('published_on(1i)': '2016', 'published_on(2i)': '11', 'published_on(3i)': '28')
book.published_on #=> Mon, 28 Nov 2016
book.published_on_before_type_cast #=> {1=>2016, 2=>11, 3=>28}

book = Book.new('published_on(1i)': '2016', 'published_on(2i)': '', 'published_on(3i)': '28')
book.published_on_before_type_cast #=> {1=>2016, 2=>nil, 3=>28}
```

普通にアプリ作ってると before_type_cast の値を使う事はあまり無いと思う。

Gem なんかだとこの値を見るものがあって、今回のこの変更でテストが落ちた。

まぁ Rails 5 対応してない Gem なんで仕方ないんですが。

一応手元では対応したけど、英語力がなくてまだ PR は出していない。

時間見つけて投げておきたいところ。
