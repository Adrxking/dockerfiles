#!/bin/bash

set -e

echo "Bienvenido a CentOS personalizado por Adrian"

newUser(){
    useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}" 
    echo "root:${PASSWD}" | chpasswd
    echo "${USUARIO}:${PASSWD}" | chpasswd
    echo "Creación de usuario satisfactoria"
}

config_Timezone(){
    timedatectl set-timezone ${TZ}
    echo "Timezone satisfactorio"
}

config_Sudoers(){
    echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
    echo "Usuario sudoers satisfactorio"
}

config_ssh(){
    sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
    sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
    if [ ! -d /home/${USUARIO}/.ssh ]
    then
        mkdir /home/${USUARIO}/.ssh
        cat /root/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
    fi
    /etc/init.d/ssh start
    echo "Configuración de SSH satisfactorio"
}

main(){
    newUser
    config_Timezone
    config_Sudoers
}

main