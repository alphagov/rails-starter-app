# Rails Starter Template Application
This is a Ruby on Rails template using the latest Gov design styles: https://design-system.service.gov.uk/get-started/

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
