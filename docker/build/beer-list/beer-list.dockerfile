FROM node:latest

# Copy mockService.js and Package.json into container
COPY usr/src/app/ /usr/src/app/

WORKDIR /usr/src/app

# Set Env Variables for Oracle Proxy servers
RUN npm config set proxy http://www-proxy.us.oracle.com:80 && npm config set https-proxy http://www-proxy.us.oracle.com:80 

# Install Required Node packages
RUN npm install -g express && npm install -g logfmt

# Unset proxy server configs
RUN npm config rm proxy && npm config rm https-proxy

ENV NODE_PATH /usr/local/lib/node_modules
ENV PORT 7878

EXPOSE 7878

CMD node /usr/src/app/server.js

