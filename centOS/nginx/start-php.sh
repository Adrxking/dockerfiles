#!/bin/bash

bash /root/start.sh

set -e

yum update -y

dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm

dnf module enable php:remi-8.0 -y

dnf install -y php php-cli php-common php-fpm

php -v 

webPath=/var/www/html

echo "<?php" > $webPath/info.php
echo "phpinfo();" >> $webPath/info.php
echo "?>" >> $webPath/info.php

exec /usr/sbin/nginx -g "daemon off;"

tail -f /dev/null