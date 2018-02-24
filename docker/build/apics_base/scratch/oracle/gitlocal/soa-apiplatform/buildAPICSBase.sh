#!/bin/bash

# Bootstrap the environment
source setup.sh

# Build the project
gradle -p /scratch/oracle/gitlocal/soa-apiplatform/source build
gradle -p /scratch/oracle/gitlocal/soa-apiplatform/source zipGatewayInstaller


# Remove the Source Directories
#rm -Rf api.wptg infra qa README.md setup* source

