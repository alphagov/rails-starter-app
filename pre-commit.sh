#!/bin/bash
set -eu

if ! command -v pre-commit 2>/dev/null; then
  echo "This repository has configuration for running pre-commit automatically"
  echo "via the pre-commit.com tooling. We highly recommend you run the following:"
  echo "   brew install pre-commit"
  echo "then to set up pre-commit to run on pre-push:"
  echo "   pre-commit install --hook-type pre-push"
else
  if [ ! -f .git/hooks/pre-push ]; then
    pre-commit install --hook-type pre-push
  fi
fi

bundle check || bundle install

bundle exec rake