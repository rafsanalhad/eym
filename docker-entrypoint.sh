#!/bin/sh
set -e

TARGET_PORT="${PORT:-8080}"
echo "Configuring Apache to listen on port ${TARGET_PORT}..."

# Update Apache port configurations dynamically at runtime
sed -i "s/Listen [0-9]*/Listen ${TARGET_PORT}/g" /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*:[0-9]*>/<VirtualHost \*:${TARGET_PORT}>/g" /etc/apache2/sites-available/000-default.conf

echo "Starting Apache web server on port ${TARGET_PORT}..."
exec apache2-foreground
