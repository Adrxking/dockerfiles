#!/bin/bash

bash /root/start-php.sh

if ! [ -f /root/laravel.txt ]
 then
    php-fpm -F -R
fi