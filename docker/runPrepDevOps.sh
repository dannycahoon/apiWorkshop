#!/bin/bash

export http_proxy=http://www-proxy.us.oracle.com:80
export HTTP_PROXY=$http_proxy
export https_proxy=http://www-proxy.us.oracle.com:80
export HTTPS_PROXY=$https_proxy

curl -fsSL https://get.docker.com/ | sh
systemctl stop docker
mkdir /scratch/docker
rm -Rf /var/lib/docker
ln -s /scratch/docker /var/lib/docker

mkdir /etc/systemd/system/docker.service.d
echo "[Service]\nEnvironment=\"HTTP_PROXY=http://www-proxy.us.oracle.com:80\"" > /etc/systemd/system/docker.service.d/http-proxy.conf

systemctl daemon-reload
systemctl enable docker
systemctl start docker


