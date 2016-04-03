#!/usr/bin/env bash

CACHE_DIR=/tmp/nginx-cache
LOG_DIR=/tmp/nginx-log

exec docker run -it \
    --rm \
    --name my-app-dev \
    -v $LOG_DIR:/app/esben_nginx/log/ \
    -v $CACHE_DIR:/app/esben_nginx/var/cache-rita \
    -v $CACHE_DIR:/app/esben_nginx/var/cache-esben \
    -v "$(pwd)/install_template/etc":/opt/openresty/nginx/etc \
    -v "$(pwd)/install_template/conf/lualib/nsb":/opt/openresty/lualib/nsb \
    -v "$(pwd)/install_template/conf":/opt/openresty/nginx/conf \
    -p 8999:80 \
    ficusio/openresty:debian "$@"

