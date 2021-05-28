#!/bin/sh -eux

motd="This system is built by sqjian in $(date '+%Y-%m-%d %H:%M:%S')"

if [ -d /etc/update-motd.d ]; then
    MOTD_CONFIG='/etc/update-motd.d/99-motd'

    cat >> "$MOTD_CONFIG" <<MOTD
#!/bin/sh

cat <<'EOF'
$motd

EOF
MOTD

    chmod 0755 "$MOTD_CONFIG"
else
    echo "$motd" >> /etc/motd
fi
