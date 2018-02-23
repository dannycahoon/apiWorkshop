# Environments
Below are some of the options for getting an API Platform CS environment.  For Apiary, there is one multi-tenant service that is available.  You can perform most of the functionality with a free account at http://apiary.io  These environments are for accessing API Platform CS which is currently a single tenant service on Oracle Public Cloud.  Once API Platform Autonomous becomes available, some of these instructions may change.

## Virtual Machine
You can [download](ftp://slcak712.us.oracle.com/vmimages/APICS/) a VM if you are connected to VPN or in an Oracle office (clear, or clear-corporate).  This allows you to run the complete API Platform within a Virtual Box VM.  After downloading, you can import the VM.  Make sure you have Virtual Box configured with the following:
1. You should have at least 10GB memory allocated to the VM.  Your host machine should have 16GB minimum

Once you start the VM, it should come up with a Linux desktop with a browser opened that has an information page guiding you on how to use the VM environment.  If you are asked for an OS password, use "oracle"

You will have full admin rights to this environment so you should not be limited in any way to perform all tutorials.

## Devops
Members of engineering can set up an API Platform CS env within their devops machine by following the [directions to set up API Platform](../../README.md)

You will have full admin rights to this environment so you should not be limited in any way to perform all tutorials.

## PM Demo Environment
A [demo environment](https://oc-129-150-76-122.compute.oraclecloud.com/apiplatform) is maintained on Oracle Public Cloud.  You must not be on VPN or on internal Oracle (clear, clear-corporate) to access this environment.

Here are the following generic users and passwords that are shared.
* API Manager: api-manager-user/0racl3iPa$$U5r
* API Gateway Manager: api-gateway-manager/0racl3iPa$$U5r
* APP Developer User: app-dev-user/0racl3iPa$$U5r
* Service Manager: service-manager-user/0racl3iPa$$U5r

You do not have full admin rights to this environment.  Not all tutorials will work here.  For example, a tutorial involving grants may run into conflicts given the shared nature of this environment.

## GSE Demo Central
GSE provides the capabilities to set up API Platform for short-term demos.

Use demo.oracle.com.  Select "UCM with Classic Focus".  That will set up a cloud domain, which you can provision API Platform CS management Service.

[Here is an example of provisioning](https://stbeehive.oracle.com/content/dav/st/API%20PLATFORM/Public%20Documents/Demos/GSE/APIPCS%20Provisioning%20on%20GSE%20Instructions.docx)

You can also provision an IaaS Compute to install the gateway.

