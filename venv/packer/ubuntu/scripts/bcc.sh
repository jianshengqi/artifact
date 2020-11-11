#!/bin/sh -eux

apt-get install -y build-essential git make libelf-dev clang strace tar bpfcc-tools gcc-multilib
apt-get install -y linux-headers-$(uname -r)