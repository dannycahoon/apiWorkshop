#!/bin/bash

echo "Stopping APICS Container......"
echo "Stopping servers gracefully...."
docker exec -u oracle apics /scratch/oracle/gitlocal/soa-apiplatform/stopEnv.sh

echo "Waiting for APICS container to fully shutdown..."
i="running"
while [ $i == "running" ]
do
  sleep 5
  i=`docker inspect --format='{{.State.Status}}' apics`
  echo -ne '.'
done
echo -ne '\n';

echo "Stopping Oracle Database Container....."

docker stop --time=30 oradb

docker ps -a

echo "Containers stopped..this terminal will exit in 15 seconds..."
sleep 15


