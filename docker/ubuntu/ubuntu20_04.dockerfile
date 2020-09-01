FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

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
        llvm \
        clang \
        lsb-core \
        make \
        automake \
        autoconf \
        vim \
        gawk  \
        tmux \
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
        python3-pip \
        freetds-bin \
        default-libmysqlclient-dev \
        rsync \
        netcat \
        locales \
        gnupg2 \
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

# install go
RUN set -ex \
    && curl -o go.tgz https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz \
    && tar xzvf go.tgz -C /usr/local \
    && rm -f go.tgz
ARG GOROOT=/usr/local/go
ENV GOROOT=${GOROOT}
ENV GOPATH=${GOROOT}/mylib
ENV PATH=${GOPATH}/bin:${GOROOT}/bin:$PATH
ARG GOPROXY=https://goproxy.cn
ENV GOPROXY=${GOPROXY}
ARG GO111MODULE=on
ENV GO111MODULE=${GO111MODULE}

WORKDIR /lab

ENTRYPOINT ["/usr/bin/dumb-init", "--"]