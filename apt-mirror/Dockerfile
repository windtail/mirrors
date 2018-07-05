From alpine:latest

MAINTAINER "ljj <ljj@knd.com.cn>"

ARG ALPINE_MIRROR=mirrors.aliyun.com

RUN set -e ; \
    sed -i s/dl-cdn.alpinelinux.org/$ALPINE_MIRROR/ /etc/apk/repositories ; \
    apk update ; \
    apk add --no-cache perl wget ; \
    wget -q https://raw.githubusercontent.com/apt-mirror/apt-mirror/master/apt-mirror -O /usr/bin/apt-mirror ; \
    chmod a+x /usr/bin/apt-mirror ; \
    mkdir -p /mirror

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/mirror"]

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["/usr/bin/apt-mirror", "/mirror/mirror.list"]
