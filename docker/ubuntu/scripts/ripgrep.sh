#!/usr/bin/env bash

set -eux

WORKDIR='/tmp/ripgrep'
if [ ! -d ${WORKDIR} ]; then
    mkdir -p ${WORKDIR}
fi

pushd ${WORKDIR}
curl --retry 3 -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
dpkg -i ripgrep_13.0.0_amd64.deb
rm -rf *.deb
popd
