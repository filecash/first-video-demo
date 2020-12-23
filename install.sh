#!/usr/bin/env bash

#build web ui
cd webui
npm install
npm run build

#publish web ui
cd dist/
tar -zcvf ../webui.tar.gz ./*
cd ..

#install web ui
tar -zxvf webui.tar.gz -C /usr/local/openresty/nginx/html/
