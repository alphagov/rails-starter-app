#!/bin/bash
set -eu

docker-compose run app bin/rake
