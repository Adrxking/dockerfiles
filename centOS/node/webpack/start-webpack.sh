#!/bin/bash
set -e

bash /root/start-node.sh

npm install -y

npm run dev
