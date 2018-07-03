#!/bin/bash

set -e

cat > /etc/apt/mirror.list <<EOF
set base_path /mirror
set nthreads  20
set _tilde 0
EOF

for deb in $(printenv | grep ^DEBLINE | cut -d= -f1) ; do
    echo "${!deb}" >> /etc/apt/mirror.list
done

cd /keys
for k in $(ls /keys) ; do
    apt-key add $k > /dev/null
done

exec "$@"
