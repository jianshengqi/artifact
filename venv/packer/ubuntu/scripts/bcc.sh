#!/bin/sh -eux

apt-get install -y build-essential git make libelf-dev clang strace tar bpfcc-tools linux-headers-$(uname -r) gcc-multilib