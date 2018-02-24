FROM    oraclelinux:6
MAINTAINER robert.wunderlich@oracle.com

# Run yum to get prerequisite packages
RUN yum -y install oracle-rdbms-server-12cR1-preinstall perl wget unzip git which tar 

# Enable SSH
RUN sed '/pam_loginuid.so/s/^/#/g' -i /etc/pam.d/*
RUN chkconfig sshd on
EXPOSE 22

# Cleanup files
RUN yum clean all
RUN rm -Rf /tmp/*

