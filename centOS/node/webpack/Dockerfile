FROM adrxking_centos-node

COPY ./start-webpack.sh /root
COPY ./package.json /usr/share/html/package.json.new
COPY ./webpack.config.js /usr/share/html/webpack.config.js.new
COPY ./webpack.config.build.js /usr/share/html/webpack.config.build.new
COPY ./webpack.config.development.js /usr/share/html/webpack.config.development.js.new
COPY ./.eslintrc.js /usr/share/html/.eslintrc.js.new
COPY ./.editorconfig /usr/share/html/.editorconfig.new

RUN chmod +x /root/start-webpack.sh

RUN dos2unix /root/start-webpack.sh

ARG NEW

ENTRYPOINT [ "sh","/root/start-webpack.sh" ]
