#!/bin/bash

bash /root/start.sh

set -e

echo "Imagen PHP terminada"

if ! [ -f /root/start-composer.sh ]
 then
    php-fpm -F -R
fi