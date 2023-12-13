# Rails Starter Template Application

>**GOV.UK Verify has closed**
>
>This repository is out of date and has been archived

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

```
docker-compose run app bin/rake db:reset
docker-compose run app bin/rails dbconsole  # etc
```

To drop into a debugger if your `spec` tests fail, you can use:

```
docker-compose run -e PRY_RESCUE_RAILS=true app bin/rake spec
```

