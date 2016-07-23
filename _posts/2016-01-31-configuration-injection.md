---

layout: post
title: "How to properly use ConfigurationManager"
description: "Or better yet, don't use it at all"
category: Dependency Injection
tags: [.NET, SoC, Dependency Injection, C#]
published: true

---

It's an easy mistake to have your logic take a configuration option straight from the configuration file, for example using a piece of code like:

{% highlight c# %}
var section = ConfigurationManager.GetSection("appSettings");
var hostname = section.Get("hostname");
{% endhighlight %}

There's couple of reasons to not do that:

- It gets harder to unit test the piece of code: you're going to need a configuration file to property run the test. It's hard to control the property's value from the setup of the unit test.
- Your logic demands something from it's runtime container, which is bad for reuse.
- You're mixing responsibilities, namely the logic your class is responsible for and the Configuration concern. If your logic needs a parameter it should be passed to your logic from the outside, either through the contructor, through the method usage (e.g. a method call), or by requesting the value through some interface.

