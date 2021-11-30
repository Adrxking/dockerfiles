#!/bin/bash

bash /root/start.sh

# Eliminar la carpeta si auto.cnf no existe para generar una BD nueva
if ! [ -f /var/lib/mysql/auto.cnf ]
 then
    rm -rf /var/lib/mysql
    mkdir /var/lib/mysql
fi

# Conceder permisos a nginx en la carpeta
chown -R mysql:mysql /var/lib/mysql
chmod 0755 /var/lib/mysql

chown root:mysql /usr/sbin/mysqld
chmod 0770 /usr/sbin/mysqld

# Crear la siguiente carpeta si no existe para el socket y el PID
if ! [ -d /var/run/mysqld ]
 then
    mkdir /var/run/mysqld
fi

# Crear el PID y conceder permisos a mysql si no existe
if ! [ -f /var/run/mysqld/mysqld.pid ]
 then
    touch /var/run/mysqld/mysqld.pid
    chown -R mysql:mysql /var/run/mysqld
fi

# Comprobar que no existe una base de datos inicializada actualmente
if ! [ -f /var/lib/mysql/auto.cnf ]
 then
    mysqld --initialize-insecure
fi

mysqld -D

# Si no es la primera vez que se ejecuta el expect lo ejecutamos, creamos un archivo de que lo hemos ejecutado y hacemos la configuración
# por primera vez y la creación del USUARIO 
if ! [ -f /var/lib/mysql/notFirst.txt ]
 then
    expect /root/script.exp
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWD}';"          >  temporal.sql
    echo "CREATE USER '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWD}';"   >> temporal.sql
    echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER_NAME}'@'%' WITH GRANT OPTION;"   >> temporal.sql
    echo "FLUSH PRIVILEGES;"                                                            >> temporal.sql
    echo "CREATE DATABASE ${MYSQL_DATABASE_NAME};"                                      >> temporal.sql
    mysql -u root -p"temporal" < temporal.sql
    rm temporal.sql
    # Crear el archivo not first para dejar constancia de que no es la primera vez que se ejecuta el expect
    touch /var/lib/mysql/notFirst.txt
fi

echo "Imagen MySQL terminada"

tail -f /dev/null