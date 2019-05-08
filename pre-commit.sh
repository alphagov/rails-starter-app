#!/bin/bash
set -eu
THIS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
THIS_DIR=`basename $THIS_PATH`
DOCKER_IMAGE_NAME="${THIS_DIR}-dev"

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

./build.sh
docker run $DOCKER_IMAGE_NAME bin/rake
