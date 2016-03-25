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

# Install node.js
RUN apt-get install --yes nodejs ca-certificates
RUN ln -s /usr/bin/nodejs /usr/local/bin/node
RUN mkdir -p /var/lib/node

# APT
RUN apt-get clean --yes

# Entrypoint
COPY init.sh /
RUN chmod 755 /init.sh
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 3000

# Volume
VOLUME ["/var/lib/node"]

