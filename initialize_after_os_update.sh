#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"

# Disable SteamOS Readonly mode
sudo steamos-readonly disable

# If the '--skip-refresh-keys' flag is passed, skip refreshing keys
if [[ "$*" != *--skip-refresh-keys* ]]; then
    # Refresh Keys
    sudo pacman-key --init
    sudo pacman-key --populate archlinux 
    sudo pacman-key --populate holo # Thx: https://www.reddit.com/r/SteamDeck/comments/17i7gdk/comment/k6smppj
    sudo pacman-key --refresh-keys
fi

# Tell user to press enter to continue

echo ""
echo ""
echo "------------------------------"
echo "| Press Enter to continue... |"
echo "------------------------------"
read
echo ""
exit 0

# Update archlinux-keyring
# See: https://wiki.archlinux.org/title/Pacman/Package_signing#Upgrade_system_regularly
sudo pacman -Sy archlinux-keyring --noconfirm
sudo pacman -Su --noconfirm

# Upgrade all packages
sudo pacman -Syu --noconfirm

# Install custom packages
./install_pacman_packages.sh

echo "Done!"

cd - >/dev/null
