# Base image using Alpine Linux with S6 overlay for process supervision
FROM lsiobase/alpine:3.21

# Copy configuration files from local root directory to container
# This includes service configurations and log rotation settings
COPY files /root/

# Environment variables for container configuration
# TZ: Timezone setting (defaults to UTC)
# PUID/PGID: User and Group IDs for running processes
ENV \
    TZ=UTC \
    PUID= \
    PGID=

# Install required packages with explanations
RUN \
    echo "**** Install required packages ****" && \
    apk add --no-cache \
        # File system monitoring for backup triggers
        inotify-tools \
        # Log rotation utility
        logrotate \
        # SSH client for remote backup operations
        openssh-client \
        # Core backup utility
        rsnapshot \
        # Database client for backup operations
        mariadb-client \
        # Version control for backup scripts and configurations
        git \
        # Terminal multiplexer for backup operations
        screen

# Define volumes for persistent storage
# /config: Contains rsnapshot configuration files and SSH keys
# /backup: Root directory for backup storage
VOLUME ["/config", "/backup"]
