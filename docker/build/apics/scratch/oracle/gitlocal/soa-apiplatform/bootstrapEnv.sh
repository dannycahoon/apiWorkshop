#!/bin/bash

# Bootstrap the environment
source setup.sh

# Create APICS/OCSG domains
cd /scratch/oracle/gitlocal/soa-apiplatform/source 


# Gradle tasks that are normally executed from functions 
# in refresh_dev_instance.sh

# Functions referenced are "build" and "run".  Since this is 
# in a docker continer, we don't need to use stopserver, 
# cleandomaininstalls or copyGatewayInstaller

# Gradle commands from "build" (assumed 12c DB)
gradle build
gradle createRcuDb createSeedDb createWlsDBDomain
gradle installLogstash

# Using OCSG Compact Domain
gradle createOcsgDb createOcsgDomain

# Starting Servers
gradle startWlsDomain waitForWlsDomain
gradle startOcsgDomain waitForOcsgDomain

# Perform initial setup work
gradle createTenants registerGateway
gradle startLogStash


# Remove the source files, etc
rm -Rf /home/oracle/.ssh/* /home/oracle/.gitconfig -Rf /scratch/oracle/gitlocal/soa-apiplatform/.git /scratch/oracle/gitlocal/soa-apiplatform/infra /scratch/oracle/gitlocal/soa-apiplatform/source 
find /scratch/* -maxdepth 1 -type d | grep -v "oracle" | xargs rm -rf
