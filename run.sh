#!/bin/sh

CONF_FILE=/etc/nginx/nginx.conf

sed -i "s/#LISTEN_PORT#/${LISTEN_PORT}/" ${CONF_FILE}

iperf -D -s -p 6666

php-fpm -d variables_order="EGPCS" && exec nginx -g "daemon off;"
