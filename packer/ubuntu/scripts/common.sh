#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y

apt-get install -y dos2unix
apt-get install -y jq