#!/bin/bash

bundle check || bundle install

yarn check || yarn install

bundle exec rails s