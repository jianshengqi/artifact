#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y \
            build-essential \
            binutils \
            net-tools \
            inetutils-ping \
            iproute2 \
            gcc \
            g++ \
            gdb \
            make \
            automake \
            autoconf \
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
            rsync \
            netcat \
            dos2unix \
            llvm \
            clang \
            silversearcher-ag \
            dumb-init \
            nmap