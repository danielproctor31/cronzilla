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

# start container with crond
CMD ["crond", "-f"]
