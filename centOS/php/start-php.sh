#!/bin/bash

bash /root/start.sh

set -e

if ! [ -f /var/www/html/index.php ]
 then
    mv /usr/tmp/index.php /var/www/html/index.php
fi

echo "Imagen PHP terminada"

if ! [ -f /root/start-composer.sh ]
 then
    php-fpm -F -R
fi