#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

GO="https://dl.google.com/go/go1.15.4.linux-amd64.tar.gz"
curl -o go.tgz $GO && tar xzf go.tgz -C /usr/local && rm -f go.tgz

cat >> /etc/profile.d/go.sh <<EOF
# shellcheck shell=sh

export GOROOT=/usr/local/go
export GOPATH=\${GOROOT}/mylib
export GOPROXY=https://goproxy.cn
export GO111MODULE=off

go_bin_path=\${GOPATH}/bin:\${GOROOT}/bin
if [ -n "\${PATH##*\${go_bin_path}}" -a -n "\${PATH##*\${go_bin_path}:*}" ]; then
    export PATH=\${PATH}:\${go_bin_path}
fi
EOF

. /etc/profile

# go-bindata
go get -u github.com/jteeuwen/go-bindata/...
mv $GOPATH/bin/go-bindata /usr/local/bin