#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y

apt-get install -y tzdata
apt-get install -y npm

VERSION=3.2.1
npm config set registry https://registry.npm.taobao.org
npm install --global gitbook-cli
gitbook fetch ${VERSION}

apt-get autoremove -yqq --purge
apt-get clean
rm -rf /tmp