#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



# Logs directory
if [ ! -d /var/log/php7 ]; then
    mkdir /var/log/php7
fi

# Document root directory
if [ ! -d /var/www/html ]; then
    mkdir /var/www/html
fi

/usr/sbin/php-fpm7 --nodaemonize



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

