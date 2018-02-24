FROM    olbase
MAINTAINER robert.wunderlich@oracle.com

# Create Scratch directory
RUN mkdir /scratch

# Copy ssh keys and known hosts files
RUN mkdir /home/oracle/.ssh
COPY home/oracle/.ssh/ /home/oracle/.ssh/

# Create build directory
RUN mkdir -p /scratch/oracle/gitlocal
RUN mkdir -p /u01/app/oracle/product/12.1.0/dbhome_1/jdbc/lib

# Make sure Oracle owns necessary directories
RUN chown -R oracle:dba /scratch
RUN chown -R oracle:dba /home/oracle
RUN chown -R oracle:dba /u01

# Switch to oracle user
USER oracle

# Switch to Repo root
WORKDIR /scratch/oracle/gitlocal

# Define git settings for authorized user
RUN git config --global user.name "Robert Wunderlich" && git config --global user.email "robert.wunderlich@oracle.com"

# Pull APICS Code for building the API Manager/Gateway tier
RUN git clone -b apip_17.2.1 ssh://git@orahub.oraclecorp.com/fmw-soa-dev/soa-apiplatform.git


# Capture a log of the git repository
WORKDIR /scratch/oracle/gitlocal/soa-apiplatform
RUN git log -n 1 --date=iso --format="Build from branch %d commit: %h on %ai" > /scratch/oracle/build.label

# Copy resource scripts, and DB config info (will update this for DB container later)
COPY scratch/oracle/gitlocal/soa-apiplatform/ /scratch/oracle/gitlocal/soa-apiplatform/

# Move ojdbc6.jar to expected location for build.gradle script to work.
RUN mv /scratch/oracle/gitlocal/soa-apiplatform/ojdbc6.jar /u01/app/oracle/product/12.1.0/dbhome_1/jdbc/lib

# Make sure all permissions are good
USER root
RUN chown -R oracle:dba /scratch && chown -R oracle:dba /u01

WORKDIR /scratch/oracle/gitlocal/soa-apiplatform
USER oracle
CMD bash

