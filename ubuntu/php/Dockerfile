FROM adrxking_ubuntu

COPY ./start-php.sh /root

RUN chmod +x /root/start-php.sh

RUN dos2unix /root/start-php.sh 

EXPOSE 80

RUN apt-get update && apt-get install -y php \
    php-cli \
    php8.0-fpm \
    php-json \
    php-common \
    php-mysql \
    php-zip \
    php-gd \
    php-mbstring \
    php-curl \
    php-xml \
    php-pear \ 
    php-bcmath

ENTRYPOINT [ "/root/start-php.sh" ]