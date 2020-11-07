#!/bin/sh -eux

dnf groupinstall -y "Development Tools"
dnf install -y vim
dnf install -y dos2unix
