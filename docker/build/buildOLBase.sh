#!/bin/bash
BUILD_STAGE=/scratch/${USER}/stage/images

docker build -t olbase_v1 -f ./olbase/olbase.dockerfile ./olbase

ID=$(docker run -d olbase_v1 /bin/bash)
docker export $ID | gzip -c > ${BUILD_STAGE}/olbase.tgz
gzip -dc ${BUILD_STAGE}/olbase.tgz | docker import - olbase

docker rm $ID
docker rmi olbase_v1


