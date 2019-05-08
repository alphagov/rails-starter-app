#!/bin/bash
set -eu

THIS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
THIS_DIR=`basename $THIS_PATH`
DOCKER_IMAGE_NAME="${THIS_DIR}-dev"

rm -f $THIS_PATH/tmp/pids/* 
docker run -it -p 3000:3000 --rm -v $THIS_PATH:/usr/src -w /usr/src $DOCKER_IMAGE_NAME rails s -b 0.0.0.0
