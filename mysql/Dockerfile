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

# Install MySQL 
RUN apt-get install --yes mysql-server

# APT
RUN apt-get clean --yes

# Setup MySQL
COPY ./conf.d /etc/mysql/conf.d
COPY ./mysql.conf.d /etc/mysql/mysql.conf.d
COPY grant.sql /
RUN /usr/bin/mysqld_safe & sleep 10s && mysql < /grant.sql

# Entrypoint
COPY init.sh /
RUN chmod 755 /init.sh
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 3306

# Volume
VOLUME ["/var/lib/mysql"]

