#!/bin/sh

bandersnatch mirror 2> /dev/null  # generate default config file

set -e

sed -i -e "s#/srv/pypi#/mirror#" -e "s#https://pypi.python.org#${UPSTREAM}#" /etc/bandersnatch.conf

exec "$@"
