FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN set -ex \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
        pkg-config \
        libxml2-dev \
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
        freetds-bin \
        rsync \
        netcat \
        locales \
        gnupg2 \
        dos2unix \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

ARG GOROOT=/usr/local/go
ENV GOROOT=${GOROOT}
ENV GOPATH=${GOROOT}/mylib
ENV PATH=${GOPATH}/bin:${GOROOT}/bin:$PATH
ARG GOPROXY=https://goproxy.cn
ENV GOPROXY=${GOPROXY}
ARG GO111MODULE=off
ENV GO111MODULE=${GO111MODULE}
RUN set -ex \
    && curl -o go.tgz https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz \
    && tar xzvf go.tgz -C /usr/local \
    && rm -f go.tgz \
    && go get -u github.com/jteeuwen/go-bindata/... \
    && mv $GOPATH/bin/go-bindata /usr/local/bin


ARG HEADERS=linux-headers-4.18.0-16-generic
RUN set -ex \
    && apt-get update \
    && apt-get install -y \
        llvm \
        clang \
        git \
        golang \
        ${HEADERS}

#http://www-eu.apache.org/dist/trafficserver/trafficserver-8.0.8.tar.bz2
ARG ats=trafficserver-8.0.8.tar.bz2
COPY ${ats} /tmp
RUN set -x \
 && apt-get update -y \
 && apt-get install -y \
        curl \
        locales \
        build-essential \
        bzip2 \
        libssl-dev \
        libxml2 \
        libxml2-dev \
        libpcre3 \
        libpcre3-dev \
        tcl \
        tcl-dev \
        libboost-dev \
        dumb-init \
 && locale-gen en_US.UTF-8 \
 && export LANGUAGE=en_US.UTF-8 \
 && export LANG=en_US.UTF-8 \
 && export LC_ALL=en_US.UTF-8 \
 && locale-gen en_US.UTF-8 \
 && dpkg-reconfigure locales \
 && mkdir /tmp/trafficserver \
 && cd /tmp/trafficserver \
 && cat /tmp/${ats} | tar -xj --strip-components 1 \
 && ./configure --prefix=/opt/ats \
 && make install \
 && apt-get clean \
 && rm -rf /tmp/* /var/lib/apt/lists/*

COPY wrk /usr/local/bin
RUN set -ex \
    && chmod +x /usr/local/bin/wrk

ENTRYPOINT ["dumb-init"]