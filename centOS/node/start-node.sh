#!/bin/bash

bash /root/start.sh

echo "Bienvenido a Node personalizado por Adrian"

set -e

webPath=/usr/share/html

init_Npm() {
    mkdir -p webPath
    cd $webPath
    npm init -y
}

if [ ${JUSTNODE} == true ]
 then
 
 if [ ${NEW} == true ]
  then
    init_Npm
 fi
 
    cd $webPath
    npm install
    npm run dev
fi