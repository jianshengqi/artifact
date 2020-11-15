FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

RUN set -eux \
        && chmod +x *.sh \
        && ./common.sh \
        && ./ats8.sh \
        && ./go.sh \
        && ./protoc.sh \
        && ./wrk.sh \
        && ./tmux.sh \
        && ./ps1.sh \
        && ./final.sh \
        && rm -rf *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]