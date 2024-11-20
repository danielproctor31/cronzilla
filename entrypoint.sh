#!/bin/sh

apk update

if [ -f /packages.txt ]; then
    cat /packages.txt | xargs apk add
fi

chmod 0644 /cron/cronconfig
crontab /cron/cronconfig

chmod +x /cron/run.sh
crond -f