#!/bin/sh

ODOO_LOGFILE="/var/log/odoo/${ODOO_LOGFILE/*\/}"

envsubst < /etc/logrotate.conf.template > /etc/logrotate.conf
chmod 644 /etc/logrotate.conf

if [[ ! -f "$ODOO_LOGFILE" ]]; then
    touch "$ODOO_LOGFILE"
fi

echo "INFO: Running Odoo Log in sidecar mode."
crond -n &
tail -f "$ODOO_LOGFILE"
