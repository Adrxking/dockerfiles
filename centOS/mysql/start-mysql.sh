#!/bin/bash

bash /root/start.sh

chown -R mysql:mysql /var/lib/mysql
chmod 0755 /var/lib/mysql

chown root:mysql /usr/sbin/mysqld
chmod 0770 /usr/sbin/mysqld

mkdir /var/run/mysqld
touch /var/run/mysqld/mysqld.pid
chown -R mysql:mysql /var/run/mysqld

cd /var/lib/mysql

mysqld --initialize-insecure

mysqld -D

echo "Imagen MySQL terminada"

tail -f /dev/null