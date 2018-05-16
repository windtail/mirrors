#!/bin/bash

set -e

while true; do
    echo "[$(date)] Starting rsync"
    rsync -avz $UPSTREAM /elpa
    echo "[$(date)] Completed"
    echo "[$(date)] Sleeping $RESYNC_PERIOD to execute rsync again ======"
    sleep "$RESYNC_PERIOD"
done
