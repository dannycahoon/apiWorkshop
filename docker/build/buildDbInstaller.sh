#!/bin/bash
BUILD_STAGE=/scratch/${USER}/stage/images

docker build -t dbinstaller -f ./dbInstaller/dbInstaller.dockerfile ./dbInstaller

ID=$(docker run -d dbinstaller /bin/bash)
docker export $ID | gzip -c > ${BUILD_STAGE}/dbinstaller.tgz

docker rm $ID
docker rmi dbinstaller

gzip -dc ${BUILD_STAGE}/dbinstaller.tgz | docker import - dbinstaller



