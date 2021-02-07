FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

RUN set -eux \
        && chmod +x *.sh \
        && ./common.sh \
        && ./cpp.sh \
        && ./vim.sh \
        && ./go.sh \
        && ./protoc.sh \
        && ./tmux.sh \
        && ./ripgrep.sh \
        && ./env.sh \
        && rm -rf *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]