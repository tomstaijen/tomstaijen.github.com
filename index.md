---
layout: page
title: Index
description: Make software better, faster! 
---

Do you accept that your contracter delivers a house with a leaking roof? No. So why do we accept software that is broken as normal. It does not have to be. 

Let's start by realising that it can be done. And we, from the software industry, should take responsibility ourselves; not blame our customers. 

<h2 class="ui header">Recent posts</h2>
<div class="ui relaxed divided items">
  {% for post in site.posts %}
          <div class="item">
            <i class="large file code outline icon"></i>
            <div class="content">
              <a class="header" href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
              <div class="description">{{ post.description }}</div>
              <div class="extra">
                <span class="date">{{ post.date | date_to_string }}</span>
              </div>

            </div>
          </div>
  {% endfor %}
</div>


