#!/bin/bash
set -e

clear
echo "======================================"
echo "   MunnaTheDev Pterodactyl Installer"
echo "======================================"

echo "[1/6] Updating system..."
apt update -y && apt upgrade -y

echo "[2/6] Installing dependencies..."
apt install -y curl wget git unzip tar software-properties-common

echo "[3/6] Installing Docker..."
apt install -y docker.io
systemctl enable docker
systemctl start docker

echo "[4/6] Installing MariaDB..."
apt install -y mariadb-server

echo "[5/6] Installing Nginx..."
apt install -y nginx

echo "[6/6] Basic setup done!"
echo "Now you need to install Panel manually or extend script."
