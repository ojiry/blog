FROM ruby:2.3.1
WORKDIR /var/www/blog
ADD Gemfile /var/www/blog/
ADD Gemfile.lock /var/www/blog/
RUN bundle install
ADD . /var/www/blog
RUN bundle exec jekyll build
