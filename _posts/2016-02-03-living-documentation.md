---

layout: post
title: "Architecture as Code"
description: "Configuration is a concern that needs to be separated"
category: Dependency Injection
tags: [.NET, Visual Studio, SoC, Dependency Injection, C#]
published: true

---

Goals:

* Generate architecture diagrams from code
* Have a place for design information
* Visualise technical depth


Listen to [this talk from Simon Brown about Software Architecture as Code](https://www.youtube.com/watch?v=W2hagw1VhhI).

[Here is a whitepaper on (just enough) risk-driven architecture](http://static1.1.sqspcdn.com/static/f/702523/9359219/1289413590470/201011-Fairbanks.pdf?token=S3TtgslSp14YaQPT%2FtYEqKUE%2BKg%3D) 

Here's some thoughts on generating living documentation in the context: 
* Agile
* Continuous Delivery / DevOps (everything is automated) 
* Microservices architecture (multi-repository)  

Code is the embodyment of the software architecture (or of technical depth respective to the goal architecture).

Why use code to store fact, knowledge, decisions. 



You can generate diagrams and use the information to enhance the diagrams. 

Imagine you can draw a component or class diagram and show in red where technical debt is.

Contents:

* Functional rationale
* Functional specification (by example?)
* Componenent diagrams
* Class diagrams
* Glossary

General ways to do this

* Work in version control
* Work in a declarative fashion when possible
* **Have your code reflect the abstractions that you use to explain the system** 
* Put design information in documentation or annotations on code elements.
* Generate diagrams from code elements
* Use design information to supplement your diagrams.
* Use inventory files to generate deployment diagrams
* If needed, add some first class entities to your code base to represent levels of your documentation that are not represented in code. 

# Functional rationale

In many cases, a rationale (bussiness case) is specified per project/change, which does not often reflect a single component. 

You have a number of choices here:

* Split it up and put parts of the rationale on different components.
* ???


# Functional specification

Use features from your automated tests to describe the system in a user story kind of fashion. 

# Logical view

Containers

(Services, (runtime) components, layers)

# Development view

Classes, namespaces, projects, packages and dependencies on all of these levels can be generated from the code. You could use a Roslyn analyser combined with an online tool like [YUML](http://yuml.me) to generate these images.

You could generate a java-doc like documentation and add an UML-class diagram per namespace (with external dependencies).

# Deployment view

Use a declarative 'inventory' that maps knowns machines by role, and that maps these roles to applications.



# Test some diagrams

![Alt text](http://g.gravizo.com/g?
digraph a {
    a [shape=record, label="pietje"]
    a -> b;
    b -> c -> d
}
)

# Risk-driven architectural concepts

If you want your code to reflect the abstractions of your architecture, you should not only have concepts like: 
* Context
* (Internal/External) System
* Container
* Component
* Class

but also:

* Risk
* Technique
* Rationale (couples Risk to Technique)

![Alt text](http://g.