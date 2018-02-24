#!/bin/bash

# Set a variable for the location of the build repo in the container
BUILD_REPO=/scratch/oracle/gitlocal/soa-apiplatform
BUILD_SCRIPT=${BUILD_REPO}/bootstrapEnv.sh
BUILD_STAGE=/scratch/${USER}/stage/images

# Set variables for the build scripts
SSH_HOME=${HOME}/.ssh
BUILD_RESOURCES_DIR=${HOME}/docker/build/apip

BUILD_SSH_HOME=$BUILD_RESOURCES_DIR/home/oracle/.ssh

# Prepare SSH keys for container to use
cp  $SSH_HOME/* $BUILD_SSH_HOME

# Build the container from apip_base that inherits olbase
docker build -t apip_base -f $BUILD_RESOURCES_DIR/apip.dockerfile $BUILD_RESOURCES_DIR

# Remove SSH keys from staging area
#rm $BUILD_SSH_HOME/*

# Spin up a continer to run the bootstrap script which will install the 
# middle-tier (drt and gateway1 domains).  This does not work in the build
# file because we need to specify the hostname for the install which is used
# by various installation scripts.
#
# For our internal use, we are just using a static hostname for the build and
# will use the same name for any containers instantiated from the image.

# Instruction if building with locally installed DB.
# docker run -d --add-host oradb:`/sbin/ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'` --hostname="apics.oracle.com" --name=apip_base apip_base tail -f /dev/null


# Option if need to get into the container to manually run the build
#docker run -it --add-host apidb:`/sbin/ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'` --hostname="apics.oracle.com" --name=apip_base apip_base bash

docker run --net="apics_nw" --ip="172.27.0.3" -d --link oradb:oradb --hostname="apics.oracle.com" --name=apip_base apip_base tail -f /dev/null

docker exec apip_base ${BUILD_SCRIPT}
# docker exec apip_base rm -f ${BUILD_SCRIPT}
# docker exec apip_base rm -Rf /tmp/*
# docker cp apip_base:/scratch/oracle/git.log $BUILD_STAGE
# docker exec apip_base rm -f /scratch/oracle/git.log
# docker exec apip_base /scratch/oracle/gitlocal/soa-apiplatform/stopEnv.sh
# 
# docker stop -t 190 apip_base 
# docker export apip_base | gzip -c > ${BUILD_STAGE}/apics.tgz
# gzip -dc ${BUILD_STAGE}/apics.tgz | docker import - apics --change "CMD /scratch/oracle/gitlocal/soa-apiplatform/startEnv.sh"


#docker stop -t 190 oradb
#docker export oradb | gzip -c > ${BUILD_STAGE}/oradb.tgz
#docker start oradb

#docker rm apip_base
#docker rmi apip_base

