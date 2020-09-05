#!/bin/sh -eux

yum groupinstall -y "Development Tools"
yum install -y vim
yum install -y dos2unix
