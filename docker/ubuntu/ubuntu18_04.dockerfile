FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN set -ex \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y software-properties-common \
    && apt-add-repository --yes --update ppa:ansible/ansible \
    && apt-get install -y ansible \
        vim \
        tmux \
        git \
        dumb-init \
        silversearcher-ag \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

ENTRYPOINT ["/usr/bin/dumb-init", "--"]