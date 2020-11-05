FROM centos:7

WORKDIR /lab

COPY scripts .

RUN set -ex \
        && chmod +x *.sh \
        && ./common.sh \
        && ./cpp.sh \
        && ./go.sh \
        && ./protoc.sh \
        && ./final.sh \
        && rm -rf *.sh