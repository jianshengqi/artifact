#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y gnupg gnupg1 gnupg2 lsb-core
apt-get install -y \
            bison \
            build-essential \
            cmake \
            flex \
            git \
            libedit-dev \
            libllvm7 \
            llvm-7-dev \
            libclang-7-dev \
            python \
            zlib1g-dev \
            libelf-dev \
            libfl-dev

git clone https://github.com/iovisor/bcc.git
mkdir bcc/build; cd bcc/build
cmake ..
make
make install
cmake -DPYTHON_CMD=python3 .. # build python3 binding
pushd src/python/
make
make install
popd
