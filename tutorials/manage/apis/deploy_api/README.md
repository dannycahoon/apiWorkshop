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
### Identify the URL to use
In order to invoke your API, you need to identify the URL.  To do this, you can view the deployment.  You can do this at the API level or the Gateway level depending on the user you are logged in as.
#### API Gateway Manager
If you are logged in as a user who manages the gateway, you can view the URL from the Deployments tab of the gateway
1. Select Gateways
1. Select your Gateway
1. Click the *Deployments* left-tab
1. Make sure the *Deployed* top-tab is highlighted
1. Find your API
1. Notice the *Load Balancer URL* and the _copy_ icon next to it.  You can click the _copy_ icon to copy the URL into your buffer

#### API Manager
If you are logged in as a user who manages the API, you can view the API URL from the Deployments tab of the API
1. Select APIs
1. Select your API
1. Click the *Deployments* left-tab
1. Make sure the *Deployed* top-tab is highlighted
1. Find the gateway (one API can be deployed to multiple gateways)
1. Notice the *Load Balancer URL* and the _copy_ icon next to it.  You can click the _copy_ icon to copy the URL into your buffer

### Invoke the API
Choose your favorite REST client.  For this exercise, you could simply use a web-browser because it is a simple _GET_ request. 
- Define the URL to be the *Load Balancer URL* you captured in the previous step, plus the resource.
  - Example: http://'<host>':'<port>'/ticketService/1/tickets 
- Verb: GET
- Headers (optional):
  - Accept: application/json
- Send the request to the API


Because you have not applied any policies, the request is passed to the backend service without further validation.  This is simply the “proxy pattern”. You should have received a response similar to the following. 
```
           {
              "_items": [
                {
                  "customer": "ACME Corp",
                  "status": "Resolved",
                  "product": "Widget",
                 "_id": "589a3774ebee507f7268bcff",
                 "_updated": "Tue, 07 Feb 2017 22:05:38 GMT",
                 "summary": "Customer reports the widget stopped working",
                  "_links": {
                    "self": {
                      "href": "tickets/589a3774ebee507f7268bcff",
                      "title": "Ticket"
                    }
                  },
                  "_created": "Thu, 01 Jan 1970 00:00:00 GMT",
                  "ticketID": "45001",
                  "_etag": "bd584d9a460eabdc979e428e1e0220923b0c5793",
                  "subject": "Widget stopped working"
                },
                {
                  "customer": "ACME Corp",
                  "status": "Unresolved",
                  "product": "Widget",
                  "ticketID": "45002",
                  "_updated": "Tue, 07 Feb 2017 21:44:21 GMT",
                  "summary": "Customer reports the widget stopped working",
                  "_links": {
                    "self": {
                      "href": "tickets/589a3fb534605c000176ef5f",
                      "title": "Ticket"
                    }
                  },
                  "_created": "Tue, 07 Feb 2017 21:44:21 GMT",
                  "_id": "589a3fb534605c000176ef5f",
                  "_etag": "cfe52a36fa7a1c738acc994f6e49a8f3f86ce4bf",
                 "subject": "Widget stopped working"
                },
                {
                  "customer": "ACME Corp",
                  "status": "Unresolved",
                  "product": "Widget",
                  "ticketID": "45002",
                 "_updated": "Tue, 07 Feb 2017 21:44:37 GMT",
                  "summary": "Customer reports the widget stopped working",
                 "_links": {
                   "self": {
                     "href": "tickets/589a3fc534605c000176ef60",
                     "title": "Ticket"
                   }
                 },
                  "_created": "Tue, 07 Feb 2017 21:44:37 GMT",
                  "_id": "589a3fc534605c000176ef60",
                  "_etag": "dbcf344b1bcaf9fc6781846ed944d147a875394c",
                  "subject": "Widget stopped working"
                },
               {
                 "status": "Resolved",
                  "_updated": "Tue, 07 Feb 2017 21:57:59 GMT",
                  "_links": {
                    "self": {
                     "href": "tickets/589a4133fbcb600001ac564b",
                      "title": "Ticket"
                   }
                 },
                 "_created": "Tue, 07 Feb 2017 21:50:43 GMT",
                 "_id": "589a4133fbcb600001ac564b",
                 "_etag": "a8706300f0a38c1d6aa871901475d2f7a9e29e1d"
               },
               {
                "customer": "Smithers Corp",
                "status": "Unresolved",
                "product": "Idea tablet",
                "ticketID": "45003",
                "_updated": "Sun, 12 Feb 2017 21:28:52 GMT",
                "summary": "When powering up unit, the display is blank",
                "_links": {
                 "self": {
                    "href": "tickets/58a0d394e0577b0001bcc981",
                    "title": "Ticket"
                    }
                 },
                 "_created": "Sun, 12 Feb 2017 21:28:52 GMT",
                 "_id": "58a0d394e0577b0001bcc981",
                 "_etag": "7a898301b641f1f28dbcf69a6c0dfadf292d6861",
                 "subject": "Display blank"
               }
             ],
              "_links": {
               "self": {
                 "href": "tickets",
                "title": "tickets"
              },
              "parent": {
                "href": "/",
                "title": "home"
              }
            },
             "_meta": {
               "max_results": 25,
               "total": 5,
              "page": 1
             }
            }
```
## Conclusion
In this tutorial you learned how to:

- Deploy an API
- How to approve a Deployment Request
