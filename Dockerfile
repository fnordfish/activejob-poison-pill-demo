# syntax=docker/dockerfile:1
FROM ruby:3.1
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock
RUN bundle install

