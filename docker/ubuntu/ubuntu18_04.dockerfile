FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

RUN set -ex \
        && chmod +x *.sh \
        && ./all.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]