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
    && apk add --no-cache  nodejs-current nodejs-current-npm

# Settings
COPY ./init.sh /
RUN chmod 755 /init.sh

# Entrypoint
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 3000

# Volume
VOLUME ["/var/lib/nodejs"]

