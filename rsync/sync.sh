#!/bin/sh

echo "/usr/bin/rsync $OPTIONS $UPSTREAM /mirror"
exec /usr/bin/rsync $OPTIONS $UPSTREAM /mirror
