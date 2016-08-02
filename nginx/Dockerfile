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

# Install Nginx
RUN apt-get install --yes nginx
RUN mv /etc/nginx/nginx.conf /etc/nginx.conf.original
RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.original
RUN rmdir /var/log/nginx

# APT
RUN apt-get clean --yes

# Initialize shell
COPY init.sh /
RUN chmod 755 /init.sh

# Entrypoint
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 80 443

# Volume
VOLUME ["/data"]

