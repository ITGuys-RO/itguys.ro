#!/bin/bash

git checkout .
git pull --rebase
composer install --no-dev --no-interaction --prefer-dist
php craft migrate/all --interactive=0
php craft project-config/apply --interactive=0
php craft clear-caches/all --interactive=0
php craft gc --delete-all-trashed=1 --interactive=0
chmod 777 . -R
chown www-data:www-data . -R
