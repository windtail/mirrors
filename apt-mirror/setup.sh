#!/bin/bash

set -e

cat > /etc/apt/mirror.list <<EOF
set base_path /apt-mirror
set nthreads  20
set _tilde 0
deb-$ARCH $UPSTREAM $RELEASE main contrib non-free main/debian-installer contrib/debian-installer non-free/debian-installer
EOF

exec "$@"
