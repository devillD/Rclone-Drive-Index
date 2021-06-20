FROM devilldon/rclone:beta
WORKDIR /R-SERVER
RUN mkdir /.config/rclone
#COPY start.sh /start.sh
#RUN chmod +x /start.sh
EXPOSE 8080
CMD wget $CONFIG_IN_URL -O '/.config/rclone/rclone.conf' && \
    wget $AUTH_FILE_URL -O authfile && \
    rclone serve http $CLOUDNAME: --addr :$PORT --buffer-size 256M \
                                                --dir-cache-time 12h \
                                                --vfs-read-chunk-size 256M \
                                                --vfs-read-chunk-size-limit 2G \
                                                --vfs-cache-mode writes \
                                                --htpasswd authfile
