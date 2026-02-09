FROM ruby:3.4.1

RUN apt-get update && apt-get install -y \
  build-essential \
  default-mysql-client \
  libmariadb-dev \
  libssl-dev \
  zlib1g-dev \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
COPY . .
RUN gem install bundler
RUN bundle install --verbose


EXPOSE 8080

