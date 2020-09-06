FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

RUN set -ex \
        && chmod +x *.sh \
        && ./common.sh \
        && ./bcc.sh \
        && ./ats8.sh \
        && ./go.sh \
        && ./bionic.sh \
        && rm -rf *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]