From alpine:latest

MAINTAINER "ljj <ljj@knd.com.cn>"

ENV UPSTREAM='rsync://elpa.emacs-china.org/elpa/'
ENV OPTIONS='-avz'

RUN set -e ; \
    sed -i s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/ /etc/apk/repositories ; \
    apk update ; \
    apk add --no-cache rsync ; \
    mkdir -p /mirror

COPY sync.sh /sync.sh

VOLUME ["/mirror"]

CMD ["/bin/sh", "/sync.sh"]
