#!/bin/bash

bash /root/start.sh

set -e

if ! [ -f /var/www/html/php/index.php ]
 then
    mv /usr/tmp/index.php /var/www/html/php/index.php
fi

echo "Contenedor PHP Listo"

php-fpm -F -R