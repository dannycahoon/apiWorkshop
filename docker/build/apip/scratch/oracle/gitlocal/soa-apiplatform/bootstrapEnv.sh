#!/bin/bash

# Bootstrap the environment
source setup.sh
export http_proxy=http://www-proxy.us.oracle.com:80
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy

# Create APICS/OCSG domains
cd /scratch/oracle/gitlocal/soa-apiplatform/source 

gradle build createSeedDb createWlsDomain installLogstash startWlsDomain waitForWlsDomain createTenants 

# Remove the Source Directories
#rm -Rf /scratch/oracle/gitlocal/soa-apiplatform/api.wptg /scratch/oracle/gitlocal/soa-apiplatform/infra /scratch/oracle/gitlocal/soa-apiplatform/qa /scratch/oracle/gitlocal/soa-apiplatform/README.md /scratch/oracle/gitlocal/soa-apiplatform/setup* /scratch/oracle/gitlocal/soa-apiplatform/source /scratch/oracle/gitlocal/soa-apiplatform/out/build

