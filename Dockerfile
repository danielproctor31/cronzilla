FROM alpine:latest

ENV CRON_INTERVAL='*/5 * * * *'

RUN mkdir /cron
WORKDIR /cron

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
