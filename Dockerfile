# build me as fredhutch/data

FROM ruby:2.7.1


ADD ./ /srv/jekyll
WORKDIR /srv/jekyll/

RUN gem install bundler
RUN bundle update
RUN gem install -g Gemfile
RUN bundle install
RUN bundle exec jekyll build

FROM nginx

COPY --from=0 /srv/jekyll/_site/ /usr/share/nginx/html
RUN cp /usr/share/nginx/html/resources/images/favicon.ico /usr/share/nginx/html/


EXPOSE 80
