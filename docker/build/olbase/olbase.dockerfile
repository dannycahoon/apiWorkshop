FROM    oraclelinux:6
MAINTAINER robert.wunderlich@oracle.com

# Set Env Variables for Oracle Proxy servers
ENV http_proxy=http://www-proxy.us.oracle.com:80 HTTP_PROXY=http://www-proxy.us.oracle.com:80 https_proxy=http://www-proxy.us.oracle.com:80  HTTPS_PROXY=http://www-proxy.us.oracle.com:80 no_proxy=localhost,127.0.0.1,.us.oracle.com,.oraclecorp.com NO_PROXY=localhost,127.0.0.1,.us.oracle.com,.oraclecorp.com

# Run yum to get prerequisite packages
RUN yum -y install oracle-rdbms-server-12cR1-preinstall perl wget unzip git which tar python

# Cleanup files
RUN yum clean all
RUN rm -Rf /tmp/*
