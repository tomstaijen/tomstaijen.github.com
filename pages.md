---
layout: page
title: Pages 
header: Pages
group: navigation
---
<h2 class="ui dividing header">Recent posts</h2>
<div class="ui selection list">
    {% for page in site.pages %}
          <div class="item">
            <a href="{{ BASE_PATH }}{{ page.url }}">{{ page.title }}</a>
          </div>
    {% endfor %}
</div>

`​`` html
<a href="#">Hello world</a>
`​``