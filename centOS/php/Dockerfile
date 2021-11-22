FROM adrxking_centos

COPY ./start-php.sh /root

RUN chmod +x /root/start-php.sh

RUN dos2unix /root/start-php.sh 

EXPOSE 80

ENTRYPOINT [ "/root/start-php.sh" ]