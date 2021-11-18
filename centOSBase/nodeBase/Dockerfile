FROM adrxking_centos

COPY ./start-node.sh /root

RUN chmod +x /root/start-node.sh

ARG WEBSERVER
ARG NEW

ENTRYPOINT [ "/root/start-node.sh" ]