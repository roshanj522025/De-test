#!/bin/bash

# Update packages
apt-get update && apt-get upgrade -y

# Install i3, VNC, tools (no keyring nonsense!)
apt-get install -y \
    i3 \
    i3status \
    dmenu \
    tigervnc-standalone-server \
    tigervnc-viewer \
    xterm \
    alacritty \
    firefox \
    novnc \
    websockify \
    net-tools \
    git \
    sudo

# Setup VNC
mkdir -p ~/.vnc
cat > ~/.vnc/xstartup << 'EOF'
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
xsetroot -solid "#2E3436"
exec i3
EOF
chmod +x ~/.vnc/xstartup

# Set password
echo "codespaces" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

echo "Done! VNC ready."
