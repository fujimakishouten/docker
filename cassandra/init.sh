#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



CASSANDRA_HOST_NAME=`hostname -i`

sed -i -e "s/#MAX_HEAP_SIZE=\"4G\"/MAX_HEAP_SIZE=\"256M\"" /etc/cassandra/cassandra-env.sh
sed -i -e "s/#HEAP_NEWSIZE=\"800M\"/#HEAP_NEWSIZE=\"32M\"" /etc/cassandra/cassandra-env.sh
sed -i -e "s/listen_address: localhost/listen_address: $CASSANDRA_HOST_NAME/" /etc/cassandra/cassandra.yaml
sed -i -e "s/rpc_address: localhost/rpc_address: 0.0.0.0/" /etc/cassandra/cassandra.yaml
sed -i -e "s/# broadcast_rpc_address: 1\.2\.3\.4/broadcast_rpc_address: $CASSANDRA_HOST_NAME/" /etc/cassandra/cassandra.yaml
sed -i -e "s/- seeds: \"127\.0\.0\.1\"/- seeds: \"$CASSANDRA_HOST_NAME\"/" /etc/cassandra/cassandra.yaml


/usr/sbin/cassandra -R -f



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

