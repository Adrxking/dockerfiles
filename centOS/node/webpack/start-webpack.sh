#!/bin/bash
set -e

bash /root/start-node.sh

webPath=/usr/share/html

cd $webPath

if [ ${NEW} == true ]
 then
    mkdir app fonts offline partials public shared styles app/animations app/clases app/components \
    app/pages app/shaders app/utils app/images app/videos styles/base styles/components styles/pages \
    styles/shared styles/utils views/pages views/partials

    touch ./app/index.js
    touch ./shared/index.scss
    if [ -f package.json ]
     then
        rm package.json
    fi
    if [ -f webpack.config.js ]
     then
        rm webpack.config.js
    fi
    if [ -f webpack.config.build.js ]
     then
        rm webpack.config.build.js
    fi
    if [ -f webpack.config.development.js ]
     then
        rm webpack.config.development.js
    fi
    if [ -f .editorconfig ]
     then
        rm .editorconfig
    fi
    if [ -f .eslintrc.js ]
     then
        rm .eslintrc.js
    fi
    npm install webpack webpack-cli webpack-dev-server \
    webpack-merge postcss-loader babel-loader sass-loader \
    file-loader sass image-minimizer-webpack-plugin \
    imagemin-optipng imagemin-jpegtran imagemin-gifsicle \
    imagemin-svgo glslify-loader raw-loader eslint \
    eslint-config-standard eslint-loader eslint-plugin-import \
    eslint-plugin-promise eslint-plugin-standard \
    terser-webpack-plugin imagemin --save-dev

    mv package.json.new package.json
    mv webpack.config.js.new webpack.config.js
    mv webpack.config.build.js.new webpack.config.build.js
    mv webpack.config.development.js.new webpack.config.development.js
    mv .editorconfig.new .editorconfig
    mv .eslintrc.js.new .eslintrc.js
else
    rm package.json.new
    rm webpack.config.js.new
    rm webpack.config.build.js.new
    rm webpack.config.development.js.new
fi

if [ ${DEV} == true ]
then
  npm start
else
  npm run build
fi
