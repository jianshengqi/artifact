#!/bin/sh -eux

yum install -y npm

npm config set registry https://registry.npm.taobao.org
npm install --global gitbook-cli
gitbook fetch ${VERSION}
npm cache clear
rm -rf /tmp
yum clean all