#!/bin/bash
set -e

bash /root/start-node.sh

webPath=/usr/share/html

cd $webPath

npm cache clean --force

npm cache verify

rm -rf ~/.npm

if [ ${NEW} == true ]
 then
    mkdir app fonts offline partials public shared styles views app/animations app/clases app/components \
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
    eslint-config-standard eslint-webpack-plugin eslint-plugin-import \
    eslint-plugin-promise terser-webpack-plugin imagemin \
    clean-webpack-plugin --save-dev

    mv /root/package.json package.json
    mv /root/webpack.config.js webpack.config.js
    mv /root/webpack.config.build.js webpack.config.build.js
    mv /root/webpack.config.development.js webpack.config.development.js
    mv /root/.editorconfig .editorconfig
    mv /root/.eslintrc.js .eslintrc.js
else
    rm /root/package.json
    rm /root/webpack.config.js
    rm /root/webpack.config.build.js
    rm /root/webpack.config.development.js
    mv /root/.editorconfig
    mv /root/.eslintrc.js
fi

if [ ${DEV} == true ]
then
  npm start
else
  npm run build
fi
