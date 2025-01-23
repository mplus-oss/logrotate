FROM docker.io/library/alpine:edge
LABEL org.opencontainers.image.authors="Syahrial Agni Prasetya <syahrial@mplus.software>;Ikramullah <ikramullah@mplus.software>"
LABEL org.opencontainers.image.licenses="GPL-2.0"
LABEL org.opencontainers.image.vendor="M+ Software"
LABEL org.opencontainers.image.title="Logrotate"
LABEL org.opencontainers.image.description="Logrotate in Docker (for Odoo)"

ENV RETENTION_DAYS=30
ENV ODOO_LOGFILE=/logs/odoo.log

RUN set -ex; \
    echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories; \
    apk add --no-cache logrotate cronie envsubst htop;

COPY logrotate.conf.template /etc/logrotate.conf.template
COPY --chmod=755 ./entrypoint.sh /usr/bin/entrypoint.sh
COPY --chmod=755 ./safe-start.sh /usr/bin/safe-start.sh

ARG UID=1001
RUN adduser -u $UID -D odoo; \
    mkdir /logs; \
    chown odoo:odoo /logs

WORKDIR /logs
STOPSIGNAL SIGINT
CMD [ "entrypoint.sh" ]
