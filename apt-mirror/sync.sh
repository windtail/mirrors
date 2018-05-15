#!/bin/bash

set -e

while true; do
    echo "[$(date)] Starting apt-mirror"
    apt-mirror
    echo "[$(date)] Completed"
    echo "[$(date)] Sleeping $RESYNC_PERIOD to execute apt-mirror again ======"
    sleep "$RESYNC_PERIOD"
done
