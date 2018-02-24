FROM    olbase
MAINTAINER robert.wunderlich@oracle.com

RUN mkdir /u01 && chown oracle:dba /u01
USER    oracle
WORKDIR /home/oracle
RUN wget http://adc1140327.us.oracle.com/oracleDb12c/linuxamd64_12102_database_1of2.zip && wget http://adc1140327.us.oracle.com/oracleDb12c/linuxamd64_12102_database_2of2.zip

RUN unzip linuxamd64_12102_database_1of2.zip && rm linuxamd64_12102_database_1of2.zip && unzip  linuxamd64_12102_database_2of2.zip && rm linuxamd64_12102_database_2of2.zip

# COPY resources/ /home/oracle/


