#!/bin/sh

apk update

if [ -f /packages.txt ]; then
    cat /packages.txt | xargs apk add
fi

echo "${CRON_INTERVAL} /cron/run.sh >> /proc/1/fd/1 2>/proc/1/fd/2" > cronconfig

chmod 0644 /cron/cronconfig
crontab /cron/cronconfig

chmod +x /cron/run.sh
crond -f