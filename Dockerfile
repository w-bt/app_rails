FROM jruby:9.1.12-alpine

RUN apk update && apk add build-base nodejs postgresql-dev redis git

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

CMD bundle exec puma -C config/puma.rb
