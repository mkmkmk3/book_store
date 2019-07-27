# Ruby 2.6を利用する
FROM ruby:2.6

ENV LANG C.UTF-8
ENV DEBCONF_NOWARNINGS yes

# OSのパッケージをアップデート
RUN apt-get update -yqq && \
apt-get install -yqq --no-install-recommends \
build-essential \
libpq-dev \
nodejs
RUN ln -snf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && echo Asia/Tokyo > /etc/timezone

# /webapp配下にソースを配置しGemをインストール
RUN mkdir /webapp
COPY Gemfile* /webapp/
WORKDIR /webapp
RUN bundle install
COPY . /webapp/

# entrypoint.shの実行
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Railsサーバーの実行
CMD ["bin/rails", "s", "-b", "0.0.0.0"]

