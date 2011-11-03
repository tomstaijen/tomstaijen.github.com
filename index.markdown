---
layout: default
---
{% for post in site.posts | limit 1 %}
# {{ post.title }}

{{ post.content }}

{% endfor %}


{% for post in site.posts | limit 10 offset 1 %}
+ {{ post.date | date_to_string }} [{{ post.title }}]({{post.url}})
{% endfor %}