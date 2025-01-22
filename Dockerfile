FROM docker.io/library/alpine:edge
LABEL org.opencontainers.image.authors="Syahrial Agni Prasetya <syahrial@mplus.software>;Ikramullah <ikramullah@mplus.software>"
LABEL org.opencontainers.image.licenses="GPL-2.0"
LABEL org.opencontainers.image.vendor="M+ Software"
LABEL org.opencontainers.image.title="Logrotate"
LABEL org.opencontainers.image.description="Logrotate in Docker (for Odoo)"

WORKDIR /var/log/odoo
ENV RETENTION_DAYS=30
ENV ODOO_LOGFILE=odoo.log

RUN set -ex; \
    echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories; \
    apk add --no-cache logrotate cronie envsubst;

COPY logrotate.conf.template /etc/logrotate.conf.template
COPY ./entrypoint.sh /entrypoint.sh

STOPSIGNAL SIGINT
ENTRYPOINT [ "/entrypoint.sh" ]
