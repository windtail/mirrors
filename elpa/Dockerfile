From debian:stretch

MAINTAINER ljj ljj@knd.com.cn

ENV DEBIAN_FRONTEND noninteractive
ENV UPSTREAM 'rsync://elpa.emacs-china.org/elpa/'
ENV RESYNC_PERIOD 12h

RUN sed -i "s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/" /etc/apt/sources.list ; \
    apt-get clean ; \
    apt-get update ; \
    apt-get install --no-install-recommends -y rsync ; \
    apt-get autoclean ; \
    rm -rf /var/lib/apt/lists/* ; \
    mkdir -p /elpa

COPY sync.sh /sync.sh
COPY sync-forever.sh /sync-forever.sh

VOLUME ["/elpa"]

CMD ["/bin/bash", "/sync-forever.sh"]
