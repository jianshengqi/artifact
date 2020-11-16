#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y gnupg gnupg1 gnupg2 lsb-core
apt-get install -y bpfcc-tools
# apt-get install -y linux-headers-$(uname -r)
apt-get install -y build-essential git make libelf-dev clang strace tar gcc-multilib kmod

if [ ! -d "/kernel-src" ]; then
  mkdir /kernel-src
fi

wget -c https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.0.9.tar.gz -O - | tar -xz --strip-components 1 -C /kernel-src
cd /kernel-src/tools/lib/bpf
make && make install prefix=/usr/local
mv /usr/local/lib64/libbpf.* /lib/x86_64-linux-gnu/