#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



# Install modules
cd /var/lib/nodejs
npm install --global eslint istanbul mocha pm2
npm install
pm2 start --no-daemon server.js -- -c ./config/local



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:
