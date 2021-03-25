FROM ruby:2.5.8-alpine3.13

# prepare volumes for bundle and repository
RUN mkdir -p /usr/local/bundle/cache \
    && mkdir -p /usr/local/bundle/gems \
    && mkdir -p /srv/jekyll

# install development tools
# https://github.com/gliderlabs/docker-alpine/issues/53#issuecomment-179486583
RUN apk add --update \
    build-base \
    libxml2-dev \
    libxslt-dev \
    && rm -rf /var/cache/apk/*

# install jekyll
RUN gem install jekyll

ENTRYPOINT ["/bin/sh"]