---
layout: post
title: "AOP with Autofac"
description: ""
category: 
tags: []
---
{% include JB/setup %}

Aspect-oriented software development 

## Separation of Concerns

## Properties of a proper AOP approach

One could distinguish AOP-approached by the following attributes

- **Obliviousness** An aspect should contain the full specification of its behavior and application condition (joinpoint specification and advice). 

- **Rubustness** An aspect should not break immediately when, in a target class, the name of a method is altered. This is called the *fragile aspect problem*. Rather, changing the name of an element used in a pointcut  should cause the whole source-code to fail compilation. We could achieve this by using strongly-typed languages properties.

## A different look: exporting behaviour rather then importing

Another way to look at the difference between object-oriented and aspect-oriented languages is the way concerns are composed. 

- In object-oriented programming, objects *import* behaviour from other modules/concerns by invoking their methods. 

- In aspect-oriented programming, aspects *export* their behavior to other modules. 

## Using a Dependency-Injection container for AOP



## AOP with Autofac: the de-facto example
Let's start with a pieve of *base program*. 
{% hightlight csharp %}

