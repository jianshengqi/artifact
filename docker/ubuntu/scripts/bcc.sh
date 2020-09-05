#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y gnupg gnupg1 gnupg2 lsb-core
apt-get install -y bpfcc-tools linux-headers-$(uname -r)
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4052245BD4284CDD
echo "deb https://repo.iovisor.org/apt/$(lsb_release -cs) $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/iovisor.list
apt-get update -y
apt-get install -y \
            bcc-tools \
            auditd \
            libelf1 \
            libbcc-examples \
            linux-headers-$(uname -r)

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base

bcc=https://codeload.github.com/iovisor/bcc/tar.gz/v0.11.0
curl -L -o bcc.tgz ${bcc}
mkdir -p /iovisior/bcc && tar -xz -C /iovisior/bcc -f bcc.tgz --strip-components 1 && rm -f bcc.tgz
