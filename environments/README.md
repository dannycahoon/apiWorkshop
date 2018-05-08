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

## Choosing which environment you will use
If you are in an instructor-led event, your instructor may advise you which environment you may use.  The available options are

### PM Demo Environment
An environment that is always patched and used for general demos.  Easiest to begin using, but there are limits as this is a shared environment.  This is a great option for first-time users or for quick demos.

To learn more, visit [PM Demo Environment Details](./pmDemo.md)

>Note: Whenever there is a link, open it in a new tab (right-click->"Open Link in New Tab").  This way you will maintain your place this lab guide without having to re-orient yourself after completing a task from a linked tutorial, etc

## GSE Demo Central
An environment that is provisioned to you under demo.oracle.com.  This is a short-term environment, that does require you to set up your gateway, but you have much more control and can dig deeper into API Platform CS.

To learn more, visit [GSE Demo Central](./gseDemo.md)

>Note: Whenever there is a link, open it in a new tab (right-click->"Open Link in New Tab").  This way you will maintain your place this lab guide without having to re-orient yourself after completing a task from a linked tutorial, etc

## Internal environment options (Oracle Employees only)
There are some environment options available internally to Oracle Employees that require VPN access.  

Visit [Internal Environments](https://stbeehive.oracle.com/teamcollab/wiki/API+PLATFORM:Internal+Environments) for internal environment options.
