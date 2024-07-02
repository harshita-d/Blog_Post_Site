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