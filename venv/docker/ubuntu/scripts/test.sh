#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y software-properties-common

add-apt-repository -y ppa:sthima/oss
apt-get update -y --allow-unauthenticated
apt-get install -y libstapsdt0 libstapsdt-dev

apt-get install -y libelf1 libelf-dev