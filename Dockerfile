FROM devilldon/rclone:beta
EXPOSE 8080
CMD rclone serve http $CLOUDNAME: --addr :$PORT --buffer-size 256M \
                                                --dir-cache-time 12h \
                                                --vfs-read-chunk-size 256M \
                                                --vfs-read-chunk-size-limit 2G \
                                                --vfs-cache-mode writes \
                                                --htpasswd authfile
