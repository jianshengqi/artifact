#!/bin/sh -eux

yum groupinstall -y "Development Tools"
yum install -y vim
yum install -y dstat
yum install -y wget
yum install -y dos2unix
yum install -y nmap