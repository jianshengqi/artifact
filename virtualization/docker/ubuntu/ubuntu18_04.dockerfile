FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

RUN set -eux \
        && chmod +x *.sh \
        && ./common.sh \
        && ./bcc.sh \
        && ./go.sh \
        && ./bionic.sh \
        && ./protoc.sh \
        && ./final.sh \
        && rm -rf *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]