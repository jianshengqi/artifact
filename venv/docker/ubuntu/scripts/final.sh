#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

tee -a /root/.bashrc <<-'EOF'

# reload system profile
. /etc/profile
EOF

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base