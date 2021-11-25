FROM adrxking_centos-node

RUN mkdir -p /usr/share/html

COPY ./start-webpack.sh /root

RUN ls /usr/share/html

RUN chmod +x /root/start-webpack.sh

RUN dos2unix /root/start-webpack.sh

ARG DEV

WORKDIR /usr/share/html

ENTRYPOINT [ "/root/start-webpack.sh" ]