FROM adrxking_centos

COPY ./start-node.sh /root

RUN chmod +x /root/start-node.sh

RUN dos2unix /root/start-node.sh 

ARG NEW
ARG JUSTNODE

RUN yum install nodejs npm -y

ENTRYPOINT [ "/root/start-node.sh" ]