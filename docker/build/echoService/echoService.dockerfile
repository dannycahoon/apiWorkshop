FROM node:latest

# Copy mockService.js and Package.json into container
COPY usr/src/app/ /usr/src/app/

WORKDIR /usr/src/app

# Set Env Variables for Oracle Proxy servers
RUN npm config set proxy http://www-proxy.us.oracle.com:80 && npm config set https-proxy http://www-proxy.us.oracle.com:80 

# Install Required Node packages
RUN npm install -g express && npm install -g body-parser 

# Unset proxy server configs
RUN npm config rm proxy && npm config rm https-proxy

ENTRYPOINT node echoService.js

EXPOSE 8888



