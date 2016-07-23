---

layout: post
title: "Association, Aggregation, Composition"
description: "If you just can't remember, write it down somewhere."
category: UML
tags: [UML, Design, OOP]
published: true

---

There's these details you just can't remember, or not precize. Sure, association is easy. And one of the others is similar to association, but what's the actual difference again? And the other one has to do with lifetime. Sigh. To end it once and for all: type your own set of examples. So here are mine.

# Association

In an association, the objects have their own lifecycle and there is no ownership.

The association merely states that the objects can exchange messages. The direction of messages is expressed using navigability (arrowheads).

![Association](http://yuml.me/diagram/scruffy/class/
    [Client]->[Session]
)

# Aggregation

In the aggregation, there is ownership in the sense that the part can only be used by one owner. However, lifetime is decoupled. The owner can be destroyed while the part lives on (and may become part of another owner). 

![Aggregation](http://yuml.me/diagram/scruffy/class/
    [Department]<>->[Manager]
)

#Composition

In a composition, there is ownership and the owner is responsible for the lifetime of its property. When the whole is destroyed, the parts are also destroyed.

![Composition](http://yuml.me/diagram/scruffy/class/
    [Pile]++->[]
)