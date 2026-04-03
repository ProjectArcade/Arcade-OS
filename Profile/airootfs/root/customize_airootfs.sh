#!/usr/bin/env bash
set -e
plymouth-set-default-theme -R arcade

SPLASH_SRC="/home/arcade/.local/share/plasma/look-and-feel/arcade-splash"
SPLASH_DST="/usr/share/plasma/look-and-feel/arcade-splash"

if [[ -d "$SPLASH_SRC" ]]; then
	rm -rf "$SPLASH_DST"
	mkdir -p "$(dirname "$SPLASH_DST")"
	cp -a "$SPLASH_SRC" "$SPLASH_DST"
fi

install -d -m 0755 /etc/xdg
cat > /etc/xdg/ksplashrc << 'EOF'
[KSplash]
Engine=KSplash
Theme=arcade-splash
EOF

install -d -m 0755 /home/arcade/.config
install -d -m 0755 /home/arcade/.local
cat > /home/arcade/.config/ksplashrc << 'EOF'
[KSplash]
Engine=KSplash
Theme=arcade-splash
EOF

chown -R arcade:arcade /home/arcade/.config /home/arcade/.local
