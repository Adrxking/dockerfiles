#!/bin/bash

bash /root/start.sh

set -e

webPath=/var/www/html

sed -i "s/fastcgi_pass   container:9000/fastcgi_pass   ${FPM}:9000/" /etc/nginx/conf.d/default.conf

if [ "$CUSTOMPATH" == true ]
 then
    sed -i "s/root   \/var\/www\/html/root   \/var\/www\/html\/public/" /etc/nginx/conf.d/default.conf
fi

if ! [ -f $webPath/custom_404.html ]
 then
    mv /usr/tmp/custom_404.html $webPath/custom_404.html
fi

if ! [ -f $webPath/50x.html ]
 then
    mv /usr/tmp/50x.html $webPath/50x.html
fi

echo "Imagen NGINX terminada"

exec /usr/sbin/nginx -g "daemon off;"