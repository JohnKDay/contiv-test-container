# iperf daemon (6660) with netcat and nmap in a container
#
FROM alpine:latest
MAINTAINER John K. Day (johnkday@cisco.com)

RUN apk update && apk add iperf nmap netcat-openbsd && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/iperf","-s","-p 6666"]
