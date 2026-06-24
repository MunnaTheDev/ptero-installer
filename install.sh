#!/bin/bash

echo "🔥 Starting My Installer..."

apt update -y
apt install -y curl git
bash <(curl -s https://raw.githubusercontent.com/pterodactyl-installer/pterodactyl-installer/main/install.sh)

echo "✅ Installation complete!"
