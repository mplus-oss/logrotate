#!/bin/sh

ODOO_LOGFILE="/logs/${ODOO_LOGFILE/*\/}"

echo "INFO: Modify logrotate configuration."
envsubst < /etc/logrotate.conf.template > /etc/logrotate.conf
chmod 644 /etc/logrotate.conf

echo "INFO: Running Odoo Log in sidecar mode."
crond -n &
runuser -u odoo -- safe-start.sh '$ODOO_LOGFILE'
