#!/bin/bash
docker run -dt \
    --name plex \
    --hostname plex \
    -p 32400:32400 \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    -e RCLONE_CONFIG_MOUNT="<my rclone config mount>"  \
    -v /tmp/test/config:/config \
    -v /tmp/test/transcode:/transcode \
    robostlund/plex-rclone:latest
