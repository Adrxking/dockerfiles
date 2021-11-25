FROM adrxking_centos

EXPOSE 80
EXPOSE 9000

COPY ./start-php.sh /root
COPY ./nginx.repo /etc/yum.repos.d/nginx.repo

RUN chmod +x /root/start-php.sh

RUN dos2unix /root/start-php.sh 

RUN yum install nginx -y

ENTRYPOINT [ "/root/start-php.sh" ]

CMD ["nginx"]