#!/bin/bash

export APICS_ROOT=/scratch/oracle/gitlocal/soa-apiplatform
export DOMAIN_ROOT=$APICS_ROOT/out/domains

function stop_wls {
  export FORCE_SHUTDOWN=true
  ${DOMAIN_ROOT}/gateway1/bin/stopWeblogic.sh
  ${DOMAIN_ROOT}/drt/bin/stopWebLogic.sh
  exit;
}
trap stop_wls SIGTERM SIGINT SIGQUIT

# Remove any leftover lock and dat files before startup
find . -name "*.lok" -print | xargs rm -f {}\;
find . -name "*.DAT" -print | xargs rm -f {}\;

# Start API Management Tier
${DOMAIN_ROOT}/drt/startServer.sh >& $APICS_ROOT/drt.out &

# Start API Gateway Tier
${DOMAIN_ROOT}/gateway1/startWebLogic.sh >& $APICS_ROOT/gateway1.out &

wait

