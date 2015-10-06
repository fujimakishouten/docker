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

# Install dependences
RUN apt-get install --yes git build-essential cmake libssl-dev libyaml-dev

# APT
RUN apt-get clean --yes

# Checkout soruces
RUN mkdir -p /opt/h2o/src
RUN git clone https://github.com/h2o/h2o.git /opt/h2o/src

# Bulid
WORKDIR /opt/h2o/src
RUN cmake -DCMAKE_INSTALL_PREFIX=/opt/h2o .
RUN make
RUN make install

# Setup h2o
RUN mkdir -p /opt/h2o/etc
COPY ./h2o.conf /opt/h2o/etc/h2o.conf

# Entrypoint
COPY ./init.sh /
RUN chmod 755 /init.sh
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 80

# Volume
VOLUME ["/var/lib/h2o"]
