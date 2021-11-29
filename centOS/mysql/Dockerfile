FROM adrxking_centos

# Copiar el script de inicio al contenedor
COPY ./start-mysql.sh /root
COPY ./mysql-server.cnf /etc/my.cnf.d/mysql-server.cnf

# Dar permisos al script de inicio
RUN chmod +x /root/start-mysql.sh

# Convertir a unix el script de inicio
RUN dos2unix /root/start-mysql.sh

RUN dnf install -y @mysql

EXPOSE 3306

ENTRYPOINT [ "/root/start-mysql.sh" ]