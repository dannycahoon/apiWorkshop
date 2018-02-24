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

${DOMAIN_ROOT}/drt/startServer.sh >& $APICS_ROOT/drt.out &

${DOMAIN_ROOT}/gateway1/startWebLogic.sh >& $APICS_ROOT/gateway1.out &

wait

