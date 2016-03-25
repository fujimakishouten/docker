FROM debian:unstable

MAINTAINER fujimakishouten <info@fujimakishouten.com>

# APT
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install --yes apt-utils

# Timezone
RUN echo 'Asia/Tokyo' > /etc/timezone
RUN dpkg-reconfigure tzdata

# Locale
RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
RUN apt-get install --yes locales
RUN update-locale LANG=en_US.UTF-8
RUN . /etc/default/locale

# Install redis
RUN apt-get install --yes redis-server

# APT
RUN apt-get clean --yes

# Entrypoint
ENTRYPOINT ["/usr/bin/redis-server"]

# Expose
EXPOSE 6379

# Volume
VOLUME ["/var/lib/redis"]
