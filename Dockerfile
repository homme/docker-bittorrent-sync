FROM ubuntu:14.04.1

ADD http://download.getsyncapp.com/endpoint/btsync/os/linux-x64/track/stable /tmp/btsync.tar.gz

RUN tar xOzf /tmp/btsync.tar.gz btsync > /usr/bin/btsync && \
    chmod +x /usr/bin/btsync && \
    rm /tmp/btsync.tar.gz && \
    useradd -m -d /btsync btsync && \
    mkdir -p /btsync/sync

ADD btsync.conf /btsync/btsync.conf

RUN chown -R btsync:btsync /btsync

USER btsync

WORKDIR /btsync/sync

VOLUME /btsync/sync

EXPOSE 8888 55555

CMD ["/usr/bin/btsync", "--config", "/btsync/btsync.conf", "--nodaemon"]
