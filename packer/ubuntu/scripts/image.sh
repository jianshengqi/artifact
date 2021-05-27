#!/bin/sh -eux
export DEBIAN_FRONTEND=noninteractive

# Update the package list
apt-get -y update;

# Upgrade kernel to 5.8
# apt-cache search linux-image
apt-get install -y linux-image-5.8.0-28-generic

reboot
