# Deploy an API
An API must be deployed to a gateway.  After successfully deploying the API, it receives requests at the endpoint you've configured and routes successful requests to the backend service. 

## Before you begin
1. You have an API Platform environment.  See [environments](../../../environments/README.md) for details on procuring an API Platform environment.
1. Your environment has at least one gateway deployed and your user has the appropriate grants to request deployments to that gateway.
1. You have completed the tutorial [Creating an API Policy Implementation](../../manage/create_api)

### Optional

To deploy the API:
1.	Click the Deployments tab.
2.	Click Deploy API.
3.	Select the Development Gateway.
4.	Select Active as the Initial Deployment State.
5.	(Optional) Complete the description field in as you like.
6.	Click Deploy.

Note: Observe what the state of the deployment is in.  Is it Deployed?  Requesting Deployment? Waiting? or Failed?

API Platform maintains access control through a series of grants on all objects.  In short, a grant specifies whether a user, or group of users can perform an action, or can request an action to be performed.  Grants can also control whether a user or group may see an object.

For example, when you deployed the API, you saw one gateway, the Development Gateway, but their can be many more that you don’t see simply because you don’t have the appropriate grant.

Since we are using a shared instance, you will skip the following steps in blue.  You can review these steps, and if you are using your own instance, then you would be able to perform the steps in blue in a demo scenario.  Your instructor will explain the reasons.

Make sure you complete 3.4 which is not in blue

 
3.1: Sign in as a Gateway Manager
Sign in to the Management Portal as a user with the API Manager role:
1.	Navigate to https://oc-129-150-76-122.compute.oraclecloud.com/apiplatform

Use these credentials to sign in:
○	username: api-gateway-user-<nn>, where <nn> is the number given by your instructor. 
○	password: OracleiPa$$Us3rXX (XX is your student number)
Because this user is only a Gateway Manager, only the Gateways tab is visible.
3.2: Approve the Pending Deployment Request
As the Gateway Manager, you are responsible for gateways, but you don’t automatically have access to all rights (or grants) on all gateways.

First, do you see any other gateways that you did not see as the API Manager?

You can manage the development gateway (based on the grants), but you may just be able to see one or more other gateways without being able to act on them.  

Select the Development Gateway and review what each icon on the left-hand column shows you.

When you get to the Deployments tab, review the deployments and each status.  Look for the deployment in Requesting state.  Hover over that deployment request, you can expand it and see what the API looks like and then approve the deployment request.  In practice, the person approving the API would review it first to make sure it is eligible to be deployed.  You can add any comments you see fit when asked.
3.3 Issue the Deploy to Gateway Grant
You now have experienced the ability to request and approve an action.  To save time, let’s go ahead and grant your api-manager-user-<nn> user the ability to go ahead and deploy to the development gateway, it is a development gateway after all.

Note, in practice, you would probably grant to the API Manager Users group, but don’t do that now, otherwise you grant for all of your classmates!  Do you know why somebody might grant to the group?  Do you know why somebody might not want to grant to the group?

 
To issue the Deploy to API grant to your API Manager user:
1.	On the Gateways tab, click Development Gateway.
2.	Click the Users tab.
  
3.	Click Deploy to Gateway (note: the screenshot below may vary in already assigned grants).
 
4.	Click Add Grantee.
5.	Select api-manager-user-<nn>, and then click Add.
 
6.	Sign out of the Management Portal by clicking api-gateway-user-<nn> to expand the user menu, and then click Sign Out.
 


 
3.4: Invoke the API
Now that the API is deployed, you can invoke it in your favorite REST client. 
1.	URL: http://oc-129-144-149-144.compute.oraclecloud.com:7001/ticketServiceTokyo<nn>/1/tickets
a.	Note: replace <nn> with your student number.
2.	Verb: GET
3.	Headers (optional):
a.	Accept: application/json
 
Click Send.

 

Because you have not applied any policies, the request is passed to the backend service without further validation.  This is simply the “proxy pattern”. You should have received a response like the above screenshot. 

Later you’ll add policies and send additional requests to validate each of the policies you’ll add.
