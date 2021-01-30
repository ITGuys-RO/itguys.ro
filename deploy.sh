#!/bin/bash

git pull
composer install --no-dev --no-interaction --prefer-dist
php craft migrate/all
php craft project-config/apply
php craft clear-caches/all
php craft gc --delete-all-trashed=1
chmod 777 . -R
chown www-data:www-data . -R
