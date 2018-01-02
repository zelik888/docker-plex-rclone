#!/bin/bash
docker run -dt \
    --name plex \
    --hostname plex \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    --privileged \
    -e RCLONE_CONFIG_MOUNT="<my rclone config mount>"  \
    -p 32400:32400 \
    -v /tmp/test/config:/config \
    -v /tmp/test/transcode:/transcode \
    robostlund/plex-rclone:latest
