FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

ENV PS1='[docker-\u@\h \W]\$'

RUN set -eux \
        && chmod +x *.sh \
        && ./common.sh \
        && ./go.sh \
        && ./protoc.sh \
        && ./final.sh \
        && rm -rf *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]