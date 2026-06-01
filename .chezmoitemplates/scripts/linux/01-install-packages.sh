#!/usr/bin/env bash

set -euo pipefail

# Install essential packages via the available package manager
if command -v apt &>/dev/null; then
    sudo apt install -y git wget curl vim
elif command -v pacman &>/dev/null; then
    pacman install -y git wget curl
else
    echo "Unsupported package manager"
    exit 1
fi
