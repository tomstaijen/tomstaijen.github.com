---
layout: post
title: "Continuous Delivery of Windows Services with Topshelf"
description: "Deploying windows services with robocopy"
category: Continuous Delivery
tags: [.NET, Continuous Delivery]
---
{% include JB/setup %}

> **Background**
> Recently, our team started implementing a [deployment-pipeline](http://continuousdelivery.com/). 
> While already using Jira and Bamboo - with Rake and Albacore for the specification of tasks -
> a lot of the requirements were implemented quickly. 
> However, deploying a windows service was found a less trivial task. Untill now.


An application you like to deploy from a continuous delivery requires a number of basic controls, namely:

 - Start/Stop
 - Deploy/Undeploy (Install/Uninstall)
 - Check if it is running (the smoke test, general monitoring)

Furthermore, while our windows services are composed of a number of scheduled jobs, i like to be able to query those. 

While this is easy for web applications running under IIS with web deploy, doing this for windows services requires quite a lot of extra trouble, since the install/uninstall-commands need to be run on the server.

With topshelf this becomes as trivial as it should be.

### Topshelf

[Topshelf](http://topshelf-project.com/documentation/shelving/) consists of a number of components that make it very easy to control windows services. The Topshelf Host program can be run as a console application and can be installs as a windows service. Once started, this host program monitors its 'Services' directory for activity, and acts accordingly:

- When a directory is added, it scans for a service-interface', and starts it.
- When a directory is removed, the corresponding service is stopped.
- When the service in a directory is replaced, the services is stopped, reloaded and started again.

While this is very basis, topshelf offers a very more features that make this product especially valuable. Topshelf comes with a deshboard that includes a [rest api](http://igorshare.wordpress.com/2012/04/11/controlling-topshelf-via-rest-interface-dashboard/). This api allows us to query the installed services and their states, and actions to start or stop these services. 

### Continuous Delivery

This easily translates to a number of usage scenarios:

- The rest api can be used as a smoke test. A more thorough one could be required to check if the service is actually running. However, for an initial setup, the service-status will do just fine.
- On a database migration (without a software version upgrade), we might simple stop all running services (instead of having to delete the windows service to stop it. Can we even do this easily for IIS applications.

### Missing feature

A highly valued feature that we might actually implement soon, is a REST function to gives a 'summary' of a specific service through the rest api. Having a horizontally-scaled job-based background-work architecture, this allows us to monitor the status of all jobs in our application, i.e. on a wallboard or dashboard.  