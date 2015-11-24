FROM debian:unstable

MAINTAINER fujimakishouten <info@fujimakishouten.com>

# APT
ENV DEBIAN_FRONTEND noninteractive
RUN sed -i -e 's/http\.debian\.net/ftp.jp.debian.org/' /etc/apt/sources.list
RUN apt-get update

# Timezone
RUN echo 'Asia/Tokyo' > /etc/timezone
RUN dpkg-reconfigure tzdata

# Locale
RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
RUN apt-get install locales
RUN update-locale LANG=en_US.UTF-8
RUN . /etc/default/locale

# Install mongodb
RUN apt-get install --yes mongodb

# APT
RUN apt-get clean --yes

# Setup h2o
COPY ./mongodb.conf /etc/mongodb.conf

# Entrypoint
COPY init.sh /
RUN chmod 755 /init.sh
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 27017 27018 27019 28017

# Volume
VOLUME ["/var/lib/mongodb"]

