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

# Install cassandra
RUN gpg --keyserver pgp.mit.edu --recv-keys 749D6EEC0353B12C
RUN gpg --export --armor 749D6EEC0353B12C | apt-key add -
RUN echo 'deb http://www.apache.org/dist/cassandra/debian 21x main' > /etc/apt/sources.list.d/cassandra.list
RUN echo 'deb-src http://www.apache.org/dist/cassandra/debian 21x main' >> /etc/apt/sources.list.d/cassandra.list
RUN apt-get update
RUN apt-get install --yes cassandra

# APT
RUN apt-get clean --yes

# Entrypoint
COPY init.sh /
RUN chmod 755 /init.sh
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 7000 7001 7199 9042 9160

# Volume
VOLUME ["/var/lib/cassandra"]

