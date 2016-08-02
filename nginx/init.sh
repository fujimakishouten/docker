#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



ln --symbolic /data/conf/nginx.conf /etc/nginx
ln --symbolic /data/conf/default /etc/nginx/sites-available/default


if [ ! -d /data/log ]; then
    mkdir /data/log
fi

if [ ! -d /data/www ]; then
    mkdir /data/www
fi

ln --symbolic /data/log /var/log/nginx
ln --symbolic /data/www /var


/usr/sbin/nginx -g "daemon off;"



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

