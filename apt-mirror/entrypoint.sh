#!/bin/sh

set -e

CONFIG=/mirror/mirror.list

cat > $CONFIG <<EOF
set base_path /mirror
set nthreads  20
set _tilde 0
EOF

for deb in $(printenv | grep ^DEBLINE | cut -d= -f1) ; do
    echo "Found $deb"
    eval deb=\$$deb
    echo $deb >> $CONFIG
done

exec "$@"
