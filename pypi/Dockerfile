From python:3

MAINTAINER ljj ljj@knd.com.cn

ENV UPSTREAM https://pypi.python.org
ENV RESYNC_PERIOD 12h

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r https://bitbucket.org/pypa/bandersnatch/raw/stable/requirements.txt
RUN mkdir -p /pypi

COPY setup.sh /setup.sh
COPY sync.sh /sync.sh

VOLUME ["/pypi"]

ENTRYPOINT ["/bin/bash", "/setup.sh"]
CMD ["/bin/bash", "/sync.sh"]
