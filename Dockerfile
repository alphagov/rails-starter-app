FROM ruby:2.6-alpine
RUN apk update
RUN apk upgrade

# Set local timezone
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
    echo "Europe/London" > /etc/timezone

# Install your app's runtime dependencies in the container
ENV BUILD_PACKAGES="postgresql-client curl-dev ruby-dev build-base bash" \
    DEV_PACKAGES="firefox-esr zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev postgresql-dev" \
    RUBY_PACKAGES="ruby-json yaml nodejs"

# Update and install base packages and nokogiri gem that requires a
# native compilation
RUN apk update && \
    apk upgrade && \
    apk add --update\
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES

RUN gem install bundler
RUN apk update && apk add -u yarn

WORKDIR /usr/src/rails-app
COPY Gemfile* ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
RUN cp Gemfile.lock /tmp  # make updated lock file available to build process as COPY . will replace with out-of-date version

COPY package.json ./
COPY yarn.lock ./
RUN yarn install
RUN cp yarn.lock /tmp  # make updated lock file available to build process as COPY . will replace with out-of-date version

COPY . ./

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
