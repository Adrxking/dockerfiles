#!/bin/bash

bash /root/start.sh

set -e

webPath=/www/myapp

yum update -y && yum install -y

yum install -y \\
php56 \\
php-pear \\
php56-cli \\
php56-common \\
php56-fpm \\
php56-soap \\
php56-pecl-redis 

sed -e 's/127.0.0.1:9000/9000/' \\
    -e '/allowed_clients/d' \\
    -e '/catch_workers_output/s/^;//' \\
    -e '/error_log/d' \\
    -i /etc/php-fpm.d/www.conf 

mkdir -p $webPath

cd $webPath

tail -f /dev/null