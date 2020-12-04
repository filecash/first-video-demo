#!/usr/bin/env bash

#install nginx
wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
apt -y install software-properties-common
add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
apt update
apt install openresty
