FROM python:3
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        less mysql-client libmysqlclient-dev
WORKDIR /usr/src/app
ARG BUILD_ENV=prod
ADD config/requirements ./requirements
RUN pip install --upgrade pip; \
    pip install -r requirements/$BUILD_ENV.txt
RUN django-admin startproject myproject .; \
    mv ./myproject ./origproject
