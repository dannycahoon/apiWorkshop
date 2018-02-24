#!/bin/bash

docker run --net="apics_nw" --ip="172.27.0.3" --link oradb:oradb --link eserv1:eserv1.oracle.com --link eserv2:eserv2.oracle.com -u oracle -p 7201:7201 -d --name=apics --hostname="apics.oracle.com" apics /scratch/oracle/gitlocal/soa-apiplatform/startEnv.sh


