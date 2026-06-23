#!/bin/bash
set -e

clear
echo "======================================"
echo "  🚀 MunnaTheDev PRO Pterodactyl Installer"
echo "======================================"

# CHECK ROOT
if [[ $EUID -ne 0 ]]; then
   echo "❌ Run as root!"
   exit 1
fi

echo ""
read -p "🌐 Enter your domain (example: panel.example.com): " DOMAIN

echo ""
echo "[1/10] Updating system..."
apt update -y && apt upgrade -y

echo "[2/10] Installing base packages..."
apt install -y curl wget git unzip tar software-properties-common

echo "[3/10] Installing Nginx..."
apt install -y nginx

echo "[4/10] Installing MariaDB..."
apt install -y mariadb-server mariadb-client

echo "[5/10] Securing MariaDB..."
mysql -e "CREATE DATABASE panel;"
mysql -e "CREATE USER 'ptero'@'127.0.0.1' IDENTIFIED BY 'StrongPassword123';"
mysql -e "GRANT ALL PRIVILEGES ON panel.* TO 'ptero'@'127.0.0.1';"
mysql -e "FLUSH PRIVILEGES;"

echo "[6/10] Installing PHP 8.2..."
add-apt-repository ppa:ondrej/php -y
apt update -y
apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-mbstring php8.2-xml php8.2-curl php8.2-zip php8.2-bcmath

echo "[7/10] Installing Composer..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "[8/10] Downloading Pterodactyl Panel..."
mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl

curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
tar -xzvf panel.tar.gz
chmod -R 755 storage bootstrap/cache

cp .env.example .env

echo "[9/10] Installing dependencies..."
composer install --no-dev --optimize-autoloader

echo "[10/10] Generating app key..."
php artisan key:generate

echo ""
echo "======================================"
echo "✅ PANEL BASE INSTALLED"
echo "➡ Next step: php artisan migrate --seed"
echo "➡ Then setup Nginx + SSL manually or extend script"
echo "======================================"

# WINGS INSTALL
echo ""
read -p "Install Wings now? (y/n): " WINGS

if [[ "$WINGS" == "y" ]]; then
    echo "[WINGS] Installing Docker..."
    apt install -y docker.io
    systemctl enable docker
    systemctl start docker

    echo "[WINGS] Downloading Wings..."
    curl -L -o /usr/local/bin/wings https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
    chmod +x /usr/local/bin/wings

    echo "✅ Wings installed"
fi

echo ""
echo "🎉 INSTALLER FINISHED (PRO VERSION)"
echo "Domain: $DOMAIN"
echo "======================================"
