FROM debian:stable-slim
RUN apt-get update
RUN apt-get -y install bash ruby ruby-dev rubygems build-essential curl zip bzip2 jq
# https://github.com/jordansissel/fpm/issues/1663
RUN gem install --no-document backports -v 3.15.0
RUN gem install --no-document fpm
WORKDIR /packages
