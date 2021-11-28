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

if [ -f /var/www/html/custom_404.html ]
 then
    mv /var/www/html/custom_404.html /var/www/html/public/custom_404.html
fi

if [ -f /var/www/html/50x.html ]
 then
    mv /var/www/html/50x.html /var/www/html/public/50x.html
fi

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