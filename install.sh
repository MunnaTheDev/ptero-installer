#!/bin/bash

echo "🔥 Starting My Installer..."

apt update -y
apt install -y curl git
bash <(curl -s https://ptero.nobitahost.in)

echo "✅ Installation complete!"
