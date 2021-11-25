FROM nginx:latest
 
#EXPOSE 22

ARG USUARIO
ARG PASSWD

COPY ./start.sh /root

RUN chmod +x /root/start.sh

RUN apt update -y && apt install -y \
    apt-utils \
    wget \
    curl \
    git \
    nano \
    tree \
    net-tools \
    sudo \
    openssh-server \
    openssh-client \
    unzip \
    dos2unix

RUN dos2unix /root/start.sh

ENTRYPOINT [ "/root/start.sh" ]

#COPY ./id_rsa.pub /root/id_rsa.pub.adrian

CMD ["nginx" "-g" "daemon off;"]

