#!/usr/bin/env bash
# WSL Ubuntu Provisioning Script
# Run from inside WSL after first chezmoi apply:
#   bash ~/.config/wsl/provision-wsl.sh
#
# Idempotent — safe to re-run.

set -euo pipefail

# ─── Helpers ─────────────────────────────────────────────────────────────────
section() { echo -e "\n\033[1;36m=== $* ===\033[0m"; }
ok()      { echo -e "\033[1;32m  ✓ $*\033[0m"; }
info()    { echo -e "\033[0;33m  → $*\033[0m"; }

# ─── Core packages ───────────────────────────────────────────────────────────
section "Updating apt and installing core packages"
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
    build-essential \
    curl \
    wget \
    git \
    jq \
    ffmpeg \
    tmux \
    rsync \
    socat \
    unzip \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    gnupg \
    tldr \
    tree \
    sqlite3
ok "Core packages installed"

# ─── pyenv ───────────────────────────────────────────────────────────────────
section "Installing pyenv"
# Install pyenv build dependencies
sudo apt install -y \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

if [[ ! -d "${HOME}/.pyenv" ]]; then
    curl https://pyenv.run | bash
    ok "pyenv installed"
else
    ok "pyenv already installed — skipping"
fi

# ─── Windows home symlink ────────────────────────────────────────────────────
section "Setting up ~/winhome → Windows home directory"
if command -v wslvar &>/dev/null; then
    WINHOME=$(wslpath "$(wslvar USERPROFILE)")
elif [[ -d "/mnt/c/Users" ]]; then
    # Fallback: find the first non-default user directory
    WINHOME=$(find /mnt/c/Users -maxdepth 1 -mindepth 1 -type d \
        ! -name "Public" ! -name "Default" ! -name "Default User" ! -name "All Users" \
        | head -1)
fi

if [[ -n "${WINHOME:-}" && -d "$WINHOME" ]]; then
    ln -sfn "$WINHOME" "${HOME}/winhome"
    ok "Linked ~/winhome → $WINHOME"
else
    info "Could not determine Windows home directory — set up ~/winhome manually"
fi

# ─── npiperelay (1Password SSH agent bridge) ─────────────────────────────────
section "Setting up npiperelay for 1Password SSH agent"
if [[ -n "${WINHOME:-}" ]]; then
    NPIPERELAY_DIR="${WINHOME}/AppData/Local/npiperelay"
    NPIPERELAY="${NPIPERELAY_DIR}/npiperelay.exe"
    mkdir -p "$NPIPERELAY_DIR"
    if [[ ! -f "$NPIPERELAY" ]]; then
        info "Downloading npiperelay.exe..."
        NPIPE_URL=$(curl -s https://api.github.com/repos/jstarks/npiperelay/releases/latest \
            | grep "browser_download_url.*windows_amd64" \
            | cut -d '"' -f 4)
        curl -sL "$NPIPE_URL" -o /tmp/npiperelay.zip
        unzip -p /tmp/npiperelay.zip npiperelay.exe > "$NPIPERELAY"
        chmod +x "$NPIPERELAY"
        rm /tmp/npiperelay.zip
        ok "npiperelay.exe installed to $NPIPERELAY"
    else
        ok "npiperelay.exe already present"
    fi
    info "1Password: enable SSH agent in Settings → Developer → SSH Agent"
else
    info "Skipping npiperelay setup (WINHOME not set)"
fi

# ─── SSH controlmasters dir ──────────────────────────────────────────────────
mkdir -p "${HOME}/.ssh/controlmasters"
chmod 700 "${HOME}/.ssh"

# ─── Xvfb + Chromium (for FlareSolverr) ─────────────────────────────────────
section "Installing Xvfb and Chromium (FlareSolverr dependencies)"
sudo apt install -y xvfb chromium-browser
ok "Xvfb and Chromium installed"

# ─── wsl.conf ────────────────────────────────────────────────────────────────
section "Writing /etc/wsl.conf"
sudo tee /etc/wsl.conf > /dev/null << 'EOF'
[automount]
enabled = true
options = "metadata,umask=22,fmask=11"

[network]
generateHosts = true
generateResolvConf = true

[boot]
systemd = true

[interop]
enabled = true
# Prevent Windows PATH from polluting WSL PATH
appendWindowsPath = false
EOF
ok "/etc/wsl.conf written"
info "Run 'wsl --shutdown' from Windows to apply wsl.conf changes"

# ─── *arr stack ──────────────────────────────────────────────────────────────
section "Installing *arr stack (Radarr, Sonarr, Prowlarr, Jackett)"

# Radarr
if ! systemctl is-active --quiet radarr 2>/dev/null; then
    info "Installing Radarr..."
    curl -sL https://raw.githubusercontent.com/Radarr/Radarr/develop/distribution/debian/install.sh \
        | sudo bash -s -- --branch master
    ok "Radarr installed"
else
    ok "Radarr already running"
fi

# Sonarr
if ! systemctl is-active --quiet sonarr 2>/dev/null; then
    info "Installing Sonarr..."
    # Add Sonarr apt repo
    sudo curl -fsSL https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2009837CBFFD68F45BC180471F4F90DE2A9B4BF8 \
        | sudo gpg --dearmor -o /usr/share/keyrings/sonarr.gpg
    echo "deb [signed-by=/usr/share/keyrings/sonarr.gpg] https://apt.sonarr.tv/ubuntu $(lsb_release -cs) main" \
        | sudo tee /etc/apt/sources.list.d/sonarr.list
    sudo apt update && sudo apt install -y sonarr
    ok "Sonarr installed"
else
    ok "Sonarr already running"
fi

# Prowlarr
if ! systemctl is-active --quiet prowlarr 2>/dev/null; then
    info "Installing Prowlarr..."
    curl -sL https://raw.githubusercontent.com/Prowlarr/Prowlarr/develop/distribution/debian/install.sh \
        | sudo bash -s -- --branch master
    ok "Prowlarr installed"
else
    ok "Prowlarr already running"
fi

# Jackett
if ! systemctl is-active --quiet jackett 2>/dev/null; then
    info "Installing Jackett..."
    JACKETT_URL=$(curl -s https://api.github.com/repos/Jackett/Jackett/releases/latest \
        | grep "browser_download_url.*Jackett.Binaries.LinuxAMDx64.tar.gz" \
        | cut -d '"' -f 4)
    curl -sL "$JACKETT_URL" | sudo tar -xz -C /opt/
    sudo chown -R "$USER":"$USER" /opt/Jackett
    sudo /opt/Jackett/install_service_systemd.sh
    ok "Jackett installed"
else
    ok "Jackett already running"
fi

# ─── FlareSolverr ────────────────────────────────────────────────────────────
section "Installing FlareSolverr"
FLARESOLVERR_DIR="/opt/flaresolverr"

if [[ ! -f "${FLARESOLVERR_DIR}/flaresolverr" ]]; then
    info "Downloading FlareSolverr..."
    FLARE_TAG=$(curl -s https://api.github.com/repos/FlareSolverr/FlareSolverr/releases/latest \
        | grep '"tag_name"' | cut -d '"' -f 4)
    FLARE_URL="https://github.com/FlareSolverr/FlareSolverr/releases/download/${FLARE_TAG}/flaresolverr_linux_x64.tar.gz"
    curl -sL "$FLARE_URL" | sudo tar -xz -C /opt/
    sudo chown -R "$USER":"$USER" "${FLARESOLVERR_DIR}"
    ok "FlareSolverr ${FLARE_TAG} installed to ${FLARESOLVERR_DIR}"
else
    ok "FlareSolverr already installed"
fi

# Xvfb systemd service
if [[ ! -f /etc/systemd/system/xvfb.service ]]; then
    sudo tee /etc/systemd/system/xvfb.service > /dev/null << 'EOF'
[Unit]
Description=Xvfb Virtual Display Server
After=network.target

[Service]
ExecStart=/usr/bin/Xvfb :99 -screen 0 1280x720x24 -ac
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF
    ok "xvfb.service created"
fi

# FlareSolverr systemd service
if [[ ! -f /etc/systemd/system/flaresolverr.service ]]; then
    sudo tee /etc/systemd/system/flaresolverr.service > /dev/null << EOF
[Unit]
Description=FlareSolverr
After=network.target xvfb.service
Requires=xvfb.service

[Service]
SyslogIdentifier=flaresolverr
Restart=always
RestartSec=5
Type=simple
User=${USER}
Environment=LOG_LEVEL=info
Environment=LOG_HTML=false
Environment=CAPTCHA_SOLVER=none
Environment=DISPLAY=:99
ExecStart=${FLARESOLVERR_DIR}/flaresolverr

[Install]
WantedBy=multi-user.target
EOF
    ok "flaresolverr.service created"
fi

sudo systemctl daemon-reload
sudo systemctl enable xvfb flaresolverr
sudo systemctl start xvfb flaresolverr 2>/dev/null || \
    info "systemd services not yet active — restart WSL first: wsl --shutdown"

# ─── Done ────────────────────────────────────────────────────────────────────
echo ""
section "Provisioning complete"
echo ""
echo "  Next steps:"
echo "  1. Restart WSL to apply wsl.conf + systemd:"
echo "       wsl --shutdown   (from Windows PowerShell)"
echo "  2. After restart, start services:"
echo "       sudo systemctl start radarr sonarr prowlarr jackett flaresolverr"
echo "  3. Enable 1Password SSH agent in Windows 1Password → Settings → Developer"
echo "  4. Check arr stack ports:"
echo "       Radarr:     http://localhost:7878"
echo "       Sonarr:     http://localhost:8989"
echo "       Prowlarr:   http://localhost:9696"
echo "       Jackett:    http://localhost:9117"
echo "       FlareSolverr: http://localhost:8191"
echo ""
