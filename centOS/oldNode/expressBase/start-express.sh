#!/bin/bash

bash /root/start-node.sh

echo "Hola desde EXPRESS BASE"

set -e

if [ ${NEW} == true ]
 then
    if [ `yum list installed | grep httpd | wc -l` -gt 0 ]
     then 
        webPath=/var/www/html
    elif [ `yum list installed | grep nginx | wc -l` -gt 0 ]
     then
        webPath=/usr/share/nginx/html
    else
        echo "Ni nginx ni apache instalado"
    fi
    echo "Cambio a $webPath en express"
    cd $webPath
    npm i express --save
    echo "node_modules"                                          > .gitignore
    
    echo "var express = require('express');"                     >  index.js
    echo "var app = express();"                                  >> index.js
    echo "app.get('/', function (req, res){"                     >> index.js
    echo "  res.send('Hello world!');"                           >> index.js
    echo "});"                                                   >> index.js
    echo "app.listen(3000, function() {"                         >> index.js
    echo "  console.log('Example all listening on port 3000!');" >> index.js
    echo "});"                                                   >> index.js

    node index.js
fi