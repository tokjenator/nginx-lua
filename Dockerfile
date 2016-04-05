FROM ficusio/openresty:debian

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    unzip luarocks libmagickwand-dev \
 && rm -rf /var/lib/apt/lists/*

RUN luarocks install magick

