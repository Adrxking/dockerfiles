FROM adrxking_centos-php

# Copiar script de inicio al root
COPY ./start-composer.sh /root

# Dar permisos de ejecución al script de inicio
RUN chmod +x /root/start-composer.sh

# Convertir a unix el script de inicio
RUN dos2unix /root/start-composer.sh

RUN yum update -y

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

RUN HASH="$(wget -q -O - https://composer.github.io/installer.sig)"

RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

ENTRYPOINT [ "/root/start-composer.sh" ]