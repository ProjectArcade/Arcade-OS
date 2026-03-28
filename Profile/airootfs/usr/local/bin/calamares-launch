#!/usr/bin/env bash

DIR="/etc/calamares"
KERNEL=$(uname -r)

# Fix unpackfs if using copytoram
if [[ -d "/run/archiso/copytoram" ]]; then
    sed -i 's|/run/archiso/bootmnt/.*/airootfs.sfs|/run/archiso/copytoram/airootfs.sfs|g' "$DIR/modules/unpackfs.conf"
    sed -i "s|/run/archiso/bootmnt/.*/vmlinuz-linux|/usr/lib/modules/$KERNEL/vmlinuz|g" "$DIR/modules/unpackfs.conf"
fi

# Launch installer
pkexec calamares -d