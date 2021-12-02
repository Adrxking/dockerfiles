FROM adrxking_centos-php

# Copiar script de inicio al root
COPY ./start-composer.sh /root

# Dar permisos de ejecución al script de inicio
RUN chmod +x /root/start-composer.sh

# Convertir a unix el script de inicio
RUN dos2unix /root/start-composer.sh

RUN yum update -y

RUN php -r "copy('https://getcomposer.org/installer', '/root/composer-setup.php');"

RUN HASH="$(wget -q -O - https://composer.github.io/installer.sig)"

RUN php -r "if (hash_file('SHA384', '/root/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('/root/composer-setup.php'); } echo PHP_EOL;" \
    php /root/composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    chmod +x /usr/local/bin/composer

ENTRYPOINT [ "/root/start-composer.sh" ]