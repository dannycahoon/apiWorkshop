# Creating an API Policy Implementation
This is often referred to as "Creating an API", however there are many components, from design, documentation, the service implementation and the policy implementation.  What we are talking about here is as the API Manager, you will create and define the API.  It is from this point that all of the other activities, such as deployment, publication and promotion, access grants, etc are launched.  Perhaps this is why we often say "Creating an API"   

## Before you begin
1. You have an API Platform environment.  See [environments](../../../environments/README.md) for details on procuring an API Platform environment.
1. You have completed the tutorial [Designing an API](../../design/design_api)

## Creating the API
### Log into API Platform Cloud Service
1. Point your browser to the management portal URL. 

> This URL is based on the [environment](../../../environments/README.md) that you have selected but it will take the form of `http(s)://<host>:<port>/apiplatform`

1.  Log in as a user that has the *API Manager* role.  

### Create a new API
1. Make sure you are on the *APIs* menu.  You should see *APIs* in the upper left-hand side as well as a *Create API* button on the right-hand side.  If you don't see this, select the menu button on the left and then select *APIs*
 
1. Click the *Create API* button
 
1. Provide a name such as _TicketService_ and a version for your API.  You can also provide a description.
 
> If you are using a shared environment, your API may already be created.  You can elect to modify the name such as add your initials so you know which API is yours

Once your API is created, you will see it in the list of APIs.  Go ahead and click on the API name to continue editing it.

#### Select the specification (optional)
On the API Specification tab (left-hand side), you can choose your API design that you created in Apiary during the [Designing an API](../../design/design_api) lab.  

> You must have an Apiary team in order to link to the specification directly.  If you are using the free Apiary developer account, you can skip this step
 
#### Select and configuration implementation policies
On the API Implementation tab (left-hand side), you will be presented with a request and a response pipeline.  Beginning with the request pipeline, you will see an *API Request* and a *Service Request*.  

 - The API Request is the location at which developers who consume your APIs will send their requests. This end-point resides on the gateway on which the API is deployed. You will deploy the API later.
 - The Service Request is the location of the backend service. If all policy conditions are met, this is the location to which the gateway passes the request.

##### Configure the API Request
The API request is the endpoint to which requests for your API are sent.  The full address to which requests are sent consists of the protocol used, the gateway hostname, the API request endpoint, and any private resource paths available for your service. For example: http://<host>:<port>/ticketService/1/tickets
	
where:
  - http is the protocol over which the gateway receives requests
  - `<host>:<port>` is the hostname and port of the gateway instance this API is deployed to
  - ticketService/1 is the API endpoint you chose (currently this is hard-coded as /the API name/its version).  
  - /tickets is considered the private resource path of the API. Anything beyond the API endpoint is passed to the back-end service.

To configure the API Request:
1. Hover over the API Request policy, and then click Edit.
1. On the Apply Policy Dialog, complete these fields:
  1. Add a comment about the request (_optional_)
  1. Select HTTP from the Protocol list. This is the protocol on which the gateway receives requests for this API.
  1. Enter the _API Endpoint URL_.  For example ticketService/1 (apiName/version).  If you choose an endpoint that is already being used, then make the endpoint unique by adding your initials (e.g. rw/ticketService/1)
  1. Once you are finished, click *Apply*

##### Configure the Service Request
The service request is the URL at which your back-end service receives requests. When a request meets all policy conditions, the gateway routes the request to this URL and calls your service.

The service request URL can point to any of your service’s resources, not just its base URL. This way you can restrict users to access only a subset of your API’s resources.

To configure the service request:
1. Hover over the Service Request policy, and then click Edit.
1. Policy Dialog, choose to enter a URL:
  1. Enter the Apiary Mock Service URL from [Designing an API](../../design/design_api) in the back-end Service URL field.
  1. Remove the “/tickets” from the mock-service URL so the API can be designed to call multiple end-points such as “/incidents”
1. Leave the Service Account as None
1. Click Apply.
1. Click Save Changes.

## Conclusion
In this tutorial you learned the following:
  * How to create an API in API Platform Cloud Service

#### Next Steps
 - [Deploying an API](../deploy_api)