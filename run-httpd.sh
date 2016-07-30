#!/usr/bin/env bash

#setup config from environment variables.
php  /usr/bin/config.php "${MONGO_CONF}"

exec /usr/sbin/apachectl -D FOREGROUND