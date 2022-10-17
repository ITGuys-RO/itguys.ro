#!/bin/sh
composer install --optimize-autoloader --apcu-autoloader --no-interaction --no-progress --prefer-dist

# CRON
cp /var/www/docker/php-fpm/crontab /etc/cron.d/crontab
chmod 0644 /etc/cron.d/crontab
crontab /etc/cron.d/crontab
cron

/usr/local/sbin/php-fpm -D
/usr/bin/supervisord
