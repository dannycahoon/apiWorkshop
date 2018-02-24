FROM    olbase
MAINTAINER robert.wunderlich@oracle.com

# Create wso2 directory
RUN mkdir /opt/wso2am-2.1.0

# Copy wso2 files into container
COPY wso2am-2.1.0 /opt/wso2am-2.1.0/

EXPOSE 9443 9763 8243 8280 10397 7711
WORKDIR /opt/wso2am-2.1.0
ENTRYPOINT ["bin/wso2server.sh"]

