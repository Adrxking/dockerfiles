#!/bin/bash

bash /root/start.sh

set -e

yum update -y

if ! [ -f /var/www/html/info.php ]
 then
    mv /usr/tmp/info.php /var/www/html/info.php
fi

dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm

dnf module enable php:remi-8.0 -y

dnf install -y php php-cli php-common php-fpm php-mysqlnd

sed -i 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf
sed -i 's/listen = \/run\/php-fpm\/www.sock/listen = 127.0.0.1:9000/' /etc/php-fpm.d/www.conf

php -v 

php-fpm -F -R