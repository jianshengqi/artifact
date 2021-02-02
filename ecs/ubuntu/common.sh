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
            netcat \
            dos2unix \
            silversearcher-ag \
            expect \
            dumb-init