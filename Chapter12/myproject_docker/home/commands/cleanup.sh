#! /usr/bin/env bash

PROJECT_PATH=/usr/src/app
mkdir -p "${PROJECT_PATH}/logs"

CRON_LOG_FILE=/root/logs/cleanup.log

echo "Cleaning up the database" > ${CRON_LOG_FILE}
date >> ${CRON_LOG_FILE}

cd ${PROJECT_PATH}

python3 manage.py clearsessions --traceback \
    >> ${CRON_LOG_FILE} 2>&1
