#! /usr/bin/env bash

PROJECT_PATH=/home/myproject
mkdir -p "${PROJECT_PATH}/logs"

CRON_LOG_FILE=${PROJECT_PATH}/logs/cleanup.log

echo "Cleaning up the database" > ${CRON_LOG_FILE}
date >> ${CRON_LOG_FILE}

cd ${PROJECT_PATH}

# activate if in a virtual environment project
if [[ -f "bin/activate" ]]; then
    . bin/activate
fi

cd project/myproject

python3 manage.py clearsessions --traceback \
    >> ${CRON_LOG_FILE} 2>&1
