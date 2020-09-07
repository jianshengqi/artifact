#!/bin/sh -eux

sqjian='This system is built by the sqjian'

if [ -d /etc/update-motd.d ]; then
    MOTD_CONFIG='/etc/update-motd.d/99-sqjian'

    cat >> "$MOTD_CONFIG" <<SQJIAN
#!/bin/sh

cat <<'EOF'
$sqjian
EOF
SQJIAN

    chmod 0755 "$MOTD_CONFIG"
else
    echo "$sqjian" >> /etc/motd
fi
