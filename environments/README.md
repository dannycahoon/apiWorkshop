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
