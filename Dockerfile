FROM lsiobase/alpine:3.17

# Add configuration files
COPY root /

ENV \
    TZ=UTC \
    PUID= \
    PGID=

# Set up
RUN \
    echo "**** Install required packages ****" && \
    apk add --no-cache \
        inotify-tools \
        logrotate \
        openssh-client \
        rsnapshot \
        mariadb-client \
        screen

VOLUME ["/config", "/backup"]

