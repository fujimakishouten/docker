#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



ln --symbolic /data/conf/php.ini /etc/php5/fpm
ln --symbolic /data/conf/php-fpm.conf /etc/php5/fpm
ln --symbolic /data/conf/pool.d /etc/php5/fpm
ln --symbolic /data/www /var

/usr/sbin/php5-fpm --nodaemonize



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

