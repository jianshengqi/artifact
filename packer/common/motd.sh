#!/bin/sh -eux

motd1=$(cat <<- 'EOF'
    / \__
   (    @\___
   /         O
  /   (_____/
 /_____/   U
EOF
)

motd2=$(cat <<- EOF
This system is built by sqjian in $(date '+%Y-%m-%d %H:%M:%S')
EOF
)

motd=$(cat <<- EOF
$motd1

$motd2
EOF
)

if [ -d /etc/update-motd.d ]; then
    MOTD_CONFIG='/etc/update-motd.d/99-motd'

    cat > "$MOTD_CONFIG" <<MOTD
#!/bin/sh
cat <<'EOF'
$motd

EOF
MOTD

    chmod 0755 "$MOTD_CONFIG"
else
    echo "$motd" > /etc/motd
fi
