FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

RUN set -eux && chmod +x *.sh

RUN set -eux && ./test.sh

RUN set -eux && ./env.sh

RUN set -eux && rm -rf *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]