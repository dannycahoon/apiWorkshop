#!/bin/bash
docker run -d --hostname=apics.oracle.com --link oradb:oradb -p 8001:8001 -p 7201:7201 --name=apics -u oracle apics /scratch/oracle/gitlocal/soa-apiplatform/startEnv.sh


