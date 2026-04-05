#!/bin/bash

# Initialize pacman keys (required for Arch containers)
pacman-key --init
pacman-key --populate archlinux
pacman -Syu --noconfirm

# Install i3, VNC, and essentials (includes git and base-devel)
pacman -S --noconfirm \
    base-devel \
    git \
    i3-wm \
    i3status \
    dmenu \
    tigervnc \
    xorg-server \
    xorg-xinit \
    xorg-xsetroot \
    xorg-xrandr \
    xterm \
    alacritty \
    ttf-dejavu \
    ttf-liberation \
    firefox \
    novnc \
    python-websockify \
    net-tools

# Create VNC config directory
mkdir -p ~/.vnc

# Create xstartup script (launches i3 when VNC connects)
cat > ~/.vnc/xstartup << 'EOF'
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

# Set background color
xsetroot -solid "#2E3436"

# Start i3
exec i3
EOF

chmod +x ~/.vnc/xstartup

# Set default VNC password (change this!)
echo "codespaces" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

echo "Setup complete. Run 'vncserver :1' to start."
