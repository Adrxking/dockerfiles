#!/bin/bash

bash /root/start.sh

set -e

yum update \
&& yum install -y nginx \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& echo "daemon off;" >> /etc/nginx/nginx.conf