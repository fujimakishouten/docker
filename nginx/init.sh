#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



# PID directory
if [ ! -d /run/nginx ]; then
    mkdir /run/nginx
fi

chown -R nginx:nginx /run/nginx
/usr/sbin/nginx -g "daemon off;"



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

