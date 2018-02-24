#!/bin/bash

DOMAIN_ROOT=/scratch/oracle/gitlocal/soa-apiplatform/out/domains

$DOMAIN_ROOT/gateway1/bin/stopWebLogic.sh
$DOMAIN_ROOT/drt/bin/stopWebLogic.sh

exit

