#!/bin/bash
#

MW_HOME=/scratch/rwunderl/gitlocal/soa-apiplatform/out/install/MW_HOME
JAVA_HOME=/data/gitlocal/soa-apiplatform-beta-1/env/jdk8/1.8.0-40-08-140930.1.8.0.40.0B08/jdk1.8.0_40
USER_COUNT=100
USER_PWD=welcome1

USER_PREFIX=api-manager-user-
USER_ROLE=APIManager

#USER_PREFIX=api-gateway-user-
#USER_ROLE=GatewayManager

#USER_PREFIX=app-dev-user-
#USER_ROLE=ApplicationDeveloper


createUser() {
    data="{items:[{user:{id: \"$USER\" }}]}"
    url="http://slc06mxc.us.oracle.com:7201/apiservices/admin/roles/$USER_ROLE/members"

#    echo "user ->  $USER"
#    echo "user ->  $url"
#    echo "data ->  $data"

    echo "adding role to $USER"
    curl -X POST -d "$data" -H "Content-Type: application/json" -u weblogic:welcome1 $url
}

createUsers() {
    counter=1
    while (($counter <= $USER_COUNT)); do
        USER="$USER_PREFIX$counter"
        createUser
        counter=$(($counter+1))
    done
}



$MW_HOME/oracle_common/common/bin/wlst.sh users.py $USER_COUNT $USER_PREFIX $USER_PWD

createUsers
