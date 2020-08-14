FROM ubuntu:18.04

# Never prompts the user for choices on installation/configuration of packages
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
        gnupg2 \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

# install bpfcc-tools
# https://github.com/iovisor/bcc/blob/master/INSTALL.md#ubuntu---binary
RUN set -ex \
    && apt-get update -y \
    && apt-get install -y bpfcc-tools linux-headers-$(uname -r) \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4052245BD4284CDD \
    && echo "deb https://repo.iovisor.org/apt/$(lsb_release -cs) $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/iovisor.list \
    && apt-get update -y \
    && apt-get install -y bcc-tools libbcc-examples linux-headers-$(uname -r)

# install go
RUN set -ex \
    && curl -o go.tgz https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz \
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