#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y gnupg gnupg1 gnupg2 lsb-core
apt-get install -y bpfcc-tools
apt-get install -y build-essential git make libelf-dev libbfd-dev clang strace tar gcc-multilib kmod

SRC=/kernel-src
git clone --depth 1 git://kernel.ubuntu.com/ubuntu/ubuntu-focal.git ${SRC}
rm -rf ${SRC}/.git
cd ${SRC}/tools/lib/bpf
make && make install prefix=/usr/local
cd ${SRC}/tools/bpf/bpftool
make && make install prefix=/usr/local
mv /usr/local/lib64/libbpf.* /lib/x86_64-linux-gnu/

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base