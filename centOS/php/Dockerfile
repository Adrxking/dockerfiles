FROM adrxking_centos

EXPOSE 9000

RUN mkdir -p /var/www/html

COPY ./start-php.sh /root
COPY ./info.php /usr/tmp

RUN chmod +x /root/start-php.sh

RUN dos2unix /root/start-php.sh 

RUN mkdir -p /var/run/
RUN mkdir -p /run/php-fpm

ENTRYPOINT [ "/root/start-php.sh" ]