FROM adrxking_centos-node

COPY ./start-nuxt.sh /root

RUN chmod +x /root/start-webpack.sh

RUN dos2unix /root/start-webpack.sh

WORKDIR /var/www/html

ENTRYPOINT [ "/root/start-webpack.sh" ]