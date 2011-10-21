---
layout: default
---

# Welcome


{% for post in site.posts | limit 3 %}
*	[{{ post.url }}]({{ post.title }})
{% endfor %}