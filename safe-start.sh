#!/bin/sh

ODOO_LOGFILE=$1
if [[ ! -f "$ODOO_LOGFILE" ]]; then
    touch "$ODOO_LOGFILE"
fi

cd /logs
tail -f "$ODOO_LOGFILE"
