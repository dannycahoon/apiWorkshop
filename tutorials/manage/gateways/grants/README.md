# Granting Access to Gateways
Gateways are where APIs actually run.  The primary role responsible for the gateway is the GatewayManager.  Users may belong to that role, but they also need to have the appropriate grant on a gateway be able to view and act or request actions on the gateway.

## Before you begin
- You have an API Platform environment.  See [environments](../../../environments/README.md) for details on procuring an API Platform environment.
- Your environment has at least one gateway deployed and your user has the appropriate grants to manage that gateway.

> Note: If you are using a shared environment and/or tenant then you may neither have the necessary grant(s) on any of the gateway(s).  If you do not have the appropriate grants, then contact the administrator, or select one of the environment options where you are the administrator.

## Issuing Gateway Grants
1. Log into API Platform as a user with the *GatewayManager* role.  See [environments](../../../environments/README.md)
1. Select the Development Gateway (or whatever gateway you have deployed)
1. Click the *Users* tab
1. Take a moment to review all of the grants.  
  - Manage Gateway: Gateway Manager users issued this grant are allowed to manage API deployments to this gateway and manage the gateway itself.
  - View All Details: API and Gateway Manager users issued this grant are allowed to view all information about this gateway.
  - Deploy to Gateway: API and Gateway Manager users issued this grant are allowed to deploy or undeploy APIs to this gateway.
  - Request Deployment to Gateway: API Manager users issued this grant are allowed to request API deployments to this gateway. Requests must be approved by a Gateway Manager.
  - Node Service Account: Gateway Runtime service accounts are issued this grant to allow them to download configuration and upload statistics.
1. Click the grant name that you want to assign.
  1. Click Add Grantee.
  1. The Add Grantee dialog appears.
  1. From the Add Grantee dialog, select the user(s) or group(s) to which you want to issue the grant. You can select multiple users and groups.

> You cannot select users or groups that already have this grant; they are greyed out in the Add Grantee dialog.

Click Add.
The user(s) or group(s) are issued the gateway grant you chose.

## Learn more
To learn more about API Gateway Grants, read [Managing Gateway Grants](https://docs.oracle.com/en/cloud/paas/api-platform-cloud/apfad/managing-gateway-grants.html)