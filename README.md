# API Platform Cloud Service Tutorials
This is the place to learn all about API Platform!  Here you will find our repository of tutorials that are aimed to help you on your path to be an expert.  

## What is a tutorial?
A tutorial is a small lesson that walks you through the process of performing a particular task.  For example [Designing an API](./tutorials/design/design_api)  

Think of a tutorial as the *how to perform a task*

## What is a scenario?
A scenario the story or use-case that provides a path through the tutorials.  Think of a scenario as the *what and why*

## Suggested approach
The overall structure of this training can be thought of as

- Scenario
  - Tutorials
    - Screencasts (coming soon)

As you begin with the scenario, you may visit the linked tutorials for guidance, but we suggest you try to push yourself to use the application with only just enough guidance that you might need.  **Don't blindly follow the steps of a tutorial.**  As a matter of fact, there are some tasks that naturally get repeated, such as deploying an API as you make changes.  The first time you deploy, you may need to use the tutorial, but the second and subsequent times, try to do it without the tutorial so you can test yourself and confirm if you are comprehending what this training is teaching you.

We plan to record each tutorial in a short screencast so that if you need to see it being done, or you simply want to validate that you've followed the task correctly, you can use these videos.  Again, don't hesitate to push yourself by attempting to complete the task, then use the tutorial to validate your understanding.

## Questions
If you have any questions about these tutorials or API Platform CS, follow the path below:

### Oracle Employees
1. Visit http://my.oracle.com/go/apipcs for a wealth of information about API Platform CS
1. Use the FAQ that you will find on the above site.

### Non-Oracle Employees
1. In the Developer Cloud Service instance where you are accessing this content, navigate to Issues.  Create a new Issue, describing your issue/question.  Make sure you provide your e-mail address in the description and assign the issue to *Robert Wunderlich*

## Trainers
When conducting and instructor-led event, there are a few steps that you need to complete in order to prepare.

### Pre-event setup
1. Choose the environment you will use for your training event
  1. You can visit ./environments to learn about the options
  1. Create a ppt, or other medium that provides an overview of API Platform and this training.
    1. In your ppt, you can include the getting *Accessing Content* section below, or plan to either write it up a whiteboard, etc, or pull up this page to present to your audience.
  
### Kick-off the event
1. Introduce API Platform and the training
1. If you chose the 
1. Direct your attendees to scenario in Developer Cloud Service by completing the following:
  1. Point your browser to: http://bit.ly/APIWarrantyClaim
    1. When asked for the domain, enter: *partnerpaas18*
    1. Log in as user: *apipartner*
    1. The password is: *Aut0nomou5!* (Aut-zero-nomou-five-!)

#### Using the PM Demo Instance
It is best to provision your own instance using GSE, trial or other means, but we do maintian a *PM demo instance*

The *PM demo instance* is the simplest to use, but you should be aware that anybody can use it!  You need to come up with a way to segment your attendees work.

If you plan to use the *PM demo instance*, you will need to assign a sequence number to each attendee.  Each attendee will append this sequence to the username and to the password.  For example an attendee who has been assigned the sequence number of "1",  would log in as Follows:
- User: api-manager-user-**1**
- Password: OracleiPa$$Us3r**1** 

> Note: You should come up with an additional string to further segment the work in your event, such as the city/location, etc.  For Example, if I were presenting this in Orlando and their student sequence, I might advise my students to add "Orlando" (e.g. TicketService**Orlando1**)
