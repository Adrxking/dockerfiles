#!/bin/bash

bash /root/start.sh

set -e

webPath=/var/www/html

# Función que crea un servidor node
init_Npm() {
    if ! [ -d $webPath ]
     then
        mkdir -p webPath
    fi
    cd $webPath
    npm init -y
}


# Si no existe un package.json significa que es nuevo por lo que lo iniciamos
if ! [ -f $webPath/package.json ]
 then
    init_Npm
    # Cambiar el objeto de scripts por el mio personalizado en el package.json
    jq '.scripts = { start: "npm index.js" }' package.json > package.json.tmp
    mv package.json.tmp package.json
    # Cambiar el valor de name por el mio personalizado en el package.json
    jq '.name = "plantilla node" ' package.json > package.json.tmp
    mv package.json.tmp package.json
    # Cambiar el valor del author por el mio personalizado en el package.json
    jq '.author = "Adrianas Vitys" ' package.json > package.json.tmp
    mv package.json.tmp package.json
fi

cd $webPath
npm install # Para actualizar las dependencias

echo "Imagen Node Terminada"

tail -f /dev/null