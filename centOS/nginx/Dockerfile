FROM adrxking_centos

EXPOSE 80

#RUN yum install -y initscripts

COPY ./start-nginx.sh /root
COPY ./nginx.repo /etc/yum.repos.d/nginx.repo
COPY ./nginx.conf /etc/nginx/
COPY ./custom_404.html /usr/tmp/
COPY ./index.html /usr/tmp/

RUN chmod +x /root/start-nginx.sh

RUN dos2unix /root/start-nginx.sh 

RUN yum install nginx -y

COPY ./nginx /etc/init.d/nginx

COPY ./default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "/root/start-nginx.sh" ]