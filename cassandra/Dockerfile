FROM alpine:edge
LABEL maintainer "fujimakishouten <fujimakishouten@fujimakishouten.com>"

# Cassandra version
ENV CASSANDRA_VERSION 3.10

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
    && apk add --no-cache openjdk8-jre \
    && mkdir /opt \
    && wget http://ftp.riken.jp/net/apache/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz \
    && tar zxf apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz -C /opt \
    && ln -s /opt/apache-cassandra-${CASSANDRA_VERSION} /opt/cassandra \
    && rm apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz

# Settings
COPY ./cassandra-env.sh /opt/cassandra/conf/cassandra-env.sh
COPY ./cassandra.yaml /opt/cassandra/conf/cassandra.yaml
COPY ./init.sh /
RUN chmod 755 /init.sh

# Entrypoint
ENTRYPOINT ["/init.sh"]

# Expose
EXPOSE 7000 7001 7199 8888 9042 9160 61620 61621

# Volume
VOLUME ["/opt/cassandra/data", "/opt/cassandra/logs"]

