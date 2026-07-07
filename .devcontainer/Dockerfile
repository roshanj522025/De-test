# Use a lightweight Debian base instead of Ubuntu
FROM mcr.microsoft.com/devcontainers/base:debian

# Enable privileged mode
USER root

# Set up environment variables to suppress interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Preconfigure the keyboard layout
RUN echo 'keyboard-configuration keyboard-configuration/layoutcode string us' | debconf-set-selections && \
    echo 'keyboard-configuration keyboard-configuration/layout select English (US)' | debconf-set-selections

# Install only what's needed: VNC + XFCE (no Cinnamon, no extra goodies/tooling)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        tigervnc-standalone-server \
        tigervnc-tools \
        dbus-x11 \
        xfce4 \
        novnc \
        python3-websockify \
        firefox-esr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
