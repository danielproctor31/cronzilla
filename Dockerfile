FROM alpine:latest

ARG CRON_INTERVAL='*/5 * * * *'

RUN mkdir /cron
WORKDIR /cron

RUN echo "${CRON_INTERVAL} /cron/run.sh >> /proc/1/fd/1 2>/proc/1/fd/2" > cronconfig

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
