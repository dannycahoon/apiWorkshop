#!/bin/bash


docker run --net="apics_nw" --ip="172.27.0.3" --link oradb:oradb --link eserv1:eserv1.oracle.com --link eserv2:eserv2.oracle.com --link ts-app:eserv3.oracle.com -u oracle -p 7201:7201 -p 8001:8001 -p 7202:7202 -p 7002:7002 -d --name=apics --hostname="apics.oracle.com" apics /scratch/oracle/gitlocal/soa-apiplatform/startEnv.sh
