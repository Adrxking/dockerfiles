FROM adrxking_centos-node

COPY ./start-express.sh /root

RUN chmod +x /root/start-express.sh

ARG NEW

ENTRYPOINT [ "/root/start-express.sh" ]