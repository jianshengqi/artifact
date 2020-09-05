#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y curl git

tee -a /etc/profile <<-'EOF'
export GOROOT=/usr/local/go
export GOPATH=${GOROOT}/mylib
export PATH=${GOPATH}/bin:${GOROOT}/bin:${PATH}
export GOPROXY=https://goproxy.cn
export GO111MODULE=off
EOF

. /etc/profile

go=https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
curl -o go.tgz ${go}
tar xzf go.tgz -C /usr/local
go get -u github.com/jteeuwen/go-bindata/...
mv $GOPATH/bin/go-bindata /usr/local/bin

rm -f go.tgz
