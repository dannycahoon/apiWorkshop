#!/bin/bash

docker run --net="apics_nw" --ip="172.27.0.2" -d -p 1522:1522 -p 8080:8080 --shm-size=1g --hostname=oradb --name=oradb oracle/database:11.2.0.2-xe

