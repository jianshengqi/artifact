FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

# COPY sources.list /etc/apt/sources.list
COPY scripts .

RUN set -ex \
        && chmod +x *.sh \
        && ./all.sh

# ENTRYPOINT ["/usr/bin/dumb-init", "--"]