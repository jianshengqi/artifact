#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y software-properties-common