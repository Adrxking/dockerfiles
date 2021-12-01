FROM adrxking_centos

COPY ./start-node.sh /root

RUN chmod +x /root/start-node.sh

RUN dos2unix /root/start-node.sh

RUN yum install nodejs npm epel-release -y

RUN yum update -y

RUN yum install jq -y

ENTRYPOINT [ "/root/start-node.sh" ]