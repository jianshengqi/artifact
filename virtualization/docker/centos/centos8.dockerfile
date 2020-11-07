FROM centos:8

WORKDIR /lab

COPY scripts .

ENV PS1='[docker-\u@\h \W]\$'

RUN set -eux \
        && chmod +x *.sh \
        && ./common.sh \
        && ./cpp.sh \
        && ./go.sh \
        && ./bcc.sh \
        && ./protoc.sh \
        && ./final.sh \
        && rm -rf *.sh