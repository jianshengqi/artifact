#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

./common.sh
./cpp.sh
./go.sh