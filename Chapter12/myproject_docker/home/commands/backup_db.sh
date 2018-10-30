#! /usr/bin/env bash

ROOT_PATH=/root
mkdir -p "${ROOT_PATH}/db_backups"
mkdir -p "${ROOT_PATH}/logs"

CRON_LOG_FILE=${ROOT_PATH}/logs/backup_db.log

WEEK_DATE=$(LC_ALL=en_US.UTF-8 date +"%w-%A")
BACKUP_PATH=${ROOT_PATH}/db_backups/${WEEK_DATE}.sql

DATABASE=${MYSQL_DATABASE}
HOST=${MYSQL_HOST}
USER=${MYSQL_USER}
PASS=${MYSQL_PASSWORD}

EXCLUDED_TABLES=(
django_session
)

IGNORED_TABLES_STRING=''

for TABLE in "${EXCLUDED_TABLES[@]}"; do
    IGNORED_TABLES_STRING+=" --ignore-table=${DATABASE}.${TABLE}"
done

echo "Creating DB Backup" > ${CRON_LOG_FILE}
date >> ${CRON_LOG_FILE}

echo "Dump structure" >> ${CRON_LOG_FILE}
mysqldump -h ${HOST} -u ${USER} -p${PASS} \
          --single-transaction --no-data \
    ${DATABASE} > ${BACKUP_PATH} \
    2>> ${CRON_LOG_FILE}

echo "Dump content" >> ${CRON_LOG_FILE}
mysqldump -h ${HOST} -u ${USER} -p${PASS} \
    ${DATABASE} ${IGNORED_TABLES_STRING} >> ${BACKUP_PATH} \
    2>> ${CRON_LOG_FILE}
