# Deploying an API
An API must be deployed to a gateway.  After successfully deploying the API, it receives requests at the endpoint you've configured and routes successful requests to the backend service. 

## Before you begin
- You have an API Platform environment.  See [environments](../../../environments/README.md) for details on procuring an API Platform environment.
- You have completed the tutorial [Creating an API Policy Implementation](../../manage/create_api)
  - You have the credentials of the user who created the API or a user who has the appropriate grants to *Deploy* or *Manage* the API.
- Your environment has at least one gateway deployed and the user who will deploy the API to the gateway has the  appropriate grant to [request deployments](../../gateways/grants) to that gateway.  Typically a user with the *API Manager* role
- You have the credentials of the user who can [deploy to the gateway](../../gateways/grants).  Typically a user with the *Gateway Manager* role.
  
## Deploy your API
To deploy the API:
1. Log into your API Platform management portal as the user who created the API
1. Choose the API you wish to deploy
1. Click the Deployments tab.
1. Click Deploy API.
1. Choose a Gateway
1. Select Active as the Initial Deployment State.
1. (Optional) Complete the description field in as you like.
1. Click *Deploy*.

Observe what the state of the deployment is in.  Is it Deployed?  Requesting Deployment? Waiting? or Failed?

## Completing the Deployment
If your API is in *Requesting*, then your user has the *Request Deployment to Gateway* grant but not the *Deploy to Gateway* or *Manage Gateway* grant.  If the API is in *Waiting* or *Deployed* then your user has the *Deploy to Gateway* or the *Manage Gateway* grant.  Depending the state, choose the appropriate next steps

### Deployment in *Requesting* state
The attempting to deploy the API has *Request Deployment to Gateway* so the API is in requesting state.  It will not be deployed until a user with the appropriate grant approves the deployment.

#### Approve the Deployment
1. Log into API Platform as a user who either has the *Manage Gateway* or the *Deploy to Gateway* grant(s)
1. Select *Gateways*
1. Choose your gateway
1. Select the *Deployments* side-tab
1. Select the *Requesting* header-tab
1. Expand the details of the request and review the API Implementation
1. Once you are satisfied that it can be deployed, hover over the request and click the *Approve* button
1. Add comments about your deployment approval and click *Yes*
1. Watch the request transition from *Requesting* to *Waiting* to *Deployed*

### Deployment is in *Waiting* or *Deployed* state
There is no further action.  If it is in *Waiting* then it should transition to *Deployed*.  
 
## Test the API (optional)
Now that the API is deployed, you can invoke it in your favorite REST client.

## Conclusion
In this tutorial you learned how to:

- Deploy an API
- How to approve a Deployment Request
