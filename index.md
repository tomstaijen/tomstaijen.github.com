---
layout: page
title: Separation &amp; Composition
tagline: Dealing with complexity in writing code.
---

This blog is about the delivery of high-quality software. An important realization is, that this can have a different meaning in every project. 

### Separation & Composition
In writing quality software, two very important factors are the ability to separate concerns (i.e. to specify each concern as a separate code module) and then to compose their behaviors in a clean and maintainable way. This will benefit a lot of quality attributes: 

- Readability (which also leads to:)
- Maintanability
- Testability

Among other things, I see it as an important duty as a Software Architect to explore possibities in achieving this separation and composition, learn to apply them properly, and teaching others to do so as well. On this blog I post about my findings. Most of it will target the .NET platform. 

### Delivery
Another important property of software quality on this part is on Continuous Delivery. Automating the surroundings of a developer's environment is an important factor. It will give a develop feedback on his work, which in turn will result in better code. Furthermore, the delivery process itself has to be of high quality. Without being able to deliver the software, we might just as well not build it. 
 
### Posts

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

