FROM adrxking_centos

RUN mkdir -p /var/www/html

# Copiar script de inicio al root
COPY ./start-php.sh /root

# Dar permisos de ejecución al script de inicio
RUN chmod +x /root/start-php.sh

# Convertir a unix el script de inicio
RUN dos2unix /root/start-php.sh

# Actualizar los repositorios
RUN yum update -y

# Instalar repositorios epel y remi para descargar php 8
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm

# Activar el módulo de php 8
RUN dnf module enable php:remi-8.0 -y

# Instalar php y otros paquetes
RUN dnf install -y php php-cli php-common php-fpm php-mysqlnd php-soap php-zip php-json php-xml php-mbstring php-xmlrpc php-gd

ARG TZ

# Copiar el archivo de configuración de la pool www de php fpm
COPY ./www.conf /etc/php-fpm.d/www.conf
COPY ./php.ini /etc/php.ini

# Crear carpeta de var run para que php fpm se ejecute
RUN mkdir -p /var/run/
RUN mkdir -p /run/php-fpm

EXPOSE 9000

ENTRYPOINT [ "/root/start-php.sh" ]