+++
title = "accepts_multiparameter_time.rb の話"
draft = false
date = "2016-11-22T00:18:59+09:00"
+++

Rails 5 に Upgrade する際に遭遇した date_validator の不具合。

というか date_validator が Rails 5 に対応してないので、不具合というよりは仕様。

Rails 4 までは下記のような結果を返すわけですが。

```rb
book = Book.new('published_on(1i)': '', 'published_on(2i)': '11', 'published_on(3i)': '1')
book.published_on_before_type_cast # => nil
```

それが Rails 5 だとこうなる。

```rb
book = Book.new('published_on(1i)': '', 'published_on(2i)': '11', 'published_on(3i)': '1')
book.published_on_before_type_cast # => {1=>nil, 2=>11, 3=>1}
```

date_validator は _before_type_cast の値で判定しているので、ここを直さないといかん。

のだけど、今夜は良い方法が思いつかなかったので明日の自分に期待。
