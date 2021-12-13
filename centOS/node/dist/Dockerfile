FROM adrxking_centos-node

COPY ./start-nuxt.sh /root

RUN chmod +x /root/start-nuxt.sh

RUN dos2unix /root/start-nuxt.sh

WORKDIR /var/www/html

ENTRYPOINT [ "/root/start-nuxt.sh" ]