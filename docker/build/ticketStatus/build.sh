#!/bin/bash
export http_proxy=http://www-proxy.us.oracle.com:80
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy

pip install eve

