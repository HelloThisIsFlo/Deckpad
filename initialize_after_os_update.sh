#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"

# Disable SteamOS Readonly mode
sudo steamos-readonly disable

# Update archlinux-keyring
# See: https://wiki.archlinux.org/title/Pacman/Package_signing#Upgrade_system_regularly
sudo pacman -Sy archlinux-keyring --noconfirm
sudo pacman -Su --noconfirm

# Refresh Keys
sudo pacman-key --init
sudo pacman-key --populate archlinux 
sudo pacman-key --refresh-keys

# Upgrade all packages
sudo pacman -Syu --noconfirm

# Install custom packages
./install_pacman_packages.sh

cd - >/dev/null
