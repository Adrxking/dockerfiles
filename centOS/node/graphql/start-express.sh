#!/bin/bash

bash /root/start-node.sh

set -e

webPath=/var/www/graphql

if ! [ -d $webPath]; then
    mkdir $webPath
fi

cd $webPath

if ! [ -f $webPath/package.json ]; then

    npm init -y
    
    npm i graphql

    tail -f /dev/null

else 
    npm i

    npm run start:dev
fi