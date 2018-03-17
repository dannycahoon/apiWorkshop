# Environments
Below are some of the options for getting an API Platform CS environment.  For Apiary, there is one multi-tenant service that is available.  You can perform most of the functionality with a free account at http://apiary.io  These environments are for accessing API Platform CS which is currently a single tenant service on Oracle Public Cloud.  Once API Platform Autonomous becomes available, some of these instructions may change.

## Note about roles in API Platform Cloud Service
There are multiple roles that perform actions within API Platform Cloud Service.  These are:

- API Manager: User who creates, and manages APIs
- Service Manager: User who creates and manages Services and Service Accounts
- Gateway Manager: User who creates and manages Gateways
- Gateway Runtime User: Account used by gateway node(s)
- Plan Manager: User who creates and manages Plans
- App Developer: User who consumes APIs to build applications
- Administrator: User who is responsible for the overall administration of API Platform cloud Service

As you choose your option to get access to API Platform Cloud Service, in some instances, the users may be pre-created for you and in others, you will need to create users as part of provisioning.  Note that in the tutorials, we will simply refer to the role.  For example, we might say "...log into API Platform as the *API Manager*...".  You should then know the user you should use to complete this task.

For Apiary, you will have only one user that you create when you sign up for the service.

Once you have made your selection and have access to your environment, you may want to consider putting the user credentials in a document for easy reference.

## Virtual Machine
You can [download](ftp://slcak712.us.oracle.com/vmimages/APICS/) a VM if you are connected to VPN or in an Oracle office (clear, or clear-corporate).  This allows you to run the complete API Platform within a Virtual Box VM.  After downloading, you can import the VM.  Make sure you have Virtual Box configured with the following:
1. You should have at least 10GB memory allocated to the VM.  Your host machine should have 16GB minimum

Once you start the VM, it should come up with a Linux desktop with a browser opened that has an information page guiding you on how to use the VM environment.  If you are asked for an OS password, use "oracle"

You will have full admin rights to this environment so you should not be limited in any way to perform all tutorials.

The VM has the following users pre-created:
  weblogic/welcome1: The admin user
  api-manager-user/welcome1: The API Manager User with APIManagers Role
  api-service-user/welcome1: The Service Manager User with ServiceManagers Role
  api-gateway-user/welcome1: The API Gateway User with APIGatewayManagers Role
  app-dev-user/welcome1: The Application Developer User with AppDevelopers Role
  plan-manager-user/welcome1: The Plan Manager User with PlanManagers Role
  gateway-runtime-user/welcome1: The Gateway Runtime Users with APIGatewayRuntimeUsers Role
  
  Except for weblogic and gateway-runtime-user, there are also the same users above with a "2" (e.g.: api-manager-user2) with the same password.  You can use these roles to differentiate different users who participate in the same group but may have different grants if you choose.
  

## Devops
Members of engineering can set up an API Platform CS env within their devops machine by following the [directions to set up API Platform](https://orahub.oraclecorp.com/fmw-soa-dev/soa-apiplatform/README.md)

You will have full admin rights to this environment so you should not be limited in any way to perform all tutorials.

## PM Demo Environment
A [demo environment](https://oc-129-150-76-122.compute.oraclecloud.com/apiplatform) is maintained on Oracle Public Cloud.  You must not be on VPN or on internal Oracle (clear, clear-corporate) to access this environment.

Here are the following generic users and passwords that are shared.
* API Manager: api-manager-user/0racl3iPa$$U5r
* API Gateway Manager: api-gateway-manager/0racl3iPa$$U5r
* APP Developer User: app-dev-user/0racl3iPa$$U5r
* Service Manager: service-manager-user/0racl3iPa$$U5r

You do not have full admin rights to this environment.  Not all tutorials will work here.  For example, a tutorial involving grants may run into conflicts given the shared nature of this environment.

When you use this environment, you need to be aware that others may be creating objects using the same credentials.  This environment is intended for you to be able to quickly try and demo the product.  It should not be used for deep-level admin/granting work.  If you use this environment, we highly recommend you add identifying elements to all of the objects you create in a tutorial.  For example, if the tutorial tells you to create an API named "TicketService", you might try creating "TicketService+your initials" (e.g. TicketServiceRW). 

When you create a request policy, you need to make sure you differentiate it.  When you deploy to a gateway, the end-point must be unique.  We suggest simply adding a date and your initials.  So for example if a tutorial suggests /ticketservice, you should use /`<date>`/`<your initials>`/ticketservice  (e.g. /180118/rw/ticketservice).  Yes, we know this is long, but it will help you to have a unique end-point so you can play nice with others.  Remember, this is just needed for the shared PM instance.  If you are using a VM or GSE, you would not have to differentiate your APIs in order to maintain separation from others using the same account.

## GSE Demo Central
GSE provides the capabilities to set up API Platform for short-term demos.

Use demo.oracle.com.  Select "UCM with Classic Focus".  That will set up a cloud domain, which you can provision API Platform CS management Service.

[Here is an example of provisioning](https://stbeehive.oracle.com/content/dav/st/API%20PLATFORM/Public%20Documents/Demos/GSE/APIPCS%20Provisioning%20on%20GSE%20Instructions.docx)

You can also provision an IaaS Compute to install the gateway.

>Note: You will create an admin user as part of the provisioning process.  You can use the admin user to perform all functions with API Platform, but we highly suggest creating other users in their specific roles like we did with the [VM option](#virtual-machine).  Using this admin user, you will need to log into the Weblogic console (after provisioning) and create users if you wish to showcase different user personas and the grants system.  Here it will be your choice of the users you create.

This requires some setup on your part, but guess what, you get to do just about anything you want!   Think of it as moving from an apartment to a single family house.  You know you want to paint the walls red, so go ahead and do it!
