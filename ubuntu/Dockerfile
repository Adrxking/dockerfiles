FROM ubuntu

#indicamos el timezone
ARG TZ=Europe/Madrid
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# exponer puerto ssh
EXPOSE 22

ARG USUARIO
ARG PASSWD

COPY ./start.sh /root

RUN chmod +x /root/start.sh

RUN apt-get update -y && apt-get install -y \
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
    dos2unix \ 
    expect \
    python3

RUN dos2unix /root/start.sh 

ENTRYPOINT [ "/root/start.sh" ]