# iperf daemon (6660) with netcat and nmap in a container
#
FROM alpine:latest
MAINTAINER John K. Day (johnkday@cisco.com)

RUN apk --update add bash curl nginx php5-fpm iperf nmap netcat-openbsd && \
    mkdir -p /run/nginx && \
    rm -rf /var/cache/apk/*

ADD www /www
ADD nginx.conf /etc/nginx/
ADD php-fpm.conf /etc/php5/php-fpm.conf
ADD run.sh /run.sh
ENV LISTEN_PORT=80
CMD /run.sh
