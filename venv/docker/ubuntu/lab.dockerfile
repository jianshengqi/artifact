FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

RUN set -eux && chmod +x *.sh

RUN set -eux && ./common.sh

RUN set -eux && ./cpp.sh

RUN set -eux && ./vim.sh

RUN set -eux && ./ats8.sh

RUN set -eux && ./bcc.sh

RUN set -eux && ./go.sh

RUN set -eux && ./protoc.sh

RUN set -eux && ./tmux.sh

RUN set -eux && ./ps1.sh

RUN set -eux && ./alias.sh

RUN set -eux && ./env.sh

RUN set -eux && rm -rf *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]