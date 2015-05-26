# BitTorrent Sync docker image

A docker image with [BitTorrent Sync][btsync] installed based on [Debian Wheezy][debian].

This image is adapted from
[menski/bittorrent-sync](https://registry.hub.docker.com/u/menski/bittorrent-sync/).

## Usage

* Build the image:
```
docker build -t homme/btsync https://github.com/homme/docker-bittorrent-sync.git
```

* Create a config file and optionally edit it:
```
mkdir -p $HOME/.btsync/etc
docker run -p 8888:8888 -p 55555:55555 --rm homme/btsync cat /etc/btsync/btsync.conf > $HOME/.btsync/etc/btsync.conf
```

* Run a container:
```
mkdir -p $HOME/.btsync/sync
docker run -d --name btsync -p 8888:8888 -p 55555:55555 \
       -v $HOME/.btsync/sync:/var/local/btsync \
       -v $HOME/.btsync/etc:/etc/btsync
       homme/btsync
```

## Ports

 - `55555` BitTorrent Sync server
 - `8888` web gui

## Files

 - `/etc/btsync/btsync.conf` configuration file
 - `/var/local/btsync` sync root directory

[btsync]: http://www.getsync.com/
[debian]: https://registry.hub.docker.com/_/debian/
