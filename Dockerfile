FROM ruby:2.2.0
RUN echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list && \
    wget -qO - https://toolbelt.heroku.com/apt/release.key | apt-key add -  && \
    apt-get update -q && apt-get install -y build-essential libpq-dev git heroku-toolbelt
RUN mkdir /railsapp
RUN mkdir /files
WORKDIR /railsapp
ADD ./railsapp /railsapp
ADD ./files /files
RUN bundle install
