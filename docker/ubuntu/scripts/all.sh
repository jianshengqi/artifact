#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

./common.sh
./bcc.sh
./ats8.sh
./gitbook3.sh
./go.sh