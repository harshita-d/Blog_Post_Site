# Blog_Post_Site

Python-Django Fullstack project

## Building Docker image

```
docker build .
```

## Building image via docker-compose

```
docker-compose build
```

## linting package

- flake8

```
docker-compose run --rm app sh -c "flake8"
```

- we will create a separate requirements.dev.txt file because we do not need this package when we are running our deployed application but only need it for development and to aviod unecessary package into the image that we are deploying to server

- to configure flake8 we need to create file inside our app directory ".flake8" so that it is picked up by linting tool. .flake8 is the default name od the flake8 config file.

## testing

- django test suit

```
docker-compose run --rm app sh -c "python manage.py test"
```

## create django project via docker-compose

```
docker-compose run --rm app sh -c "django-admin startproject app ."
```

## docker-compose command for starting services

- this commandd will start all the services
- we can check on localhost:8000 and check if the service is up

```
docker-compose up
```

## Github actions

- it is similar to CI/CD pipeline
- it is an automation tool to run jobs
- it is used for deployment, linting, and unit test

## Psycopg2

- the package needed to connect django to database
- the most famous PostgreSQl adaptor for python
- list of package dependencies for Psycopg2
  - C compiler
  - python3-dev
  - libpq-dev
- Equivalent packages on alpine
  - postgresql-client
  - build-base
  - postgresql-dev
  - musl-dev

> You're adding a management command to the core app in your Django project to ensure the database is ready before running other commands. This is necessary because using Postgres with Docker Compose can cause startup errors if the database isn't fully initialized when the Django app tries to connect.

## Unit Test

- Django’s unit tests use a Python standard library module: unittest. This module defines tests using a class-based approach.

- unittest is a standard Python library used for writing and running tests. It provides a framework for creating test cases, test suites, and running tests with a test runner.

- django.test is specifically designed for testing Django applications. It extends unittest by providing tools and classes that are specific to Django, like testing views, models, forms, and more.

- You can use patch to replace external services or APIs with mock objects during testing, ensuring that your tests don't depend on external systems.

- call_command is used to call command that we are testing
