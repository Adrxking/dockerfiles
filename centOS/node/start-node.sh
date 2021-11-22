#!/bin/bash

bash /root/start.sh

set -e

webPath=/usr/share/html

init_Npm() {
    if [ ${NEW} == true ]
     then
        mkdir -p webPath
        cd $webPath
        npm init -y
    fi
}

change_package() {
    sed -i 's/test/start/' $webPath/package.json
    sed -i 's/Error: no test specified/node index.js/' $webPath/package.json
}

init_Npm
change_package