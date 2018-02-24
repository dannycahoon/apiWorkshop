#!/bin/bash

# Set a variable for the location of the build repo in the container
BUILD_SCRIPT=/home/oracle/bootstrapEnv.sh
BUILD_STAGE=/scratch/${USER}/stage/images

# Set variables for the build scripts
SSH_HOME=${HOME}/.ssh
BUILD_RESOURCES_DIR=${HOME}/docker/build/apigw

BUILD_SSH_HOME=$BUILD_RESOURCES_DIR/home/oracle/.ssh

# Prepare SSH keys for container to use
cp  $SSH_HOME/* $BUILD_SSH_HOME

# Build the container from apigw_base that inherits olbase
docker build -t apigw_base -f $BUILD_RESOURCES_DIR/apigw.dockerfile $BUILD_RESOURCES_DIR

# Remove SSH keys from staging area
rm $BUILD_SSH_HOME/*

# Spinning up a container to bootstrap
docker run -d -u oracle --hostname="apigw.oracle.com" --name=apigw_base apigw_base tail -f /dev/null

docker exec -u oracle apigw_base ${BUILD_SCRIPT}
docker exec -u root apigw_base rm -f ${BUILD_SCRIPT}
docker exec -u root apigw_base rm -Rf /tmp/*
docker exec -u root apigw_base rm -Rf /scratch
docker exec -u root apigw_base rm -f /home/oracle/apigw_config/ocsg_generic.drop*.jar

docker cp apigw_base:/home/oracle/build.label $BUILD_STAGE/apigw.label

docker stop apigw_base 
docker export apigw_base | gzip -c > ${BUILD_STAGE}/apigw.tgz
gzip -dc ${BUILD_STAGE}/apigw.tgz | docker import - apigw 

docker rm apigw_base
docker rmi apigw_base

