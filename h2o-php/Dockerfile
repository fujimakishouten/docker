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
    && apk add --no-cache  h2o

# Settings
COPY ./h2o.conf /etc/h2o.conf
COPY ./init.sh /
RUN chmod 755 /init.sh

# Entrypoint
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 80 443

# Volume
VOLUME ["/var/www", "/var/log/h2o"]

