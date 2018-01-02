## Forked from: https://github.com/plexinc/pms-docker

# Information:
More information can be found here: https://github.com/plexinc/pms-docker

# This fork adds the possibility to mount a rclone mount to plex directly
It is recommended that fuse is installed on docker host.
Run example:
```
docker run \
-d \
--name plex \
--network=host \
--cap-add SYS_ADMIN \
--privileged \
--device /dev/fuse \
-e TZ="<timezone>" \
-e PLEX_CLAIM="<claimToken>" \
-e RCLONE_CONFIG_MOUNT="<path we would like to mount from rclone config>" \
-v <path/to/plex/database>:/config \
-v <path/to/transcode/temp>:/transcode \
-p 32400:32400/tcp \
-p 3005:3005/tcp \
-p 8324:8324/tcp \
-p 32469:32469/tcp \
-p 1900:1900/udp \
-p 32410:32410/udp \
-p 32412:32412/udp \
-p 32413:32413/udp \
-p 32414:32414/udp \
robostlund/plex-rclone:latest
```
