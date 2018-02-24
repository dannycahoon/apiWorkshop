#!/bin/bash

gnome-terminal -t "APICS Management Server Log" -e "docker exec -u oracle -it apics tail -f /scratch/oracle/gitlocal/soa-apiplatform/drt.out" &

gnome-terminal -t "APICS Gateway Log" -e "docker exec -u oracle -it apics tail -f /scratch/oracle/gitlocal/soa-apiplatform/gateway1.out"

