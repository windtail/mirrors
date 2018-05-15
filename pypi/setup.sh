#!/bin/bash

bandersnatch mirror 2> /dev/null  # generate default config file

set -e

sed -i -e "s#/srv/pypi#/pypi#" -e "s#https://pypi.python.org#${UPSTREAM}#" /etc/bandersnatch.conf

exec "$@"
