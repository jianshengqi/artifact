#!/bin/sh -eux

doge='This system is built by the doge'

if [ -d /etc/update-motd.d ]; then
    MOTD_CONFIG='/etc/update-motd.d/99-doge'

    cat >> "$MOTD_CONFIG" <<DOGE
#!/bin/sh

cat <<'EOF'
$doge
EOF
DOGE

    chmod 0755 "$MOTD_CONFIG"
else
    echo "$doge" >> /etc/motd
fi
