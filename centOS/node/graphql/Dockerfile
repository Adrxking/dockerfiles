FROM adrxking_centos-node

COPY ./start-express.sh /root

RUN chmod +x /root/start-express.sh

RUN dos2unix /root/start-express.sh

ENTRYPOINT [ "sh","/root/start-express.sh" ]