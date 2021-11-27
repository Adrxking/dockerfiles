#!/bin/bash

bash /root/start.sh

wait

set -e

yum update -y

if ! [ -f /var/www/html/index.html ]
 then
    mv /usr/tmp/index.html /var/www/html/index.html
fi

if ! [ -f /var/www/html/custom_404.html ]
 then
    mv /usr/tmp/custom_404.html /var/www/html/custom_404.html
fi

if ! [ -f /var/www/html/50x.html ]
 then
    mv /usr/tmp/50x.html /var/www/html/50x.html
fi

exec /usr/sbin/nginx -g "daemon off;"