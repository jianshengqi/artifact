#!/bin/sh -eux

yum install -y dnf dnf-utils
dnf install -y dnf-plugins-core redhat-lsb-core elfutils-libelf-devel