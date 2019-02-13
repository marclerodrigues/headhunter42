FROM ruby:2.5.0

ENV DEBIAN_FRONTED=noninteractive \
    NODE_VERSION=10.15.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client

RUN curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install yarn -g

WORKDIR /app

ADD . /app

# Execute script everytime container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
