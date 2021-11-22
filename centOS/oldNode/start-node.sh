#!/bin/bash

bash /root/start.sh

set -e

yum install nodejs npm -y

init_Npm() {
    if [ ${NEW} == true ]
     then
        cd $webPath
        npm init -y
    fi
}

if [ "${WEBSERVER}" == 'nginx' ]
 then
    yum install nginx -y

    webPath=/usr/share/nginx/html
    
    init_Npm
    
elif [ "${WEBSERVER}" == 'apache' ]
 then
    yum install httpd httpd-tools -y

    webPath=/var/www/html

    init_Npm

else
    exit 22
fi