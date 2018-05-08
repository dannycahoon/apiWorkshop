# PM Demo Environment
A [demo environment](https://oc-129-150-76-122.compute.oraclecloud.com/apiplatform) is maintained on Oracle Public Cloud.  You must not be connected to an internal Oracle network through VPN or within an Oracle office (except clear-guest).

> Note: If you are participating in an instructor-led event, your instructor may provide you with a sequence number and details on the user credentials you would use to access this instance.  If you are accessing this through self-study (not been given any sequence/user credentials) then you can use the generic accounts below.  Typically this is appending the sequence to the user name and password.  For example if your instructor assigned you the number "1", you would use api-manager-user-**1**, the passwords are OracleiPa$$Us3r**1** with the corresponding sequence number

Here are the following generic users and passwords that are shared.
* API Manager: api-manager-user/OracleiPa$$Us3r
* API Gateway Manager: api-gateway-manager/OracleiPa$$Us3r
* APP Developer User: app-dev-user/OracleiPa$$Us3r
* Service Manager: service-manager-user/OracleiPa$$Us3r
* Plan Manager: plan-manager-user/OracleiPa$$Us3r

**You do not have full admin rights to this environment.**  Not all tutorials will work here.  For example, a tutorial involving grants may run into conflicts given the shared nature of this environment.

When you use this environment, you need to be aware that others may be creating objects using the same credentials.  This environment is intended for you to be able to quickly try and demo the product.  It should not be used for deep-level admin/granting work.  If you use this environment, we highly recommend you add identifying elements to all of the objects you create in a tutorial.  For example, if the tutorial tells you to create an API named "TicketService", you might try creating "TicketService+your initials" (e.g. TicketServiceRW). 

When you create a request policy, you need to make sure you differentiate it.  When you deploy to a gateway, the end-point must be unique.  We suggest simply adding a date and your initials.  So for example if a tutorial suggests /ticketservice, you should use /`<date>`/`<your initials>`/ticketservice  (e.g. /180118/rw/ticketservice).  Yes, we know this is long, but it will help you to have a unique end-point so you can play nice with others.  **Remember, this is just needed for the shared PM instance.**  If you are using a VM or GSE, you would not have to differentiate your APIs in order to maintain separation from others using the same account.
