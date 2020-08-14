FROM node:6-slim

# base environment
RUN set -ex \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        software-properties-common \
        build-essential \
        freetds-dev \
        libkrb5-dev \
        libsasl2-dev \
        libssl-dev \
        libffi-dev \
        libpq-dev \
        binutils \
        net-tools \
        inetutils-ping \
        iproute2 \
        gcc \
        g++ \
        gdb \
        lsb-core \
        make \
        automake \
        autoconf \
        vim \
        gawk  \
        git \
        unzip \
        dstat \
        jq \
        htop \
        wget \
        curl \
        axel \
        lrzsz \
        graphviz \
        dumb-init \
        python-pip \
        python3-pip \
        freetds-bin \
        default-libmysqlclient-dev \
        rsync \
        netcat \
        locales \
        procps \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

ARG VERSION=3.2.1
RUN set -ex \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install --global gitbook-cli \
    && gitbook fetch ${VERSION} \
    && npm cache clear \
    && rm -rf /tmp/*

WORKDIR /gitbook

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
