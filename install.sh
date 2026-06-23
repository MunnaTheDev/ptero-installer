#!/bin/bash
set -e

clear
echo "===================================="
echo "   MunnaTheDev Pterodactyl Installer"
echo "===================================="

### UPDATE SYSTEM
echo "[1/10] Updating system..."
apt update -y && apt upgrade -y

### BASIC TOOLS
echo "[2/10] Installing tools..."
apt install -y curl wget git unzip tar software-properties-common

### DOCKER
echo "[3/10] Installing Docker..."
apt install -y docker.io
systemctl enable docker
systemctl start docker

### DATABASE
echo "[4/10] Installing MariaDB..."
apt install -y mariadb-server mariadb-client

mysql_secure_installation <<EOF

y
rootpassword
rootpassword
y
y
y
y
EOF

### NGINX
echo "[5/10] Installing Nginx..."
apt install -y nginx

### PHP + REQUIRED EXTENSIONS
echo "[6/10] Installing PHP..."
add-apt-repository ppa:ondrej/php -y
apt update -y
apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-mbstring php8.2-xml php8.2-curl php8.2-zip php8.2-bcmath

### COMPOSER
echo "[7/10] Installing Composer..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

### PANEL INSTALL
echo "[8/10] Installing Panel..."
mkdir -p /var/www/pterodactyl
cd /var/www/pterodactyl

curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
tar -xzvf panel.tar.gz
chmod -R 755 storage bootstrap/cache

cp .env.example .env
composer install --no-dev --optimize-autoloader

php artisan key:generate

### DATABASE SETUP
echo "[9/10] Setting up database..."
mysql -u root -prootpassword <<EOF
CREATE DATABASE panel;
CREATE USER 'ptero'@'127.0.0.1' IDENTIFIED BY 'pteropass';
GRANT ALL PRIVILEGES ON panel.* TO 'ptero'@'127.0.0.1';
FLUSH PRIVILEGES;
EOF

### WINGS INSTALL
echo "[10/10] Installing Wings..."
curl -L -o /usr/local/bin/wings https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
chmod +x /usr/local/bin/wings

echo "===================================="
echo " INSTALL COMPLETE (BASIC VERSION)"
echo " Next: configure domain + SSL + node"
echo "===================================="
