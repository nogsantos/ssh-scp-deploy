FROM alpine:3.10

RUN apk upgrade --update \
    && apk add --update openssh \
    && rm -rf /tmp/* /usr/share/man /var/cache/apk/*

COPY . /

ENTRYPOINT ["/entrypoint.sh"]
