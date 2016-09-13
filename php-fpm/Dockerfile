FROM ubuntu:trusty

MAINTAINER fujimakishouten <info@fujimakishouten.com>

# APT
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

# Timezone
RUN echo 'Asia/Tokyo' > /etc/timezone
RUN dpkg-reconfigure tzdata

# Locale
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN . /etc/default/locale

# Install PHP
RUN apt-get install --yes php-fpm php-intl php-mbstring php-xdebug
RUN mv /etc/php/7.0/fpm /etc/php/7.0/original


RUN cp -pr /etc/php/7.0/fpm /etc/php/7.0/fpm.original
RUN rm -r /etc/php/7.0/fpm/php.ini /etc/php/php7.0/fpm/php-fpm.conf /etc/php/7.0/fpm/pool.d

# APT
RUN apt-get clean --yes

# Initialize shell
COPY init.sh /
RUN chmod 755 /init.sh

# Entrypoint
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 9000

# Volume
VOLUME ["/data"]

