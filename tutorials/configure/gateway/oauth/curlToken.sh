#!/bin/bash

curl -u 250C2B2F2D8F48DB8366BB20BC172FD9_APPID:6bb67812-aa06-41d7-9c9e-2eb97427a
600 -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "grant_type=
client_credentials&scope=urn:opc:idm:__myscopes__" https://idcs-ba024b2844b3414a
a15581833cd48889.identity.oraclecloud.com/oauth2/v1/token

curl -u 79b000d754974f08b8698c42732df673:442eda5f-b8ae-44e8-996b-450dd1c301af -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "grant_type=client_credentials&scope=urn:opc:idm:__myscopes__" https://idcs-ba024b2844b3414aa15581833cd48889.identity.oraclecloud.com/oauth2/v1/token