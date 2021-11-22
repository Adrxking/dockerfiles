FROM adrxking_centos-node

COPY ./start-webpack.sh /root
COPY ./package.json /root/package.json
COPY ./webpack.config.js /root/webpack.config.js
COPY ./webpack.config.build.js /root/webpack.config.build.js
COPY ./webpack.config.development.js /root/webpack.config.development.js
COPY ./.eslintrc.js /root/.eslintrc.js
COPY ./.editorconfig /root/.editorconfig

RUN chmod +x /root/start-webpack.sh

RUN dos2unix /root/start-webpack.sh

ARG NEW
ARG DEV

ENTRYPOINT [ "sh","/root/start-webpack.sh" ]
