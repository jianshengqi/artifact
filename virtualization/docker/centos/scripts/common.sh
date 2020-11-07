#!/bin/sh -eux

dnf groupinstall -y "Development Tools"
dnf install -y vim
dnf install -y dstat
dnf install -y wget
dnf install -y dos2unix
dnf install -y nmap