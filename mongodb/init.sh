#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



# Database directory
if [ ! -d /var/lib/mongodb ]; then
    mkdir /var/lib/mongodb
fi

# Logs directory
if [ ! -d /var/log/mongodb ]; then
    mkdir /var/log/mongodb
fi

chown -R mongodb:mongodb /var/lib/mongodb
chown -R mongodb:mongodb /var/log/mongodb
su -s /bin/sh -c "/usr/bin/mongod --config /etc/conf.d/mongodb.conf" mongodb



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

