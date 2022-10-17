#!/bin/sh
composer install --optimize-autoloader --apcu-autoloader --no-interaction --no-progress --prefer-dist
php /var/www/craft migrate/all
php /var/www/craft project-config/apply
php /var/www/craft clear-caches/all
php /var/www/craft gc --delete-all-trashed=1
/usr/local/sbin/php-fpm -D