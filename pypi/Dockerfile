From python:3-alpine3.7

MAINTAINER ljj ljj@knd.com.cn

ENV UPSTREAM https://pypi.python.org
ENV RESYNC_PERIOD 12h

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r https://bitbucket.org/pypa/bandersnatch/raw/stable/requirements.txt
RUN mkdir -p /pypi

COPY setup.sh /setup.sh
COPY sync.sh /sync.sh
COPY sync-forever.sh /sync-forever.sh

VOLUME ["/pypi"]

ENTRYPOINT ["/bin/sh", "/setup.sh"]
CMD ["/bin/sh", "/sync-forever.sh"]
