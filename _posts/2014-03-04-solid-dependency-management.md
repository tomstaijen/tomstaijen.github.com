---
layout: post
title: "Continuous Delivery of Windows Services with Topshelf"
description: "Deploying windows services with robocopy"
category: Continuous Delivery
tags: [.NET, Visual Studio]
published: false

---


### Why bother / symptoms

* Your solutions takes a lot of space
* You run into circular dependencies
* Your projects need a lot of references
* Moving classes between projects becomes a pain


### The layered architecture

Instead of writing expensive integrations with the components in the lower layers, you could argue that a dependency on the core libraries of your lower layers is allowed. However, it is advisable to keep the number of components to a minimum. 
