FROM apt-mirror:latest

RUN apt-get update; \
    apt-get install -y \
            apt-transport-https \
            ca-certificates \
            curl \
            gnupg2 \
            software-properties-common; \
     curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - ; \
     apt-key fingerprint 0EBFCD88
