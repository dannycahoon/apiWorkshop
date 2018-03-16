# Creating a Plan
An API Plan governs access of an Application to an API whenever the API is enforcing the use of an application key.  It is important to understand that some APIs might not enforce the use of an application key which while the API could be entitled into a plan, all usage would be tracked under the *Unknown Application*.  

APIs that use the *Key Validation* policy, require an application key for an application that is entitled to a plan that the API is also entitled to.

## Before you begin
- You have an API Platform environment.  See [environments](../../../environments/README.md) for details on procuring an API Platform environment.

## Create your plan
### Log into API Platform Cloud Service
1. Point your browser to the management portal URL as described in your chosen environment. 

> This URL is based on the [environment](../../../environments/README.md) that you have selected but it will take the form of `http(s)://<host>:<port>/apiplatform`

1.  Log in as a user that has the *Plan Manager* role.  

### Create a new Plan
1. Make sure you are on the *Plans* menu.  You should see *Plans* in the upper left-hand side as well as a *Create Plan* button on the right-hand side.  If you don't see this, select the menu button on the left and then select *Plans*
 
1. Click the *Create Plan* button
 
1. Provide a name such as _DeveloperPlan_ and a version for your plan.  You can also provide a description.
 
> If you are using a shared environment, your Plan may already be created.  You can elect to modify the name such as add your initials so you know which Plan is yours

Once your plan is created, you will see it in the list of plans.  Go ahead and click on the plan name to continue editing it.

1. Select the *Settings* side-tab

You can choose to leave the plan as unlimited, or set the rate limits.  To keep with the _DeveloperPlan_ model, set a limit as follows:

TODO: Continue Building...
## Conclusion
In this tutorial you learned the following:
  * How to create an Plan in API Platform Cloud Service

#### Next Steps
 - [Entitling an API](../entitle_api)