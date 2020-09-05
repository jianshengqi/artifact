#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y \
            build-essential \
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
            llvm \
            clang \
            silversearcher-ag \
            dumb-init

apt-get autoremove -yqq --purge
apt-get clean

rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base
