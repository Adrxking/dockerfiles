#!/bin/bash

bash /root/start-composer.sh

webPath=/var/www/html
if ! [ -f /var/www/html/composer.json ]
 then
    rm -rf $webPath
    mkdir rm -rf $webPath
    cd $webPath
    composer create-project laravel/laravel .
fi

composer install

if [ -d /var/www/html/storage ]
 then
    chown -R :nginx /var/www/html/storage
    chmod -R 777 /var/www/html/storage
fi

if [ -d /var/www/html/bootstrap/cache ]
 then
    chown -R :nginx /var/www/html/bootstrap/cache
    chmod -R 775 /var/www/html/bootstrap/cache
fi

echo "Imagen Laravel terminada"

php-fpm -F -R