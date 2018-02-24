#!/bin/bash
#


USER_COUNT=100

USER_PREFIX=api-manager-user-
USER_ROLE=APIManager

#USER_PREFIX=api-gateway-user-
#USER_ROLE=GatewayManager

#USER_PREFIX=app-manager-user-
#USER_ROLE=ApplicationDeveloper


deleteUser() {
    url="http://slc06mxc.us:7201/apiservices/admin/roles/$USER_ROLE/members/users/$USER"

    echo "removing role from $USER"
    curl -X DELETE -u weblogic:welcome1 $url
}

deleteUsers() {
    counter=1
    while (($counter <= $USER_COUNT)); do
        USER="$USER_PREFIX$counter"
        deleteUser
        counter=$(($counter+1))
    done
}



$MW_HOME/oracle_common/common/bin/wlst.sh delusers.py $USER_COUNT $USER_PREFIX

deleteUsers
