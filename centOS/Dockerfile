FROM centos

# exponer puerto ssh
#EXPOSE 22

ARG USUARIO
ARG PASSWD
ARG TZ

COPY ./start.sh /root
COPY ./id_rsa.pub /root

RUN chmod +x /root/start.sh

RUN yum update -y && yum install -y \
    yum-utils \
    wget \ 
    curl \ 
    git \
    nano \ 
    tree \
    net-tools \ 
    sudo \ 
    openssh-server \ 
    openssh-clients \
    unzip \
    dos2unix \ 
    expect \
    python3

RUN dos2unix /root/start.sh 

ENTRYPOINT [ "/root/start.sh" ]