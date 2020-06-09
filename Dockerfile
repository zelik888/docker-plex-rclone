FROM pms-docker

ENV RCLONE_VERSION="1.44"

RUN \
# Update and get dependencies
    apt-get update && \
    apt-get install -y fuse libfuse-dev

RUN wget https://github.com/ncw/rclone/releases/download/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip -O /tmp/rclone-v${RCLONE_VERSION}-linux-amd64.zip && \
    unzip /tmp/rclone-v${RCLONE_VERSION}-linux-amd64.zip -d /tmp/ && \
    mv /tmp/rclone-v${RCLONE_VERSION}-linux-amd64/rclone /usr/sbin/rclone && \
    chmod 755 /usr/sbin/rclone && \
    chown root:root /usr/sbin/rclone && \
    rm -rf /tmp/rclone-v${RCLONE_VERSION}-linux-amd64 && \
    rm -f /tmp/rclone-v${RCLONE_VERSION}-linux-amd64.zip && \

# Add user and groups
    groupadd fuse -g 107 && \
    useradd -U -d /config -s /bin/false plex && \
    usermod -G users plex && \
    usermod -aG fuse plex && \

# Allow others to fuse
  sed -i 's/#user_allow_other/user_allow_other/' /etc/fuse.conf && \

# Cleanup
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*