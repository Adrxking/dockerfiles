FROM adrxking_centos

EXPOSE 80

#RUN yum install -y initscripts

#RUN yum install epel-release -y
#RUN yum update -y
#RUN yum install supervisor -y

#RUN yum install s6
#ADD ./s6 /etc/s6

COPY ./start-php.sh /root
COPY ./nginx.repo /etc/yum.repos.d/nginx.repo
COPY ./nginx.conf /etc/nginx/
COPY ./custom_404.html /var/www/html/


RUN chmod +x /root/start-php.sh

RUN dos2unix /root/start-php.sh 

RUN yum install nginx -y

COPY ./nginx /etc/init.d/nginx

COPY ./default.conf /etc/nginx/conf.d/default.conf

#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log

#CMD [ "/bin/s6-svscan", "/etc/s6" ]
ENTRYPOINT [ "/root/start-php.sh" ]