FROM debian:wheezy

ADD https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz /tmp/btsync.tar.gz

RUN tar xOzf /tmp/btsync.tar.gz btsync > /usr/bin/btsync && \
    chmod +x /usr/bin/btsync && \
    rm /tmp/btsync.tar.gz && \
    useradd -m -d /var/local/btsync btsync && \
    mkdir -p /var/local/btsync /sync

RUN chown -R btsync:btsync /var/local/btsync /sync
ADD btsync.conf /etc/btsync/btsync.conf

#USER btsync

WORKDIR /var/local/btsync
VOLUME /var/local/btsync

EXPOSE 8888 55555

CMD ["/usr/bin/btsync", "--config", "/etc/btsync/btsync.conf", "--nodaemon"]
