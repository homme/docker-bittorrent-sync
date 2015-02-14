# BitTorrent Sync docker image

A docker image with [BitTorrent Sync][btsync] installed based on [Ubuntu 14.04.1][ubuntu].

## Usage

```
mkdir -p $HOME/.btsync
docker run -d --name btsync -p 8888:8888 -p 55555:55555 \
       -v $HOME/.btsync:/btsync/sync -e SYNC_NAME="My Home Sync" \
       menski/bittorrent-sync
```

## Ports

 - `55555` BitTorrent Sync server
 - `8888` web gui

## Files

 - `/btsync/btsync.conf` configuration file
 - `/btsync/sync/` sync root directory

## Environment Variables

 - `SYNC_NAME` the sync device name


[btsync]: http://www.getsync.com/
[ubuntu]: https://registry.hub.docker.com/_/ubuntu/
