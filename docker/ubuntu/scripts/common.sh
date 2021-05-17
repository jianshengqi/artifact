#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y \
            binutils \
            net-tools \
            inetutils-ping \
            iproute2 \
            gawk  \
            git \
            unzip \
            dstat \
            jq \
            wget \
            curl \
            lrzsz \
            rsync \
            dos2unix \
            tree \
            dumb-init

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base
