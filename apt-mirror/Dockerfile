From debian:stretch

MAINTAINER ljj ljj@knd.com.cn

ENV DEBIAN_FRONTEND noninteractive
ENV UPSTREAM 'http://mirrors.tuna.tsinghua.edu.cn/debian'
ENV RELEASE stretch
ENV ARCH amd64
ENV RESYNC_PERIOD 12h

RUN sed -i "s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/" /etc/apt/sources.list ; \
    apt-get clean ; \
    apt-get update ; \
    apt-get install --no-install-recommends -y apt-mirror ; \
    apt-get autoclean ; \
    rm -rf /var/lib/apt/lists/* ; \
    mkdir -p /apt-mirror

COPY setup.sh /setup.sh
COPY sync.sh /sync.sh
COPY sync-forever.sh /sync-forever.sh

VOLUME ["/apt-mirror"]

ENTRYPOINT ["/bin/bash", "/setup.sh"]
CMD ["/bin/bash", "/sync-forever.sh"]
