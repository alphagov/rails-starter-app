# Rails Starter Template Application
This is a Ruby on Rails template using GOV.UK Design System styles: https://design-system.service.gov.uk/get-started/

## Setting up the app in development

```
./build.sh  # create a Docker image
./startup.sh  # run a local server on Docker
```

## Updating dependencies

```
rm Gemfile.lock  # and/or
rm yarn.lock
./build.sh
```

## Running tests
```
./pre-commit.sh
```

## Running arbitrary commands with docker-compose

The build script supplied here names the Docker image according to the current directory, to avoid any chance of confusion if you are creating multiple apps. You can change that, and simplify the examples below, by customising `docker-compose.yml`.

```
APP_IMAGE_NAME=`basename $( pwd )`-dev docker-compose run app bin/rake db:reset
APP_IMAGE_NAME=`basename $( pwd )`-dev docker-compose run app bin/rails dbconsole  # etc
```
