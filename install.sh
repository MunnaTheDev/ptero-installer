#!/bin/bash
set -e

clear
echo "=============================="
echo "  Pterodactyl 1-Click Setup"
echo "=============================="

echo "[1] Updating system..."
apt update -y && apt upgrade -y

echo "[2] Installing dependencies..."
apt install -y curl wget git unzip software-properties-common

echo "[3] Installing Docker..."
apt install -y docker.io
systemctl enable docker
systemctl start docker

echo "[4] Installing MariaDB..."
apt install -y mariadb-server

echo "[5] Installing Nginx..."
apt install -y nginx

echo "================================"
echo "BASE SETUP DONE!"
echo "Next step: Panel + Wings install"
echo "================================"
