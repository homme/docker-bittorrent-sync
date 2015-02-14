#!/bin/sh

if [ -n "$SYNC_NAME" ]; then
  sed -i "s/\"device_name\": \"[^\"]*\"/\"device_name\": \"${SYNC_NAME}\"/g" /btsync/btsync.conf
fi

exec /usr/bin/btsync --config /btsync/btsync.conf --nodaemon
