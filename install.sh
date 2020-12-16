#!/usr/bin/env bash

#install ipfs node
set -x
IPFSGATEWAY="http://proofs.file.cash:8080"
webip='209.94.78.1'
cid=$(curl -s -k -I -H "Host: dist.ipfs.io" https://${webip}/ | grep CID)
cid=$(echo ${cid}|awk '{match($0,/_CID-.*/);print substr($0,RSTART+5,RLENGTH-7)}')
versions=$(curl -s ${IPFSGATEWAY}/ipfs/${cid}/go-ipfs/versions | tail -n 1)
curl -s -k ${IPFSGATEWAY}/ipfs/${cid}/go-ipfs/${versions}/go-ipfs_${versions}_linux-amd64.tar.gz -o go-ipfs_${versions}_linux-amd64.tar.gz
tar -zxvf go-ipfs_${versions}_linux-amd64.tar.gz
cp go-ipfs/ipfs /usr/local/bin/ipfs
chmod +x /usr/local/bin/ipfs

if [ ! -d /data  ];then
  mkdir /data
fi
sed -i "/IPFS_PATH/d" /etc/profile
echo "export IPFS_PATH=/data/ipfsrepo" >> /etc/profile
source /etc/profile

cp ipfsgateway/ipfs.service /lib/systemd/system/ipfs.service

ipfs init
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin "[\"*\"]"
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Credentials "[\"true\"]"
ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods "[\"PUT\", \"POST\", \"GET\"]"
ipfs config Datastore.StorageMax 100GB
ipfs config --json Experimental.FilestoreEnabled true

systemctl enable ipfs.service
systemctl start ipfs.service
