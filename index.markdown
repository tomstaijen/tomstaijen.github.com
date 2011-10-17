---
layout: page
title: Welcome
---

# Markdown showdown
This is a testpage for css-ing markdown generated html.
## Heading 2
This will be the best blog ever.

### Paragraph madness
Dit is een *paragraaf* met daarin *cursieve* tekst.

Below this paragraph is a `<hl>`.

---

Dit is nog een paragraaf. Dit is best wel **vet** zeg. En je kunt het ook ***combineren***!.

> ### Quote:
> Deze tekst moet in een blockquote komen, omdat ik hier graag een lijntje omheen wil zien.
> Daarnaast moet het inspringen en hoort het bij elkaar. 

{% for post in site.posts %}
+ {{ post.date | date_to_string }} [{{ post.title }}]({{post.url}})
{% endfor %}

Linkje <http://tomstaijen.github.com>

Code test

`dit is een simpele regel code`

Nog een code test

    What happens now? <can><i><just> type anything?
	
OMG
:	Oh My God