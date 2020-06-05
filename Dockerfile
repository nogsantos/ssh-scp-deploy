FROM alpine:3.10

RUN apk upgrade --update \
    apk add --no-cache openssh \
    && rm -rf /tmp/* /usr/share/man /var/cache/apk/*

COPY . /

ENTRYPOINT ["/entrypoint.sh"]
