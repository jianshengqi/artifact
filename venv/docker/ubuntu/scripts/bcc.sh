#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y gnupg gnupg1 gnupg2 lsb-core
apt-get install -y bpfcc-tools
apt-get install -y linux-headers-$(uname -r)
apt-get install -y build-essential git make libelf-dev clang strace tar gcc-multilib