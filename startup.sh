#!/bin/bash
set -eu

THIS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
THIS_DIR=`basename $THIS_PATH`
DOCKER_IMAGE_NAME="${THIS_DIR}-dev"

APP_IMAGE_NAME=$DOCKER_IMAGE_NAME docker-compose up

