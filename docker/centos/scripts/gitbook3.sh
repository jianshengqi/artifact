#!/bin/sh -eux

yum install -y npm

VERSION=3.2.1
npm config set registry https://registry.npm.taobao.org
npm install --global gitbook-cli
gitbook fetch ${VERSION}
npm cache clear
rm -rf /tmp
yum clean all