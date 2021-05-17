#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y \
            gcc \
            g++ \
            make

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base
