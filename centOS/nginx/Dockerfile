FROM adrxking_centos

ARG USUARIO
ARG PASSWD
ARG TZ
ARG DIST
ARG GITHUB

RUN mkdir -p /var/www/html

# En caso de querer el comando service instalar:
#RUN yum install -y initscripts

# Copiar el script de inicio al contenedor
COPY ./start-nginx.sh /root

RUN dnf module disable nginx php -y
RUN dnf remove nginx* 

# Copiar el respositorio de nginx al contenedor
COPY ./nginx.repo /etc/yum.repos.d/nginx.repo
# Instalar Nginx
RUN yum install nginx -y

ARG FPM
# Copiar el archivo de configuración de nginx al contenedor
COPY ./nginx.conf /etc/nginx/
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Copiar el html por defecto y el html en errores 404
COPY ./custom_404.html /usr/tmp/
COPY ./50x.html /usr/tmp/

# Dar permisos al script de inicio
RUN chmod +x /root/start-nginx.sh

# Convertir a unix el script de inicio
RUN dos2unix /root/start-nginx.sh 

# Copiar archivo de inicio de nginx al contenedor
COPY ./nginx /etc/init.d/nginx

EXPOSE 80


ENTRYPOINT [ "/root/start-nginx.sh" ]