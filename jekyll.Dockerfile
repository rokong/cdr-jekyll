FROM jekyll/jekyll:4.2.0

# run entrypoint first
RUN /usr/jekyll/bin/entrypoint

# install then serve
RUN bundle install \
    && bundle exec jekyll serve

ENTRYPOINT ["/bin/sh"]

apk add --update build-base libxml2-dev libxslt-dev && rm -rf /var/cache/apk/*

gem install jekyll
