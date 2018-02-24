#!/bin/bash

#docker run --net="apics_nw" --ip="172.27.0.2" -d -p 1521:1521 --privileged=true --ipc=host --hostname=oradb --name=oradb -u oracle oradb /home/oracle/manage-oracle.sh


#docker run --net="apics_nw" --ip="172.27.0.2" -d --hostname=oradb --name=oradb -u oracle oradb /home/oracle/manage-oracle.sh

docker run --shm-size=1g --net="apics_nw" --ip="172.27.0.2" -d --hostname=oradb --name=oradb -u oracle oradb /home/oracle/manage-oracle.sh
