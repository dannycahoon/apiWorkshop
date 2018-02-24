#!/bin/bash

docker run --net="apics_nw" --ip="172.27.0.4" --link apics:apics.oracle.com --link eserv1:eserv1.oracle.com --link eserv2:eserv2.oracle.com -u oracle -p 8001:8001 -d --name=apigw --hostname="apigw.oracle.com" apigw tail -f /dev/null

