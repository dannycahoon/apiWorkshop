#!/bin/bash

# Set some Env variables that will be consistent across containers.
export APIGW_ROOT=/home/oracle/apigw
export APIGW_CONFIG=/home/oracle/apigw_config
export DOMAIN_ROOT=$APIGW_ROOT/domain
export JAVA_HOME=/usr/java/jdk1.8.0_51
export PATH=${PATH}:$JAVA_HOME/bin

# If the container is started for the first time, the domain needs to be 
# created
function createDomain {
    cd $APIGW_CONFIG
    python $APIGW_CONFIG/installAPIGateway.py -f $APIGW_CONFIG/gateway-props.json -a createDomain

    python $APIGW_CONFIG/installAPIGateway.py -f $APIGW_CONFIG/gateway-props.json -a start

  # Wait for the managed server to fully start before we try to register with
  # API Platform Cloud Service Managment
  while [ `grep RUNNING $DOMAIN_ROOT/*/startMServer.out | wc -l` == 0 ]
  do
    sleep 5
  done

# If we are just adding a node to an existing gateway, then will just join
# otherwise we will createAndJoin
  if [ $2 == "addNode" ]; then
    python $APIGW_CONFIG/installAPIGateway.py -f $APIGW_CONFIG/gateway-props.json -a join
  else
    python $APIGW_CONFIG/installAPIGateway.py -f $APIGW_CONFIG/gateway-props.json -a createAndJoin
  fi

}

function stop_wls {
  export FORCE_SHUTDOWN=true
  ${DOMAIN_ROOT}/gateway1/bin/stopWeblogic.sh
  ${DOMAIN_ROOT}/drt/bin/stopWebLogic.sh
  exit;
}
trap stop_wls SIGTERM SIGINT SIGQUIT

# Check to see if this is first time start and configure the domain.
if [ ! -f ${DOMAIN_ROOT} ]; then
  if [ $1 = "waitForNewConfig" ]; then
    while [ `diff ${HOME}/gateway-props.json $APIGW_CONFIG/gateway-props.json | wc -l` = 0 ]
    do
      echo "Waiting for updated gateway-props.json......"
      sleep 5
    done
    cp ${HOME}/gateway-props.json $APIGW_CONFIG/gateway-props.json
  fi
  
  createDomain;
else
  cd $APIGW_CONFIG
  python $APIGW_CONFIG/installAPIGateway.py -f gateway-props.json -a start
fi
wait

