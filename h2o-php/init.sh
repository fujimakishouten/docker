#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



# Document root directory
if [ ! -d /var/www/public ]; then
    mkdir /var/www/public
fi

/usr/bin/h2o -c /etc/h2o.conf



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

