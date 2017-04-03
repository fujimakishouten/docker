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
    && apk add --no-cache nginx \
    && ln -s /var/www/localhost/htdocs /var/www/html

# Settings
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./init.sh /
RUN chmod 755 /init.sh

# Entrypoint
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 80 443

# Volume
VOLUME ["/var/www/html", "/var/log/nginx"]

