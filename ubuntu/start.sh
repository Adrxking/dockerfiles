#!/bin/bash

set -e

echo "Bienvenido a la configuración de Ubuntu"

newUser(){
    useradd -rm -d /home/"${USUARIO}" -s /bin/bash "${USUARIO}" 
    echo "root:${PASSWD}" | chpasswd
    echo "${USUARIO}:${PASSWD}" | chpasswd
    echo "Configuracion de usuario correcta"
}

config_Timezone(){
    timedatectl set-timezone ${TZ}
    echo "Configuracion de timezone correcta"
}

config_Sudoers(){
    echo "${USUARIO} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
    echo "Configuración de sudoers correcta"
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
    echo "Configuración ssh correcta"
}

main(){
    config_Timezone
    newUser
    config_Sudoers
    config_ssh
}

main