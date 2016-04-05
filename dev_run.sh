#!/usr/bin/env bash

CACHE_DIR=/tmp/nginx-cache
LOG_DIR=/tmp/nginx-log

exec docker run -it \
    --rm \
    --name my-app-dev \
    -v $LOG_DIR:/var/nginx/log \
    -v $CACHE_DIR:/var/nginx/cache \
    -v "$(pwd)/nginx/lualib":/opt/openresty/nginx/lualib \
    -v "$(pwd)/nginx/conf":/opt/openresty/nginx/conf \
    -v "$(pwd)/nginx/data":/www/data \
    -p 8999:80 \
    openresty-magick:latest

#    ficusio/openresty:debian "$@"
