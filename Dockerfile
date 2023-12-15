FROM ruby:3.1.2

# install rails dependencies
RUN apt-get clean all && apt-get update -qq && apt-get install -y build-essential libpq-dev \
    curl gnupg2 apt-utils  postgresql-client postgresql-server-dev-all git libcurl3-dev cmake \
    libssl-dev pkg-config openssl


RUN mkdir /rails-app
WORKDIR /rails-app

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . /rails-app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]