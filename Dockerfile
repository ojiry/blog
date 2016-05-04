FROM ruby:2.3.1
RUN mkdir /blog
WORKDIR /blog
COPY Gemfile /blog/Gemfile
COPY Gemfile.lock /blog/Gemfile.lock
RUN bundle install
COPY . /blog
RUN bundle exec jekyll build --destination /var/www/blog
