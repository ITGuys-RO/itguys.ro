#!/bin/sh
composer install --optimize-autoloader --apcu-autoloader --no-interaction --no-progress --prefer-dist
php /var/www/artisan storage:link
php /var/www/artisan migrate

/usr/local/sbin/php-fpm -D