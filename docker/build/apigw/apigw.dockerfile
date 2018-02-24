FROM    olbase
MAINTAINER robert.wunderlich@oracle.com

# Create Build directory
RUN mkdir -p /scratch/oracle/gitlocal && mkdir /home/oracle/apigw

# Copy ssh keys and known hosts files
RUN mkdir /home/oracle/.ssh
COPY home/oracle/.ssh/ /home/oracle/.ssh/


# Make sure Oracle owns necessary directories
RUN chown -R oracle:dba /scratch && chown -R oracle:dba /home/oracle

# Add Java
RUN mkdir /usr/java
WORKDIR /usr/java
RUN wget http://jre.us.oracle.com/java/re/jdk/1.8.0_51/latest/bundles/linux-x64/jdk-8u51-linux-x64.tar.gz && tar -xzvf jdk-8u51-linux-x64.tar.gz && rm jdk-8u51-linux-x64.tar.gz

# Switch to oracle user
USER oracle

# Switch to Repo root
WORKDIR /scratch/oracle/gitlocal

# Define git settings for authorized user
RUN git config --global user.name "Robert Wunderlich" && git config --global user.email "robert.wunderlich@oracle.com"

# Pull APICS Code for building the API Manager/Gateway tier
RUN git clone -b beta-1.0.0-develop ssh://git@orahub.oraclecorp.com/fmw-soa-dev/soa-apiplatform.git

# Copy in resource files
COPY home/oracle/ /home/oracle/

# Capture a log of the git repository
WORKDIR /scratch/oracle/gitlocal/soa-apiplatform
RUN git log -n 1 --date=iso --format="Build from HEAD commit: %h on %ai" > /home/oracle/build.label

# Switch back to root
USER root

# Clean up ssh and confidential files
RUN rm -Rf /home/oracle/.ssh/* && rm -Rf /home/oracle/.gitconfig 

# Make sure all permissions are good
RUN chown -R oracle:dba /home/oracle

# Cleanup tmp files
RUN rm -Rf /tmp/*

# Finish up config
WORKDIR /home/oracle
USER oracle
CMD bash

