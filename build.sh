#!/bin/bash
set -eu

# Based on https://github.com/mfornasa/DockerYarn
# Yarn caching is ommitted for now

THIS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
THIS_DIR=`basename $THIS_PATH`
DOCKER_IMAGE_NAME="${THIS_DIR}-dev"

touch $THIS_PATH/Gemfile.lock
touch $THIS_PATH/yarn.lock

APP_IMAGE_NAME=$DOCKER_IMAGE_NAME docker-compose build

for LOCK_FILE in 'yarn.lock' 'Gemfile.lock'; do
  docker run --rm --entrypoint cat $DOCKER_IMAGE_NAME:latest /tmp/$LOCK_FILE > /tmp/$LOCK_FILE
  if ! diff -q $THIS_PATH/$LOCK_FILE /tmp/$LOCK_FILE > /dev/null 2>&1; then
    echo "Saving $LOCK_FILE"
    cp /tmp/$LOCK_FILE $THIS_PATH/$LOCK_FILE
  fi
done

if ! command -v pre-commit 2>&1 >/dev/null; then
  echo ""
  echo "This repository has configuration for running pre-commit automatically"
  echo "via the pre-commit.com tooling. We highly recommend you run the following:"
  echo "   brew install pre-commit"
  echo ""
else
  if [ ! -f .git/hooks/pre-push ]; then
    pre-commit install --hook-type pre-push
  fi
fi
