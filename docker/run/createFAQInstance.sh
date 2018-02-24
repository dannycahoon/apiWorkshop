#!/bin/bash
docker run --name faq-mysql -e MYSQL_ROOT_PASSWORD=R3dW00d -d mysql
docker run --name faq --link faq-mysql:mysql -p 9080:80 -d -e "HTTP_PROXY=www-proxy.us.oracle.com:80" -e "HTTPS_PROXY=www-proxy.us.oracle.com:80" -e "http_proxy=www-proxy.us.oracle.com:80" -e "https_proxy=www-proxy.us.oracle.com:80" wordpress
