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
    && apk add --no-cache php7-curl php7-fpm php7-intl php7-json php7-mbstring php7-mcrypt php7-opcache

# Settings
COPY ./php.ini /etc/php7/php.ini
COPY ./php-fpm.conf /etc/php7/php-fpm.conf
COPY ./www.conf /etc/php7/php-fpm.d/www.conf
COPY ./init.sh /
RUN chmod 755 /init.sh

# Entrypoint
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 9000

# Volume
VOLUME ["/var/www", "/var/log/php7"]

