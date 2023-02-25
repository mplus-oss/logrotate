#!/bin/sh

envsubst < /etc/logrotate.conf.template > /etc/logrotate.conf
chmod 644 /etc/logrotate.conf
exec cron -n