---
layout: default
title: Blurp
---

#Markdown reference and css showcase

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra, justo et faucibus rutrum, arcu nisi commodo nulla, et cursus urna elit vel tortor. Proin scelerisque eleifend velit, ac pharetra justo pellentesque ac. Cras sed tortor a lorem ultrices eleifend. Nulla iaculis aliquam augue sit amet ultricies. Aliquam et quam nisi, in sodales turpis. Curabitur a ligula dui, eget fermentum metus. Curabitur ullamcorper pulvinar tortor, in porttitor eros auctor et. Nunc dignissim volutpat eleifend.

##Heading 2.1
Phasellus mollis placerat mattis. Aliquam pharetra rutrum velit, quis dictum ligula rutrum ut. In hac habitasse platea dictumst. Pellentesque pharetra eleifend quam, id aliquam nisi fringilla et. Suspendisse euismod, nibh quis aliquet imperdiet, justo sem feugiat felis, in sollicitudin justo turpis eget mi. Quisque eu ipsum nibh. Vivamus viverra arcu in magna luctus dapibus. Suspendisse potenti. Sed elementum dui in massa vestibulum et viverra nisi egestas. Vivamus sit amet metus massa. Nunc non purus lacus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur vitae imperdiet sem.

Donec quis turpis sed nunc viverra faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vestibulum rutrum varius. Aliquam quis sapien arcu, sit amet imperdiet lectus. Praesent blandit aliquam tellus id molestie. Nullam mollis metus eu est faucibus tincidunt pretium nunc dignissim. Fusce sed nulla ligula.

##Heading 2.2
Aenean elit erat, tempus a tincidunt dapibus, porttitor non diam. Morbi sed metus libero. Quisque sapien odio, faucibus a facilisis sed, adipiscing at urna. Fusce lobortis, risus eget ullamcorper semper, diam erat interdum nisi, ac tincidunt libero purus at ipsum. Aenean augue tellus, tempus vitae venenatis vel, imperdiet vel tortor. Suspendisse tincidunt, turpis vitae ultrices ullamcorper, odio magna commodo tortor, eget fermentum purus magna quis ante. Integer odio neque, suscipit eget dictum at, dictum non massa. Nulla faucibus sapien ac velit imperdiet faucibus euismod sed arcu. Pellentesque vulputate venenatis magna, id laoreet libero egestas id. Integer ornare tincidunt bibendum. Nullam aliquam mattis mauris id pharetra.

### Paragraph
Sed id velit enim. Nunc porttitor semper ligula a molestie. Phasellus non sem justo, vel convallis odio. Curabitur aliquam nulla quis risus lacinia hendrerit at aliquam quam. Proin consectetur mattis magna, eu fringilla ligula adipiscing pharetra. Aenean non condimentum mi. Nulla mollis magna sagittis nibh auctor pharetra. Phasellus tempus dictum lacus, id ornare sapien adipiscing quis. In lacus ipsum, feugiat ut convallis vel, tempus quis lectus. Aliquam mollis feugiat lacus. Donec congue tempus lectus, in lobortis nisl ullamcorper nec. Proin vitae quam felis, quis tempus urna. Nullam consequat leo et enim fermentum vitae placerat risus pulvinar. Curabitur ornare, velit et egestas laoreet, tellus quam vulputate nibh, vitae posuere quam orci sed mauris. Cras molestie, arcu nec mollis elementum, nibh turpis commodo erat, eget tincidunt nibh eros id tellus.

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