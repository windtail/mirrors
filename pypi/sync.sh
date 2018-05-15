#!/bin/bash

set -e

while true; do
    echo "[$(date)] Starting bandersnatch"
    bandersnatch mirror
    echo "[$(date)] Completed"
    echo "[$(date)] Sleeping $RESYNC_PERIOD to execute bandersnatch again ======"
    sleep "$RESYNC_PERIOD"
done
