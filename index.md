---
layout: page
title: Index
tagline: Dealing with complexity in writing code.
---

<h2 class="ui header">Recent posts</h2>
<div class="ui relaxed divided  list">
  {% for post in site.posts %}
          <div class="item">
            <i class="large github middle aligned icon"></i>
            <div class="content">
              <a class="header" href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
              <div class="description">{{ post.description }}</div>
            </div>
          </div>
  {% endfor %}
</div>


