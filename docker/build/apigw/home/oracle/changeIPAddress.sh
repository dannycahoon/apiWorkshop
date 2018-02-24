#!/bin/bash
set -e
if [ "$1" == "" ]; then
  echo "Usage: changeIPAddress.sh new_IP_Address"
  echo "       Optional: set WLS_HOME environment variable to the WebLogic Home directory prior to running this script. Default is WLS_HOME is ."
  echo "       Optional: set DOMAIN_DIR to the directory of the domain. Default is \$WLS_HOME/user_projects/domains/services-gatekeeper-domain/"
  echo ""
  echo "       NOTE: Stop all Java DB and Java OCSG processes before running this command."
  exit 0
fi
#If WLS_HOME is not set, set it to the default
if [ "$WLS_HOME" == "" ]; then
  WLS_HOME=.
fi
#If DOMAIN_DIR is not set, set it to the default
if [ "$DOMAIN_DIR" == "" ]; then
  DOMAIN_DIR=$WLS_HOME/user_projects/domains/services-gatekeeper-domain/
fi
#Set the IP address
NEW_IP=$1

sed -E -i.backup "s/ADMIN_URL=\"http:\/\/.*:7001\"/ADMIN_URL=\"http:\/\/$NEW_IP:7001\"/g" $DOMAIN_DIR/bin/startManagedWebLogic.sh
sed -E -i.backup "s/ADMIN_URL=\"t3:\/\/.*:7001\"/ADMIN_URL=\"t3:\/\/$NEW_IP:7001\"/g" $DOMAIN_DIR/bin/stopManagedWebLogic.sh
sed -E -i.backup "s/ADMIN_URL=\"t3:\/\/.*:7001\"/ADMIN_URL=\"t3:\/\/$NEW_IP:7001\"/g" $DOMAIN_DIR/bin/stopWebLogic.sh
sed -E -i.backup -e "s/\<listen-address\>.*\<\/listen-address\>/\<listen-address\>$NEW_IP\<\/listen-address\>/g" -e "s/\<address\>.*\<\/address\>/\<address\>$NEW_IP\<\/address\>/g" -e "s/\<cluster-address\>.*:8001\<\/cluster-address\>/\<cluster-address\>$NEW_IP:8001\<\/cluster-address\>/g" $DOMAIN_DIR/config/config.xml

sed -E -i.backup -e "s/\<url\>jdbc:derby:\/\/.*:1527\/gatekeeper;create=true;user=gatekeeper\<\/url\>/\<url\>jdbc:derby:\/\/$NEW_IP:1527\/gatekeeper;create=true;user=gatekeeper\<\/url\>/g" -e "s/\<value\>[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+<\/value\>/<value\>$NEW_IP\<\/value\>/g" $DOMAIN_DIR/config/jdbc/wlng-jdbc.xml

sed -E -i.backup -e "s/\<url\>jdbc:derby:\/\/.*:1527\/gatekeeper;create=true;user=gatekeeper\<\/url\>/\<url\>jdbc:derby:\/\/$NEW_IP:1527\/gatekeeper;create=true;user=gatekeeper\<\/url\>/g" -e "s/\<value\>[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+<\/value\>/<value\>$NEW_IP\<\/value\>/g" $DOMAIN_DIR/config/jdbc/wlng-localTX-jdbc.xml

sed -E -i.backup -e "s/IP_ADDRESS=.*/IP_ADDRESS=$NEW_IP/g" $WLS_HOME/wlserver/.product.properties

COHERENCE=`find $DOMAIN_DIR -name "*-coherence.xml" | head -n 1`
sed -E -i.backup -e "s/\<unicast-listen-address\>.*\<\/unicast-listen-address\>/\<unicast-listen-address\>$NEW_IP\<\/unicast-listen-address\>/g" -e "s/\<listen-address\>.*\<\/listen-address\>/\<listen-address\>$NEW_IP\<\/listen-address\>/g" $COHERENCE


