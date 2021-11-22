#!/bin/bash

bash /root/start-node.sh

set -e

webPath=/usr/share/html

if [ ${NEW} == true ]
 then
    
    cd $webPath
    npm i express --save
    echo "node_modules"                                             > .gitignore
    
    echo "var express = require('express');"                        >  index.js
    echo ""                                                         >> index.js
    echo "var app = express();"                                     >> index.js
    echo ""                                                         >> index.js
    echo "app.get('/', function (req, res){"                        >> index.js
    echo "  res.send('Hello world!');"                              >> index.js
    echo "});"                                                      >> index.js
    echo ""                                                         >> index.js
    echo "app.listen(3000, function() {"                            >> index.js
    echo "  console.log('Express funcionando en el puerto 3000!');" >> index.js
    echo "});"                                                      >> index.js

    npm start
else 
    cd $webPath

    npm start
fi