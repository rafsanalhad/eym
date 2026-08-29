#!/bin/sh
set -e

TARGET_PORT="${PORT:-8080}"
echo "Configuring Apache for Cloud Run on port ${TARGET_PORT}..."

# Cleanly rewrite ports.conf
echo "Listen ${TARGET_PORT}" > /etc/apache2/ports.conf

# Cleanly configure default VirtualHost
cat <<EOF > /etc/apache2/sites-available/000-default.conf
<VirtualHost *:${TARGET_PORT}>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    <Directory /var/www/html>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

echo "Starting Apache web server on port ${TARGET_PORT}..."
exec apache2-foreground
