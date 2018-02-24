#!/bin/bash
BUILD_STAGE=/scratch/${USER}/stage/images

docker build -t oradb_base -f ./oradb/oradb.dockerfile ./oradb

ID=$(docker run -d oradb_base /bin/bash)
docker export $ID | gzip -c > ${BUILD_STAGE}/oradb.tgz
gzip -dc ${BUILD_STAGE}/oradb.tgz | docker import - oradb

docker rm $ID
docker rmi oradb_base


