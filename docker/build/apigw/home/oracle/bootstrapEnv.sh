#!/bin/bash

export TERM=xterm
export JAVA_HOME=/usr/java/jdk1.8.0_51
export INVENTORY_HOME=/home/oracle/apigw_config
export BUILD_REPO=/scratch/oracle/gitlocal/soa-apiplatform
export BUILD_STAGE=/stage

# Bootstrap the environment
cd $BUILD_REPO
source $BUILD_REPO/setup.sh

# Build First
echo "Building source..."
gradle -p $BUILD_REPO/source build

# Create Gateway Zip Installer
echo "Building Gateway Zip Installer..."
gradle -p $BUILD_REPO/source zipGatewayInstaller

# Expand the installer
echo "Expanding Gateway Zip Installer..."

unzip $BUILD_REPO/out/installer/ocsg/ocsg_installer*.zip -d $INVENTORY_HOME

cd $INVENTORY_HOME

cp ${HOME}/gateway-props.json $INVENTORY_HOME

python $INVENTORY_HOME/installAPIGateway.py -f $INVENTORY_HOME/gateway-props.json -a install

