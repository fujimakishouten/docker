FROM alpine:edge
LABEL maintainer "fujimakishouten <fujimakishouten@fujimakishouten.com>"

# Environment variables
ENV LANGUAE C.UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Install
RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && apk del tzdata \
    && apk add --no-cache php8-curl php8-fpm php8-intl php8-mbstring php8-opcache

# Settings
COPY ./php.ini /etc/php8/php.ini
COPY ./php-fpm.conf /etc/php8/php-fpm.conf
COPY ./www.conf /etc/php8/php-fpm.d/www.conf
COPY ./init.sh /
RUN chmod 755 /init.sh

# Entrypoint
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 9000

# Volume
VOLUME ["/var/www", "/var/log/php7"]
