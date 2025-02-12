#!/bin/sh

ODOO_LOGFILE=$1
if [[ ! -f "$ODOO_LOGFILE" ]]; then
    touch "$ODOO_LOGFILE"
fi

tail -f "$ODOO_LOGFILE"
