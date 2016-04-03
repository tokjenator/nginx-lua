#!/usr/bin/env bash

CACHE_DIR=/tmp/nginx-cache
LOG_DIR=/tmp/nginx-log

exec docker run -it \
    --rm \
    --name my-app-dev \
    -v $LOG_DIR:/app/nginx/log/ \
    -v $CACHE_DIR:/app/esben_nginx/var/cache \
    -v "$(pwd)/install_template/conf/lualib":/opt/openresty/lualib \
    -v "$(pwd)/install_template/conf":/opt/openresty/nginx/conf \
    -p 8999:80 \
    ficusio/openresty:debian "$@"

