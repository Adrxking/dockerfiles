#!/bin/bash

bash /root/start-node.sh

set -e

webPath=/var/www/html

npm i nuxt

# Si no existe la carpeta pages y el archivo index.vue lo crea para que el proyecto inicie
if ! [ -d $webPath/pages ]
 then
    mkdir $webPath/pages
fi

if ! [ -f $webPath/pages/index.vue ]
 then
    touch $webPath/pages/index.vue
fi

# Si no existe un package.json significa que es nuevo por lo que lo iniciamos
if ! [ -f $webPath/package.json ]
 then
    init_Npm
    # Cambiar el objeto de scripts por el mio personalizado en el package.json
    jq '.scripts = { "dev": "nuxt", "build": "nuxt build", "generate": "nuxt generate", "start": "nuxt start" }' package.json > package.json.tmp
    mv package.json.tmp package.json
    # Cambiar el valor de name por el mio personalizado en el package.json
    jq '.name = "plantilla nuxt" ' package.json > package.json.tmp
    mv package.json.tmp package.json
fi

cd $webPath
npm install # Para actualizar las dependencias

echo "Imagen Nuxt Terminada"

npm dev