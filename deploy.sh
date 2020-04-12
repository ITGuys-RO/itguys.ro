#!/bin/bash

git pull
composer install --no-dev --no-interaction --prefer-dist
php craft gc/run --delete-all-trashed=1 --interactive=0
php craft clear-caches/all
scripts/set_perms.sh
