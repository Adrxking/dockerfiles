#!/bin/bash

bash /root/start.sh

set -e

webPath=/usr/share/html

init_Npm() {
    mkdir -p webPath
    cd $webPath
    npm init -y
}

if [ ${NEW} == true ]
 then
    init_Npm
fi

if [ ${JUSTNODE} == true ]
 then
    cd $webPath
    npm install
    npm run dev
fi