#!/bin/bash

# For some reason this VM does not have /dev/mqueue created/mounted and that is needed for --ipc=host on the DB container, so checking for that here and setting it up.
if [ ! -d /dev/mqueue ]; then
  sudo mkdir /dev/mqueue
  sudo mount -t mqueue -t mqueue none /dev/mqueue
fi


echo "Starting Database Container......"
docker start oradb

# Giving the DB some time to start before launching APICS and having problems with datasource connection.
sleep 15

echo "Starting APICS Container......."
docker start apics

docker ps

echo "Containers are started and the servers are in the process of starting.  "

echo "You can use the Show APICS Server Logs icon to view the logs.  When you see RUNNING you will know you can go ahead and demo.  Please note, you may see some connection errors in the APICS Gateway log as the management tier is in the process of starting.  This should be safe to ignore....."

echo "If you close the terminals, the containers will NOT stop.  Before shutting down your VM, use the Stop APICS icon to stop the containers"


echo "This terminal will close in 30 seconds....."
sleep 30

