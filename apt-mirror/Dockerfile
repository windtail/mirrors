From debian:stretch

MAINTAINER "ljj <ljj@knd.com.cn>"

ENV DEBIAN_FRONTEND noninteractive

RUN set -e ; \
    sed -i s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/ /etc/apt/sources.list ; \
    apt-get update ; \
    apt-get install -y --no-install-recommends \
            apt-transport-https \
            ca-certificates \
            gnupg2 \
            software-properties-common \
            perl \
            apt-mirror ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* ; \
    mkdir -p /mirror ; \
    mkdir -p /keys

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/mirror"]
VOLUME ["/keys"]

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

CMD ["/usr/bin/apt-mirror"]
