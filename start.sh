#!/usr/bin/dumb-init /bin/sh
set -e

if [ "$PHP_XDEBUG" = true ]; then php5enmod xdebug; fi

exec /usr/bin/consul-template -config=/etc/consul-template.d
