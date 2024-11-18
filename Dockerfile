FROM alpine:latest

# Create dir
RUN mkdir /cron
WORKDIR /cron

# Copy files
COPY cronconfig cronconfig

# Install dos2unix
RUN apk update \
    apk --no-cache add dos2unix
RUN apk add curl

# Set permissions
RUN chmod 0644 "cronconfig"

## setup cron configs
RUN crontab "cronconfig"

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
