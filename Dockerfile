# image name
FROM python:3.9-alpine3.13

# label name
LABEL maintainer="hrsdadhich"

# help with debugging
ENV PYTHONBUFFERED 1

# copying requirements file into temp/requiremnets.txt of conatiner
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt

# copying app from local to app in conatiner
COPY ./app /app

# specifying working directory in conatiner
WORKDIR /app

# specifying the port
EXPOSE 8000

ARG DEV=false

# first command specifies the ceation of virtual env in conatiner with name as py
# second command upgrade the pip to latest version inside venv
# third command copying requirements.txt from tmp to venv inside container and installing it
# removing the tmp folder as we have installed everything into venv from it
# now create a user as we should not use root user
# This option disables the password for the new user.
# The user will not be able to log in using a password, but other authentication methods (such as SSH keys) can still be used.
# This option tells adduser not to create a home directory for the new user.
# Normally, adduser would create a home directory (e.g., /home/django-user) for the user, but this option prevents that.
# django-user: This is the username of the new user being created.
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser  \
        --disabled-password \
        --no-create-home \
        django-user


# By setting PATH="/py/bin:$PATH", you make sure that the Python interpreter and any other executables
# installed in this virtual environment are used when commands are run inside the container.
# This is especially useful for ensuring that the container uses the correct versions of Python and installed packages.
ENV PATH="/scripts:/py/bin:$PATH"

# The USER django-user instruction in a Dockerfile switches the context to the django-user user for the execution of subsequent instructions.
# This is used primarily for security reasons, ensuring that the container does not run as the root user,
USER django-user

