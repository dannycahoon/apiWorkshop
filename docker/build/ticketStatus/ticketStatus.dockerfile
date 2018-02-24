FROM    python:2.7.13
MAINTAINER robert.wunderlich@oracle.com

COPY build.sh /
RUN chmod 755 /build.sh

RUN /build.sh

EXPOSE 5000

