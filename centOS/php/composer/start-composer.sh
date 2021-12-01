#!/bin/bash

bash /root/start-php.sh

php composer-setup.php --install-dir=/usr/local/bin --filename=composer

chmod +x /usr/local/bin/composer

if ! [ -f /root/laravel.txt ]
 then
    php-fpm -F -R
fi