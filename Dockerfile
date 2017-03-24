FROM ruby:2.3.3

MAINTAINER Christian Moretti <christianmoretti@me.com>

ENV APP_HOME /usr/src/active_migration

RUN mkdir -p $APP_HOME

COPY Gemfile* $APP_HOME/
WORKDIR $APP_HOME

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=$BUNDLE_PATH

RUN apt-get install libxml2 libxml2-dev libxslt-dev -y && gem install bundler --no-ri --no-rdoc && bundle install