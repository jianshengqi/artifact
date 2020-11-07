#!/bin/sh -eux

mkdir /tmp
TMPDIR=/tmp
yum install -y dnf
dnf install -y dnf-plugins-core