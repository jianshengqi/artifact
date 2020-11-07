#!/bin/sh -eux

if [ ! -d "/tmp" ]; then
  mkdir /tmp
fi

TMPDIR=/tmp
yum install -y dnf
dnf install -y dnf-plugins-core