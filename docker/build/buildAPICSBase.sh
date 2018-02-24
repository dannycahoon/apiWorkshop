#!/bin/bash

# Set a variable for the location of the build repo in the container
BUILD_REPO=/scratch/oracle/gitlocal/soa-apiplatform
BUILD_SCRIPT=${BUILD_REPO}/buildAPICSBase.sh
BUILD_STAGE=/scratch/${USER}/stage/images

# Set variables for the build scripts
SSH_HOME=${HOME}/.ssh
BUILD_RESOURCES_DIR=${HOME}/docker/build/apics_base

BUILD_SSH_HOME=$BUILD_RESOURCES_DIR/home/oracle/.ssh

# Prepare SSH keys for container to use
cp  $SSH_HOME/* $BUILD_SSH_HOME

# Build the container from apics_base that inherits olbase
docker build -t apics_base -f $BUILD_RESOURCES_DIR/apics_base.dockerfile $BUILD_RESOURCES_DIR

# Remove SSH keys from staging area
rm $BUILD_SSH_HOME/*

docker run -d --name=apics_base apics_base tail -f /dev/null

docker exec -u oracle apics_base ${BUILD_SCRIPT}
docker exec -u oracle apics_base rm -f ${BUILD_SCRIPT}
docker exec apics_base rm -Rf /tmp/*
docker cp apics_base:/scratch/oracle/build.label $BUILD_STAGE/build.label

docker stop apics_base 
docker export apics_base | gzip -c > ${BUILD_STAGE}/apics_base.tgz



