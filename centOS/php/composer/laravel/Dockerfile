FROM adrxking_centos-php-composer

# Copiar script de inicio al root
COPY ./start-laravel.sh /root

# Dar permisos de ejecución al script de inicio
RUN chmod +x /root/start-laravel.sh

# Convertir a unix el script de inicio
RUN dos2unix /root/start-laravel.sh

ENTRYPOINT [ "/root/start-laravel.sh" ]