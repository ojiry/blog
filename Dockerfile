FROM ruby:2.3.1
RUN mkdir /blog
WORKDIR /blog
ADD Gemfile /blog/Gemfile
ADD Gemfile.lock /blog/Gemfile.lock
RUN bundle install
ADD . /blog
RUN bundle exec jekyll build --destination /var/www/blog
