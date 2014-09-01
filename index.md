---
layout: page
title: Separation &amp; Composition
tagline: Dealing with complexity in writing code.
---

<h3 class="ui header">More articles</h3>

<div class="ui inverted animated selection list">
  {% for post in site.posts %}
          <div class="item">
            <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
            <div class="right floated">{{ post.date | date_to_string }}</div>
          </div>
  {% endfor %}
</div>
