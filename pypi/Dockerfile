From python:3-alpine

MAINTAINER "ljj <ljj@knd.com.cn>"

ENV UPSTREAM https://pypi.python.org

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r https://bitbucket.org/pypa/bandersnatch/raw/stable/requirements.txt
RUN mkdir -p /mirror

COPY entrypoint.sh /entrypoint.sh

VOLUME ["/mirror"]

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["/usr/local/bin/bandersnatch", "mirror"]
