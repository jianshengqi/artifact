FROM centos:8

WORKDIR /lab

COPY scripts .

RUN set -ex \
        && chmod +x *.sh \
        && ./all.sh