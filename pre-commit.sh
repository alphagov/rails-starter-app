#!/bin/bash
set -eu

THIS_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
$THIS_PATH/build.sh

docker-compose run app bin/rake
