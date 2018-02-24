#!/bin/bash

 docker run --hostname="eserv1.oracle.com" -d -p 7777:7777 -e MOCK_PORT=7777 --name=eserv1 mock-service

docker run --hostname="eserv2.oracle.com" -d -p 7778:7778 -e MOCK_PORT=7778 --name=eserv2 mock-service
