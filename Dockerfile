FROM alpine:latest

RUN mkdir /cron
WORKDIR /cron

COPY cronconfig cronconfig

RUN apk update \
    apk add curl

RUN chmod 0644 "cronconfig"
RUN crontab "cronconfig"

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
