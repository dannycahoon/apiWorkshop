#!/bin/bash

echo "Stopping APICS Container......"
echo "Sending SIGTERM to running processes to shut down...."
docker stop --time=190 apics


echo "Stopping Oracle Database Container....."

docker stop --time=30 oradb

docker ps -a

echo "Containers stopped..restarting..."

echo "Starting Database Container......"
docker start oradb

# Giving the DB some time to start before launching APICS and having problems with datasource connection not being available.
sleep 15

echo "Starting APICS Container......."
docker start apics

docker ps

sleep 15
